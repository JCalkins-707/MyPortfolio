import { getLoggedInUser } from '$lib/server/account.js';
import { eq } from 'drizzle-orm';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';
import { redirect } from '@sveltejs/kit';

async function getModels(currentUser) {
    const models = await db.select({
        modelTitle: table.model.title,
        modelAuthor: table.account.username,
        modelId: table.model.modelId,
        approved: table.model.approved,
        deleted: table.model.deleted
    }).from(table.model)
                   .innerJoin(table.account, eq(
                       table.model.uploaderId, table.account.accId)
                             )
                   .where(eq(table.model.uploaderId, currentUser));

    const modelsWithTags = await Promise.all(
        models.map(async (m) => {
            const tagRows = await db.select({ name: table.tag.name })
                .from(table.model_tag)
                .innerJoin(table.tag, eq(table.model_tag.tagId, table.tag.tagId))
                .where(eq(table.model_tag.modelId, m.modelId));

            const tags = tagRows.map(t => t.name);
            return {...m, tags};
        })
    );
    return modelsWithTags;
}

export const load = async (event) => {
//for load functions: 
//if not logged in, return redirect response
    const loggedInUser = await getLoggedInUser(event.cookies, "view this account's models");
    if(loggedInUser instanceof Response) {
        return redirect(301, "/auth/login");
    } else {
        const results = await getModels(loggedInUser.accId);
        return { results };
    }
}
