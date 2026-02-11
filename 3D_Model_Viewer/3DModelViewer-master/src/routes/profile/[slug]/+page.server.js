import { getLoggedInUser, checkUserAdminPermissions } from '$lib/server/account.js';
import { eq, not } from 'drizzle-orm';
import { db } from '$lib/server/db';
import { error } from '@sveltejs/kit';
import * as table from '$lib/server/db/schema';

async function userLookup(id) {

    return await db.select({
        username: table.account.username,
        email: table.account.email,
        institution: table.account.institution,
        admin: table.account.admin,
        deleted: table.account.deleted,
        accId: table.account.accId
    })
        .from(table.account)
        .where(
            eq(table.account.accId, id)
        );
}

export async function load({ params, cookies }) {
    const loggedInUser = await getLoggedInUser(cookies, "view profile");
    if (loggedInUser instanceof Response) {
        return redirect(301, "/auth/login");
    }

    const results = await userLookup(params.slug);
    const account = results.at(0);
    const isAdmin = await checkUserAdminPermissions(cookies);
    return {
        account, isAdmin
    };

}

async function toggleParam(id, param) {
    if (param == "deleted") {
        const results = await db
            .update(table.account)
            .set({
                deleted: not(table.account.deleted),
            })
            .where(eq(table.account.accId, id));
	    console.log({param});
	    console.log({results});
    } else if (param == "admin"){
        const results = await db
            .update(table.account)
            .set({
                admin: not(table.account.admin),
            })
            .where(eq(table.account.accId, id));
	    console.log({results});
    }
}
export const actions = {
    admin: async ({ params, cookies }) => {
        toggleParam(params.slug, "admin");
        load({params, cookies});
        const user = await userLookup(params.slug);
        return user;
    },
    deleted: async ({ params, cookies }) => {
        toggleParam(params.slug, "deleted");
        load({params, cookies});
        const user = await userLookup(params.slug);
        return user;
    }
}
