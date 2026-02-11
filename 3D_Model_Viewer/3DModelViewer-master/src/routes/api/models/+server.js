import { json } from '@sveltejs/kit';
import { onRegister, onLogin } from '$lib/server/account';
import { hash, verify } from '@node-rs/argon2';
import { encodeBase32LowerCase } from '@oslojs/encoding';
import { fail, redirect } from '@sveltejs/kit';
import { eq } from 'drizzle-orm';
import * as auth from '$lib/server/auth';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';

async function handleGoogleResponse(responsePayload, event) {

            const results = await db
                  .select()
                  .from(table.account)
                  .where(eq(table.account.email, responsePayload.email));

            const existingUser = results.at(0);
            

            if (existingUser) {
                console.dir("User exists. Logging in...")
                const sessionToken = auth.generateSessionToken();
                const session = await auth.createSession(sessionToken, existingUser.accId);
                auth.setSessionTokenCookie(event, sessionToken, session.expiresAt);

		        return redirect(302, '/auth');
            } else {
                console.dir("No such user yet. Pulling google credentials and creating account...")
                try {
                    await db.insert(table.account).values({accId: responsePayload.nbf,
                                                           username: responsePayload.name,
                                                           userSecret:'foo',
                                                           authSecret: responsePayload.jti,
                                                           email: responsePayload.email});

			        const sessionToken = auth.generateSessionToken();
			        const session = await auth.createSession(sessionToken, responsePayload.nbf);
			        auth.setSessionTokenCookie(event, sessionToken, session.expiresAt);
		        } catch (ex) {
                    console.dir(ex)
			        return fail(500, { message: 'An error has occurred' });
		        }
                return redirect(302, '/auth');
            }

}

export async function POST(event) {
	const payload = await event.request.json();
    const jwtJson = JSON.parse(payload);
    console.dir(jwtJson);
    return handleGoogleResponse(jwtJson, event);
    
    //return json({ message: 'ok' });
}