import { eq } from 'drizzle-orm';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';
import { title } from 'process';

export async function GET() {
    await db.run('PRAGMA foreign_keys = ON;');
/*
    await db.insert(table.account).values([
        { accId: "000", username: "pepsiman", email: "therealpepsiman@notmail.com", role: "author", userSecret: "pepsi"},
        { accId: "001", username: "NotADuck99", email: "duckfan99@fakemail.net", role: "author", userSecret: "duck?"},
        { accId: "002", username: "bogosorter_4lyfe", email: "johnskyrim@notanemail.com", role: "author", userSecret: "wabbajack"},
        { accId: "003", username: "horse_denier", email: "thetruthabouthorses@notanemail.com", role: "author", userSecret: "horsesRfake"}
    ]);

    await db.insert(table.model).values([
        { uploaderId: "000", title: "The Orb of Confusion", license: "Creative Commons", filePath: "#orb", description: "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm" },
        { uploaderId: "001", title: "Quack", license: "Creative Commons", filePath: "#duck"},
        { uploaderId: "001", title: "Mobile Suit Gundam Unicorn RX-0 PG", filePath: "#cool", description: "cool gundam guy"},
        
        { uploaderId: "001", title: "Aerodynamics of a Cow", filePath: "#cow", description: "cows are more aerodynamic than jeeps"},
        { uploaderId: "003", title: "Tux", filePath: "#linux"},
        { uploaderId: "001", title: "Alduin", filePath: "#alduin", description: "alduin the world eater"},
        
        { uploaderId: "003", title: "A Cube", filePath: "#cube", description: "my first model upload pls be nice 0w0"},
        { uploaderId: "001", title: "Dagoth Ur", filePath: "#dagoth", description: "dreamer of the sixth house, the tribe unmourned"},
        { uploaderId: "003", title: "Coffee Cup on Table", filePath: "#coffee", description: "coffee cup?"}
    ]);
*/
    await db.insert(table.tag).values([
        {name: 'testTag'}, {name: 'testTag2'}
    ]);

    await db.insert(table.model_tag).values([
        {modelId: 1, tagId: 1}, {modelId: 2, tagId: 2}
    ]);

    return new Response("Inserted test data.", { status: 200 });
}