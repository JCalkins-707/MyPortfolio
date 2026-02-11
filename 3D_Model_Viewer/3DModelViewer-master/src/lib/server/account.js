import { hash, verify } from '@node-rs/argon2';
import { encodeBase32LowerCase } from '@oslojs/encoding';
import { fail, redirect } from '@sveltejs/kit';
import { eq, gte, and, sql } from 'drizzle-orm';
import * as auth from '$lib/server/auth';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';
import decodeJwtResponse from '$lib/google';
import { getRequestEvent } from '$app/server';

/**
 * uses Auth.js session framework
 * @param {cookies} cookies - cookies from a post request etc.
 * @param {string} actionstring - user-readable identifier describing
 * the action they are authenticating for (ex. "upload a model"). this is used
 * for the redirect response message.
 * @returns {json} - json object containing entire user row from db
 * */
export async function getLoggedInUser(cookies, actionString){
    const sessionToken = cookies.get('auth-session');
    
    const headers = new Headers();
    headers.append('Location', '/auth/login');
    const redirectResponse = new Response(null, {
        status: 301,
        statusText: "You must be logged in to " + actionString + ".",
        headers: headers,
    });
    
    if(!sessionToken){
        return redirectResponse;
    }

    const sessionValidated = await auth.validateSessionToken(sessionToken);

    if(!sessionValidated.user || !sessionValidated.session){
        return redirectResponse;
    } else {

    const results = await db.select()
          .from(table.account)
          .where(eq(table.account.accId, sessionValidated.user.id));

        console.log(results.at(0));
    return results.at(0);
    }
}

/**
 * Returns true if user owns model or is admin.
 * @param {cookies} cookies - cookies from a post request etc.
 * @param {string} modelIdString - model ID number as a string
 * @returns {boolean} - user's permissions on given model
 * */
export async function checkUserModelPermissions(cookies, modelIdString){
    const loggedInUser = await getLoggedInUser(cookies, "");
    const results = await db.select()
        .from(table.model)
        .innerJoin(table.account, eq(table.model.uploaderId, table.account.accId))
        .where(
            and(
                eq(table.model.modelId, modelIdString),
                eq(table.model.uploaderId, loggedInUser.accId)
            )
        );

    if (loggedInUser instanceof Response) {
        return false;
    } else if(loggedInUser.admin) {
        return true;
    } else if (results.at(0)){
        return true;
    } else {
        return false;
    }
}

/**
 * Returns true if user is admin
 * @param {cookies} cookies - cookies from a post request etc.
 * @returns {boolean} - if user is admin: true, otherwise: false.
 * */
export async function checkUserAdminPermissions(cookies){
    const loggedInUser = await getLoggedInUser(cookies, "");

    if(loggedInUser.admin) {
        return true;
    } else {
        return false;
    }
}


function generateUserId() {
	// ID with 120 bits of entropy, or about the same as UUID v4.
	const bytes = crypto.getRandomValues(new Uint8Array(15));
	const id = encodeBase32LowerCase(bytes);
	return id;
}

function validateUsername(username) {
	return (
		typeof username === 'string' &&
		    username.length >= 3 &&
		    username.length <= 31 &&
		    /^[a-z0-9_-]+$/.test(username)
	);
}

function validateEmail(email) {
    return (
        typeof email === 'string' &&
            /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)
    );
}

function validatePassword(password) {
	return (
		typeof password === 'string' &&
		    password.length >= 6 &&
		    password.length <= 255
	);
}

function jsonparser(data){
    console.log(JSON.stringify(data)) 
}

/**
 * Adapted from Sveltekit's Aria implementation
 * @param {event} event - login event
 * */
export async function onLogin(event) {
	const formData = await event.request.formData();
	const email = formData.get('email');
	const password = formData.get('password');

	if (!validateEmail(email)) {
		return fail(400, { message: 'Invalid email' });
	}
	if (!validatePassword(password)) {
		return fail(400, { message: 'Invalid password (min 6, max 255 characters)' });
	}

	const results = await db
		  .select()
		  .from(table.account)
		  .where(eq(table.account.email, email));

	const existingUser = results.at(0);
	if (!existingUser) {
		return fail(400, { message: 'Incorrect username or password' });
	}

    console.dir(existingUser.user_secret);
    console.dir(results);

	const validPassword = await verify(existingUser.userSecret, password, {
		memoryCost: 19456,
		timeCost: 2,
		outputLen: 32,
		parallelism: 1,
	});
	if (!validPassword) {
		return fail(400, { message: 'Incorrect username or password' });
	}

	const sessionToken = auth.generateSessionToken();
	const session = await auth.createSession(sessionToken, existingUser.accId);
	auth.setSessionTokenCookie(event, sessionToken, session.expiresAt);

	return redirect(302, '/auth');
}

/**
 * Adapted from Sveltekit's Aria implementation
 * @param {event} event - first party registration event
 * */
export async function onRegister(event) {
	const formData = await event.request.formData();
	const username = formData.get('username');
	const password = formData.get('password');
	const email = formData.get('email');

	if (!validateEmail(email)) {
		return fail(400, { message: 'Invalid email' });
	}
	if (!validateUsername(username)) {
		return fail(400, { message: 'Invalid username (min 3, max 31 characters, alphanumeric only)' });
	}
	if (!validatePassword(password)) {
		return fail(400, { message: 'Invalid password (min 6, max 255 characters)' });
	}

	const userId = generateUserId();
	const passwordHash = await hash(password, {
		// recommended minimum parameters
		memoryCost: 19456,
		timeCost: 2,
		outputLen: 32,
		parallelism: 1,
	});


	try {
		await db.insert(table.account).values({accId: userId, username: username, userSecret: passwordHash, email: email, admin: 0, deleted: 0});

		const sessionToken = auth.generateSessionToken();
		const session = await auth.createSession(sessionToken, userId);
		auth.setSessionTokenCookie(event, sessionToken, session.expiresAt);
	} catch (ex) {
        console.error(ex)
        if (ex.code='SQLITE_CONSTRAINT_UNIQUE')
        { return fail(500, { message: 'An account with this email already exists'}) }
        else{
			return fail(500, { message: 'An error has occurred' });
        }
	}
	return redirect(302, '/auth');
}

/**
 * Adapted from Sveltekit's Aria implementation
 * @param {event} event - first party registration event
 * */
export async function logOut(event) {
	if (!event.locals.session) {
		return fail(401);
	}
	await auth.invalidateSession(event.locals.session.id);
	auth.deleteSessionTokenCookie(event);

	return redirect(302, '/auth/login');
}

/**
 * If user is not logged in, redirects to login/registration page
 * @param {event} event - Current request event we are checking user for 
 * Adopted from Sveltekit's Aria implementation
 * use like const user = requireLogin() at the top of page
 */
export function requireLogin(event) {
    const { locals } = getRequestEvent();

    //console.dir("locals");
    //console.dir(locals);
    
	if (locals.user) {
            return locals.user;
    }
    else {
        return redirect(302, "/auth/login");
    }
}
