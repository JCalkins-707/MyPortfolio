import { error } from '@sveltejs/kit'
import { checkUserAdminPermissions } from '$lib/server/account.js';
import { ne, eq, isNull, or } from 'drizzle-orm';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';

async function getUsers() {
    return await db.select({
        username: table.account.username,
        accId: table.account.accId
    }).from(table.account);
}

export const load = async (event) => {
    //for load functions: 
    //if not logged in, return redirect response
    const isAdmin = await checkUserAdminPermissions(event.cookies);
    if (!isAdmin) {
        return error(403);
    } else {
        const results = await getUsers();
        return { results };
    }
}


