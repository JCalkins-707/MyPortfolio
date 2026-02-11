import { error } from '@sveltejs/kit';
import { redirect } from '@sveltejs/kit';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema.js';
import { eq } from 'drizzle-orm';

export async function load({ locals }) {
    if (!locals.user) {
        return redirect(301, "/auth/login");
    }

    if (!locals.user.admin) {
        throw error(403, "Forbidden: Administrators only.")
    }

    const tags = await db.select({ 
        tagId: table.tag.tagId, 
        name: table.tag.name,
        requiresApproval: table.tag.requiresApproval
    })
        .from(table.tag)
        .orderBy(table.tag.name);

    return { 
        tags
    };
}

/** @satisfies {import('./types').Actions} */
export const actions = {
    default: async ({ request, locals }) => {
        if (!locals.user || !locals.user.admin) {
            throw error(403, 'Forbidden: Administrators only.');
        }

        const formData = await request.formData();

        const allTags = await db.select({
            tagId: table.tag.tagId
        }).from(table.tag);

        for (const { tagId } of allTags) {
            const isChecked = formData.has(`tag-${tagId}`) ? 1 : 0;

            await db.update(table.tag)
                .set({ requiresApproval: isChecked })
                .where(eq(table.tag.tagId, tagId));
        }
        
        /*
        for (const [key, value] of formData.entries()) {
            if (key.startsWith('tag-')) {
                const tagId = parseInt(key.split('-')[1]);
                const requiresApproval = value === 'on' ? 1 : 0;

                await db.update(table.tag)
                    .set({ requiresApproval })
                    .where(eq(table.tag.tagId, tagId));
            }
        }
*/
        return {
            success: true
        };
    }
};