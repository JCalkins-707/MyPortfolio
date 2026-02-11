import * as fs from 'fs';
import { error } from '@sveltejs/kit';
import { getLoggedInUser, checkUserModelPermissions } from '$lib/server/account';
import { Buffer } from 'node:buffer'; //recommended by node docs
import { eq } from 'drizzle-orm';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';


export async function POST({ request, cookies }) {
    //hacky solution, do not use in prod

    const formData = await request.formData();
    const location = await formData.get('location');
    console.log({ location });

    const results = await db.select()
        .from(table.model)
        .where(eq(table.model.filePath, location));

    const modelId = results.at(0).modelId;


    if (await checkUserModelPermissions(cookies, modelId)) {
        console.log(await formData.get('overwrite'));
         
        const thumbLocation = 'static/models/thumbs/' + modelId + ".png";
        console.log({ thumbLocation });
        if (!fs.open(thumbLocation, 'r', (err) => { if(err) return null; })
            || await formData.get('overwrite')) {
            const file = await formData.get('file');
            const fileBuffer = Buffer.from(await file.arrayBuffer());
            await fs.writeFileSync(thumbLocation, fileBuffer);
        }
        const headers = new Headers();
        let response = new Response(null, {
            status: 200,
            headers: headers,
        });

        return response;
    } else {
        error(403);
    }
}
