import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [sveltekit()],
	server: {
		fs: {
			strict: false //loosen up the file serving rules, look at a more secure way to do this later
		},
	},
});
