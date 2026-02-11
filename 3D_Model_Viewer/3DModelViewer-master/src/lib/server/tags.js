import { db } from '$lib/server/db';
import { model_tag, tag } from './db/schema';
import { eq } from "drizzle-orm";
import * as table from '$lib/server/db/schema';

/*
    getModelTags():
        fetch names of the tags that the given
        model entry is associated with
*/
export async function getModelTags(modelId) {
    const results = await db.select()
        .from(table.model_tag)
        .innerJoin(table.tag, eq(table.model_tag.tagId, table.tag.tagId))
        .where(eq(table.model_tag.modelId, modelId));
    console.log(results);

    return results;
}
