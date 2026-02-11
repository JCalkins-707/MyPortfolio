import { fail, redirect } from '@sveltejs/kit';
import * as THREE from "three";
import obj2gltf from "obj2gltf";
import { PLYLoader } from "three/examples/jsm/loaders/PLYLoader.js";
import { TDSLoader } from "three/examples/jsm/loaders/TDSLoader.js";
import { GLTFExporter } from "three/examples/jsm/exporters/GLTFExporter.js";
import {  readFile, writeFile } from 'fs/promises'; 
import { Buffer } from 'node:buffer'; //recommended by node docs
import { randomUUID } from 'crypto';
import { validateSessionToken } from '$lib/server/auth';
import { getLoggedInUser, requireLLogin } from '$lib/server/account';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';
import { addTagToMetadata } from '$lib/utils/metadata.js';

const MODEL_FILES_PATH = 'static/models/'
const ORIGINAL_FOLDER = 'original/'
const COMPAT_FOLDER = 'compat/'

export async function POST({ request, cookies }) {
     
    //initialize response object
    let response;

    //initialize metadata object
    let metadata = {};

    if (!cookies.get('auth-session')) {
        const headers = new Headers();
        headers.append('Location', '/auth/login');
        response = new Response(null, {
            status: 301,
            statusText: "You must be logged in to upload files.",
            headers: headers,
        });
        return response;
    } else {

        const sessionInfo = await getLoggedInUser(cookies);
        if(!sessionInfo){
            const headers = new Headers();
            headers.append('Location', '/auth/login');
            response = new Response(null, {
                status: 301,
                statusText: "You must be logged in to upload files.",
                headers: headers,
            });
            return response;
        } else {

            console.log(sessionInfo);

            //initialize the filename and the file object
            let filename = randomUUID();
            let extension = '.glb';
            let glb;

            //get the file from the form
            console.log(request);
            const formData = await request.formData();

            //get the model data from the form
            const title = await formData.get('modelName');
            const description = await formData.get('modelDescription') || null;
            const license = await formData.get('license');
            var file = await formData.get('fileInput');
            const tagString = await formData.get("modelTags");

            // convert tagString to array & populate metadata.tags
            if (tagString) {
                const tagList = tagString.split(",")
                    .map(t => t.trim())
                    .filter(Boolean);
                /*
                for (const tag of tagList) {
                    metadata = addTagToMetadata(metadata, tag);
                }
                */
            }

            //handle empty form responses
            if(!file.name) {
                response = new Response(null, {
                    status: 400,
                    statusText: "No file uploaded"
                });
                return response;
            }

            //get buffer from file
            var filedata = await file.arrayBuffer();
            filedata = Buffer.from(filedata);

            //get filename for extension checking
            const name = file.name.toLowerCase(); //TODO: this needs to generate a uuid somehow
            // SQLite is auto incrementing for modelId -- Julia

            try {
                if (name.endsWith(".obj")) {
                    //convert obj
                    
                    // TODO: RESOLVE DEPENDENCY obj2gltf
                    // 'defaultValue' is deprecated
                    // i think we need to include the latest version
                    // from the guy's github as a git module
                    // because the npm version hasn't had an update
                    // in 3 years apparently

                    //glb = await obj2gltf(file.data, { binary : true });
                    //console.dir("past obj2gltf");
                    return fail(400, { message: 'Unsupported file type' }); //for now, blame the user

                } else if (name.endsWith(".stl")) {
                    // TODO: RESOLVE DEPENDENCY stlToGltf
                    //const gltf = await stlToGltf(file.data, { binary: true });
                    //glb = Buffer.from(gltf);

                    return fail(400, { message: 'Unsupported file type' }); //for now, blame the user

                } else if (name.endsWith(".glb") || name.endsWith(".gltf")) {

                    if (name.endsWith(".gltf")){
                        extension = '.gltf';
                    }

                    // create buffer from file's arrayBuffer
                    glb = filedata;

                } else if (name.endsWith(".ply") || name.endsWith(".3ds")) {
                    //convert .ply/3ds

                    //
                    const loader = name.endsWith(".ply") ? new PLYLoader() : new TDSLoader();
                    const object = loader.parse(file.data.buffer);

                    //I think we are supposed to ultimately end up with an arraybuffer in 'glb'
                    const exporter = new GLTFExporter();
                    await new Promise((resolve) => {
                        exporter.parse(
                            object,
                            (gltf) => {
                                glb = Buffer.from(
                                    gltf instanceof ArrayBuffer ? gltf : JSON.stringify(gltf)
                                );
                                resolve();
                            },
                            { binary: true }
                        );
                    });
                } else {
                    return fail(400, { message: 'Unsupported file type' });
                }
            } catch (err) {
                console.dir(err);
                return fail(500, { message: 'internal server error' });
            }

            for (const entry of formData.entries()) {
                console.log(entry);
            }

            const outfilename = MODEL_FILES_PATH + COMPAT_FOLDER + filename + extension;

            await writeFile(outfilename, glb);

            const insertedId = await db.insert(table.model).values({
                uploaderId: sessionInfo.accId,
                title: title,
                description: description,
                license: license,
                //metadata: metadata,
                filePath: '/' + outfilename})
                .returning({ insertedId: table.model.modelId });

            console.log("logging inserted id");
            console.log(insertedId.at(0).insertedId);

            const modelId = insertedId.at(0).insertedId;

            const tagList = (tagString || "")
                .split(",")
                .map(t => t.trim())
                .filter(Boolean);

            for (const tagName of tagList) {
                const existingTag = await db.select()
                    .from(table.tag)
                    .where(eq(table.tag.name, tagName));

                let tagId;

                if (existingTag.length === 0) {
                    const insertedTag = await db.insert(table.tag)
                        .values({ name: tagName})
                        .returning({ id: table.tag.tagId });
                    tagId = insertedTag[0].id;
                }
                else {
                    tagId = existingTag[0].tag.tagId;
                }

                await db.insert(table.model_tag).values({
                    modelId: modelId,
                    tagId: tagId
                });
            }

            //prepare response to redirect to edit panel
            const headers = new Headers();
            headers.append('Location', '/model/edit/' + insertedId.at(0).insertedId);
            response = new Response(null, {
                status: 301,
                headers: headers,
            });
        }
    }
    return response;
}

