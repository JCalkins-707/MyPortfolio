import * as auth from '$lib/server/auth';
import { logOut, requireLogin } from '$lib/server/account'
import { fail, redirect } from '@sveltejs/kit';
import { getRequestEvent } from '$app/server';

export const load = async () => {
    const currEvent = getRequestEvent();
	const user = requireLogin(currEvent);
	return { user };
};

export const actions = {
	logout: async (event) => {
        return logOut(event);
	},
};

