import { error } from '@sveltejs/kit';
import { redirect } from '@sveltejs/kit';

export function load({ locals }) {
    if (!locals.user) {
        return redirect(301, "/auth/login");
    }

    if (!locals.user.admin) {
        throw error(403, "Forbidden: Administrators only.")
    }

    return {};
}