import { eq, and, ne } from 'drizzle-orm';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';
import { getLoggedInUser } from '$lib/server/account';

/*
    load():
        fetches a model's title and
        and associated author's username
*/
async function getModels() {
    return await db.select({
        modelTitle: table.model.title,
        modelAuthor: table.account.username,
        modelId: table.model.modelId,
        approved: table.model.approved,
        deleted: table.model.deleted
        //modelMetadata: table.model.metadata
    })
        .from(table.model)
        .innerJoin(table.account, eq(table.model.uploaderId, table.account.accId))
        .where(and(
            eq(table.model.approved, 1),
            ne(table.model.deleted, 1)
        ));
}

export async function load({ cookies }) {
    const user = await getLoggedInUser(cookies);
    const username = user?.username || null;

    const results = await getModels();

    const modelsWithTags = await Promise.all(
        results.map(async (m) => {
            const tagRows = await db.select({ name: table.tag.name })
                .from(table.model_tag)
                .innerJoin(table.tag, eq(table.model_tag.tagId, table.tag.tagId))
                .where(eq(table.model_tag.modelId, m.modelId));

            const tags = tagRows.map(t => t.name);
            return {...m, tags}
        })
    );

    return { results: modelsWithTags, username };
}
