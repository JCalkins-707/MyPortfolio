import { requireLogin } from '$lib/server/account.js';
import { fail, redirect } from '@sveltejs/kit';
import * as THREE from "three";
import obj2gltf from "obj2gltf";
import { PLYLoader } from "three/examples/jsm/loaders/PLYLoader.js";
import { TDSLoader } from "three/examples/jsm/loaders/TDSLoader.js";
import { GLTFExporter } from "three/examples/jsm/exporters/GLTFExporter.js";
import { readFile, writeFile } from 'fs/promises';
import { Buffer } from 'node:buffer'; //recommended by node docs
import { randomUUID } from 'crypto';
import { validateSessionToken } from '$lib/server/auth';
import { getLoggedInUser, requireLLogin } from '$lib/server/account';
import { eq } from 'drizzle-orm';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';
import { addTagToMetadata } from '$lib/utils/metadata.js';


const MODEL_FILES_PATH = 'static/models/';
const GLB_PATH = 'glb/';
const GLTF_PATH = 'gltf/';
const STL_PATH = 'stl/';
const OBJ_PATH = 'obj/';
const PLY_PATH = 'ply/';

export const load = async (event) => {
    const user = await requireLogin(event);
    return { user };
}

export const actions = {
    uploadFile: async ({ request, cookies }) => {
        let directoryString;
        let ext;
        let metadata = {};


        //ensure user is logged in
        const loggedInUser = await getLoggedInUser(cookies, "upload a model");
        if (loggedInUser instanceof Response) {
            return loggedInUser;
        } else {
            console.log(loggedInUser);
            if (loggedInUser.deleted) return fail(403, {message: "Deleted users cannot upload models"}); 

            let outfile;
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

                for (const tag of tagList) {
                    metadata = addTagToMetadata(metadata, tag);
                }
            }

            //handle empty file in form responses
            if (!file.name) {
                return fail(400, { message: 'no file uploaded'});
            }

            //get buffer from file
            var filedata = await file.arrayBuffer();
            filedata = Buffer.from(filedata);

            console.log({filedata});

            //get filename for extension checking
            const name = file.name.toLowerCase(); //TODO: this needs to generate a uuid somehow


            try {
                if (name.endsWith(".obj")) {

                directoryString = MODEL_FILES_PATH + OBJ_PATH;
                ext = ".obj";
                outfile = filedata;

                } else if (name.endsWith(".stl")) {

                    directoryString = MODEL_FILES_PATH + STL_PATH;
                    ext = ".stl";

                    outfile = filedata;

                } else if (name.endsWith(".glb")) {

                    directoryString = MODEL_FILES_PATH + GLB_PATH;
                    ext = ".glb";

                    outfile = filedata;

                } else if (name.endsWith(".ply")) {
                    directoryString = MODEL_FILES_PATH + PLY_PATH;
                    ext = ".ply";

                    outfile = filedata;
                } else {
                    return fail(400, { message: 'invalid filetype'});
                }
            } catch (err) {
                console.dir(err);
                return responseFail;
            }


            //only handles single file upload :(
            let filename = randomUUID();
            const outfilename = directoryString + filename + ext;

            const results = await db.insert(table.model).values({
                uploaderId: loggedInUser.accId,
                title: title,
                description: description,
                license: license,
                metadata: metadata,
                filePath: '/' + outfilename
            })
                .returning({ insertedId: table.model.modelId });

            const idHandle = results.at(0).insertedId;

            console.log("logging inserted id");
            console.log(idHandle);

            let requiresApprovalFlag = false;

            if (tagString) {
                const tagList = tagString
                    .split(",")
                    .map(t => t.trim())
                    .filter(Boolean);

                for (const tagName of tagList) {
                    const existing = await db.select({
                        tagId: table.tag.tagId,
                        requiresApproval: table.tag.requiresApproval
                    })
                        .from(table.tag)
                        .where(eq(table.tag.name, tagName));
                    
                    let tagId;
                    let tagRequiresApproval = false;

                    if (existing.length === 0) {
                        const inserted = await db.insert(table.tag)
                            .values({ name: tagName, requiresApproval: 0 })
                            .returning({ id: table.tag.tagId });
                        
                        tagId = inserted[0].id;
                    }
                    else {
                        tagId = existing[0].tagId;
                        if (existing[0].requiresApproval) {
                            tagRequiresApproval = true;
                        }
                    }

                    if (tagRequiresApproval) {
                        requiresApprovalFlag = true;
                    }

                    await db.insert(table.model_tag).values({
                        modelId: idHandle,
                        tagId: tagId
                    });
                }
            }

            await db.update(table.model)
                .set({ approved: null})
                .where(eq(table.model.modelId, idHandle));

            if (idHandle) {
                //if we wrote to database, write file and pass error checking callback
                try {
                    await writeFile(outfilename, outfile);
                } catch (err) {
                    //log
                    console.error('error with writeFile', err);

                    //delete db entry
                    await db.delete(table.model).
                        where(eq(table.model.modelId, idHandle));

                    //and fail
                    return fail(500, {message: 'failed to save file'});
                }

                //executes if database was written to and file was written
                throw redirect(301, '/model/edit/' + idHandle);
            } else {
                //if we failed to write to db
                return fail(500, { message: 'failed to write to db'});
            }
        }
    }
}
