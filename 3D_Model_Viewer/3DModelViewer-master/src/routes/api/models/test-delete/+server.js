import { eq } from 'drizzle-orm';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';
import { title } from 'process';

export async function GET() {
    await db.delete(table.model).run();

    await db.delete(table.account).run();

    return new Response("Removed test data.", { status: 200 });
}