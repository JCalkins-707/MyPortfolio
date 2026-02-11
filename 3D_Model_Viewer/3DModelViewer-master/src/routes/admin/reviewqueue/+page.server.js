import { error } from '@sveltejs/kit'
import { checkUserAdminPermissions } from '$lib/server/account.js';
import { ne, eq, isNull, or } from 'drizzle-orm';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';

async function getModels() {
    return await db.select({
        modelTitle: table.model.title,
        modelAuthor: table.account.username,
        modelId: table.model.modelId,
    }).from(table.model)
        .innerJoin(table.account,
            eq(table.model.uploaderId, table.account.accId)
        )
        .where(
            isNull(table.model.approved)
        );
}

export const load = async (event) => {
    //for load functions: 
    //if not logged in, return redirect response
    const isAdmin = await checkUserAdminPermissions(event.cookies);
    if (!isAdmin) {
        return error(403);
    } else {
        const results = await getModels();
        const modelsWithTags = await Promise.all(
            results.map(async (m) => {
                const tagRows = await db.select({ name: table.tag.name })
                    .from(table.model_tag)
                    .innerJoin(table.tag, eq(table.model_tag.tagId, table.tag.tagId))
                    .where(eq(table.model_tag.modelId, m.modelId));

                const tags = tagRows.map(t => t.name);
                return { ...m, tags }
            })
        );
        return { results: modelsWithTags };
    }
}
