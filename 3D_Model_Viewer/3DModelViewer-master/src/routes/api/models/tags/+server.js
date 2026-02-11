import { db } from "$lib/server/db";
import * as table from "$lib/server/db/schema";

export async function GET() {
        try {
            const tags = await db.select({ name: table.tag.name })
                .from(table.tag)
                .orderBy(table.tag.name);

            return new Response(JSON.stringify(tags.map(t => t.name)), {
                headers: { "Content-Type": "application/json"}
            });
        }
        catch (error) {
            console.error("Error fetching tags from DB:", error);
            return new Response(JSON.stringify([]), {
                status: 500,
                headers: { "Content-Type": "application/json" }
            });
        }
}