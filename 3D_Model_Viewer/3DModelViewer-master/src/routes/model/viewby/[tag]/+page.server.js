import { eq, and, inArray } from 'drizzle-orm';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';

export async function load({ params }) {
    const tagName = params.tag;

    const tagRow = await db.select({
        tagId: table.tag.tagId,
        requiresApproval: table.tag.requiresApproval
    })
    .from(table.tag)
    .where(eq(table.tag.name, tagName));

    if (tagRow.length === 0) {
        return {
            tag: tagName, modelsWithTag: []
        };
    }

    const tagId = tagRow[0].tagId;
    const requiresApproval = tagRow[0].requiresApproval;
/*
    const modelTags = await db.select({
        modelId: table.model_tag.modelId
    })
    .from(table.model_tag)
    .innerJoin(table.model, eq(table.model_tag.modelId, table.model.modelId))
    .where(eq(table.model.approved, 1));

    const modelIds = [...new Set(modelTags.map(mt => mt.modelId))];

    if (modelIds.length === 0) {
        return { tag: tagName, modelsWithTag: []};
    }
*/
/*
    const modelQuery = db.select({
        modelId: table.model.modelId,
        modelTitle: table.model.title,
        modelAuthor: table.account.username,
        uploaderId: table.model.uploaderId,
        approved: table.model.approved
    })
    .from(table.model_tag)
    .innerJoin(table.model, eq(table.model_tag.modelId, table.model.modelId))
    .innerJoin(table.account, eq(table.model.uploaderId, table.account.accId))
    .where(eq(table.model_tag.tagId, tagId));
*/

    let whereClause = eq(table.model_tag.tagId, tagId);

    if (requiresApproval) {
        whereClause = and(
            eq(table.model_tag.tagId, tagId),
            eq(table.model.approved, 1)
        );
    }

    const models = await db.select({
        modelId: table.model.modelId,
        modelTitle: table.model.title,
        modelAuthor: table.account.username,
        uploaderId: table.model.uploaderId,
        approved: table.model.approved
    })
    .from(table.model_tag)
    .innerJoin(table.model, eq(table.model_tag.modelId, table.model.modelId))
    .innerJoin(table.account, eq(table.model.uploaderId, table.account.accId))
    .where(whereClause);

    if (models.length === 0) {
        return { 
            tag: tagName, modelsWithTag: []
        };
    }

    const modelIds = models.map(m => m.modelId);

    const allTags = await db.select({
        modelId: table.model_tag.modelId,
        tagName: table.tag.name
    })
    .from(table.model_tag)
    .innerJoin(table.tag, eq(table.model_tag.tagId, table.tag.tagId))
    .where(inArray(table.model_tag.modelId, modelIds));

    const tagsByModel = {};
    allTags.forEach(t => {
        if(!tagsByModel[t.modelId]) {
            tagsByModel[t.modelId] = [];
        }
        tagsByModel[t.modelId].push(t.tagName);
    });

    const modelsWithTag = models.map(m => ({
        ...m,
        tags: tagsByModel[m.modelId] || []
    }));

    return {
        tag: tagName,
        modelsWithTag
    };
}
