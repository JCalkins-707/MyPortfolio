import { eq, and, ne } from 'drizzle-orm';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';

/*
    load():
        fetches a model's title and
        and associated author's username
*/
async function getModels(userid) {
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
            ne(table.model.deleted, 1),
            eq(table.model.uploaderId, userid)
        ));
}

export async function load({params}) {
    const results = await getModels(params.slug);

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

    return { results: modelsWithTags };
}
