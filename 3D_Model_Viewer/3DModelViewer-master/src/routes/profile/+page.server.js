import { getLoggedInUser } from '$lib/server/account.js';
import { eq } from 'drizzle-orm';
import { db } from '$lib/server/db';
import { error } from '@sveltejs/kit';
import * as table from '$lib/server/db/schema';

export async function load({ params, cookies }) {
const loggedInUser = await getLoggedInUser(cookies, "view profile");
    if (loggedInUser instanceof Response) {
        return redirect(301, "/auth/login");
    }

    return {
        account: loggedInUser
    };

}
