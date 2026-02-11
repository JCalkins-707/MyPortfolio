import { fail, redirect, error } from '@sveltejs/kit';
import { getLoggedInUser, checkUserModelPermissions } from '$lib/server/account';
import { eq } from 'drizzle-orm';
import { db } from '$lib/server/db';
import { error } from '@sveltejs/kit';
import * as table from '$lib/server/db/schema';

async function getModelInfo(modelId) {
    const result = await db.select()
        .from(table.model)
        .innerJoin(table.account, eq(table.model.uploaderId, table.account.accId))
        .where(eq(table.model.modelId, modelId));

    const modelEntry = result.at(0);

    if (!modelEntry) {
        return null;
    }

    const tagRows = await db.select({ name: table.tag.name })
        .from(table.model_tag)
        .innerJoin(table.tag, eq(table.model_tag.tagId, table.tag.tagId))
        .where(eq(table.model_tag.modelId, modelId));

    const tags = tagRows.map(t => t.name);

    return {
        model: modelEntry.model,
        account: modelEntry.account, 
        tags
    };
}

export async function load({ params, cookies }) {
     
    //if not logged in, return redirect response
    const loggedInUser = await getLoggedInUser(cookies, "view a model");
    if (loggedInUser instanceof Response) {
        return redirect(301, "/auth/login");
    } else if (!await checkUserModelPermissions(cookies, params.slug)) {
        return error(403);
    } else if (loggedInUser.deleted){
        return error(403, {message: "Deleted users cannot edit models"});
    } else {

        const modelEntry = await getModelInfo(params.slug);
        //console.dir('querying modelid:' + params.slug);
        //console.dir(modelEntry);

        if (!modelEntry) {
            error(404);
        } else {
            return { modelEntry };
        }
    }

}

/** @satisfies {import('./$types').Actions} */
export const actions = {
    default: async ({ request, cookies, params }) => {
        if (await checkUserModelPermissions(cookies, params.slug)) {
            const formResponse = await request.formData();
            /* TODO: allow user to change file upload, but make it optional without unassigning a file to model
            const existingModel = await db.select()
                    .from(table.model)
                    .where(eq(table.model.modelId, params.slug))
                    .limit(1);
            
            const model = existingModel[0];
            let newFilePath = model.filePath;

            const file = formResponse.get('fileInput');

            if (file && typeof file == 'object' && file.size > 0) {
                const arrayBuffer = await file.arrayBuffer();
                const buffer = Buffer.from(arrayBuffer);
                newFilePath = `/model/${file.name}`;
            }*/

            const deleted = (formResponse.get('delete')) ? 1 : 0;
            
            console.log({deleted});

            const tagString = formResponse.get('tags');
            const annotationData = formResponse.get('nodeList');
            
            await db.update(table.model)
                    .set({title: formResponse.get('title'),
                          license: formResponse.get('license'),
                          description: formResponse.get('description'),
                          //metadata: formResponse.get('metadata'),
                          deleted: deleted,
                          //filePath: newFilePath
                          notes: annotationData
                         })
              .where(eq(table.model.modelId, params.slug));

            const tagList = tagString?.split(",").map(t => t.trim()).filter(Boolean) || [];

            await db.delete(table.model_tag)
                .where(eq(table.model_tag.modelId, params.slug));

            for (const tagName of tagList) {
                let tagRow = await db.select().from(table.tag)
                    .where(eq(table.tag.name, tagName));
                let tagId;

                if (tagRow.length === 0) {
                    const inserted = await db.insert(table.tag)
                        .values({ name: tagName }).returning({ tagId: table.tag.tagId });
                    tagId = inserted[0].tagId;
                }
                else {
                    tagId = tagRow[0].tagId;
                }

                await db.insert(table.model_tag).values({
                    modelId: params.slug,
                    tagId
                });
            }
        } else {
            error(403);
        }
    }
}
