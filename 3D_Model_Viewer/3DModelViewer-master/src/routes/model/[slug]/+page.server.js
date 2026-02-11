import { eq } from 'drizzle-orm';
import { db } from '$lib/server/db';
import { checkUserAdminPermissions, checkUserModelPermissions } from '$lib/server/account.js';
import { error } from '@sveltejs/kit';
import * as table from '$lib/server/db/schema';
import { getModelTags } from '$lib/server/tags';


async function getModelInfo(modelId) {
    const results = await db.select()
        .from(table.model)
        .innerJoin(table.account, eq(table.model.uploaderId, table.account.accId))
        .where(eq(table.model.modelId, modelId));

    return results.at(0);
}


export async function load({ params, cookies }) {
	const modelEntry = await getModelInfo(params.slug);
    //console.dir('querying modelid:' + params.slug);
    //console.dir(modelEntry);

    if(!modelEntry) {
        error(404);
    }

	
    const modelId = parseInt(params.slug);
    const editable = (await checkUserAdminPermissions(cookies) || await checkUserModelPermissions(cookies, modelId));
    const tagRows = await getModelTags(params.slug);
    const tags = tagRows.map(row => row.tag.name);

    return {
        modelEntry, tags, editable
    };

}

export const actions = {
    review: async (event) => {
    const isAdmin = await checkUserAdminPermissions(event.cookies);
    if (isAdmin) {
        const formData = await event.request.formData();
        const decision = await formData.get('approved');
        //console.log(decision);
        const results = await db.update(table.model)
                                .set({approved: parseInt(decision, 2)})
                                .where(eq(table.model.modelId, event.params.slug))
                                .returning({ reviewedId: table.model.modelId,
                                             reviewStatus: table.model.approved});
        return results;
        } else {
            return error(403);
        }
    }
}
