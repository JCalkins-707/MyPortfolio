import { onRegister, onLogin } from '$lib/server/account';
import { hash, verify } from '@node-rs/argon2';
import { encodeBase32LowerCase } from '@oslojs/encoding';
import { fail, redirect } from '@sveltejs/kit';
import { eq } from 'drizzle-orm';
import * as auth from '$lib/server/auth';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';

export const load = async (event) => {
	if (event.locals.user) {
		return redirect(302, '/auth');
	}
	return {};
};

export const actions = {
	login: async (event) => {
        return onLogin(event);
    },
	register: async (event) => {
      return onRegister(event);
    },
};
