<script>
	import { onMount } from "svelte";

	export let user;

	let tags = [];
	
	onMount(async () => {
		const res = await fetch("/api/models/tags");

		if (res.ok) {
			tags = await res.json();
		}
	});
</script>

<nav>
    <ul class="nav_bar">
		<li class="app_name">
			<div class="logo"><span class="big_letters"><span class="three">3</span>D</span>
				<div class="words"><span class="model_word">Model</span>
					<span class="viewer_word">Viewer</span></div></div>
		</li>
        <li> <a href="/"> Home </a></li>
		<li class="dropdown">
			<p class="dropdown_button"> View By </p>
			<ul class="dropdown_content">
			{#each tags as tag}
                <li><a href={`/model/viewby/${tag}`}
					data-sveltekit-preload-code> {tag} </a></li>
            {/each}
			</ul>
		</li>
		<li class="dropdown">
			<p class="dropdown_button"> Manage </p>
			<ul class="dropdown_content">
				<li><a href="/model/mymodels"> My Models </a></li>
				<li><a href="/profile"> Profile </a></li>
				{#if user?.admin}
					<li><a href="/admin"> Administration </a></li>
				{/if}
			</ul>
		</li>
		<li> <a href="/model/create" class="upload_btn"> Upload </a></li>
	{#if !user}
		<li class="right"> <a href="/auth"> Log In or Sign Up</a></li>
	{:else}
		<li class="right"> <a href="/auth"> Logout </a></li>
	{/if}
    </ul>
</nav>

<style>

	nav {
		caret-color: transparent;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		z-index: 1000;
		background-color: var(--accent-dark);
	}

	.nav_bar {
		list-style: none;
		display: flex;
		align-items: center;
		/*justify-content: space-between;*/
		gap: 1em;
		margin: 0;
		padding: 0em 2em;
	}

	.nav_bar > li {
		position: relative;
	}

	.nav_bar a,
	.dropdown_button {
		text-decoration: none;
		background-color: var(--primary);
		color: var(--black);
		padding: 0.8em 1.2em;
		border-radius: 0.4em;
		font-weight: 600;
		cursor: pointer;
		transition: all 0.15s ease-in-out;
		display: flex;
		align-items: center;
	}

	.nav_bar a:hover,
	.dropdown_button:hover {
		background-color: var(--primary-light);
		transform: translateY(-2px);
	}

	
	.dropdown_button {
		position: relative;
	}

	.right {
		margin-left: auto;
	}

	.dropdown_button::after {
		content: "";
		position: absolute;
		left: 0;
		top: 100%;
		width: 100%;
		height: 10px;
	}

	.dropdown_content {
		display: none;
		position: absolute;
		top: calc(100% - 2px);
		left: 0;
		overflow-y: auto;
		max-height: 500px;

		background: var(--primary);
		border: 0.25em solid var(--black);
		border-radius: 0.5em;

		min-width: 12em;
		padding: 0;
		padding-top: 0.1em;

		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
	}

	.dropdown:hover .dropdown_content,
	.dropdown_button:hover + .dropdown_content {
		display: block;
	}

	.dropdown_content li {
		list-style: none;
		border-bottom: 1px solid var(--accent-dark);
	}

	.dropdown_content li:last-child,
	.dropdown_content li:hover {
		border: 0;
	}

	.dropdown_content li a {
		display: block;
		padding: 0.7em 1em;
		border-radius: 0.2em;
	}

	.dropdown_content li a:hover {
		background: var(--accent-light);
	}

	.upload_btn {
		background: var(--accent-dull);
		color: var(--white);
	}

	.upload_btn:hover {
		background: var(--accent-light);
		color: var(--black);
		transform: translateY(-2px);
	}

	.logo {
		display: flex;
		padding-top: 0;
		background-color: var(--primary-light);
		border-radius: 25px;
		padding: 0 0.5em;
		box-shadow: 2px 2px 3px var(--black);
		cursor: default;
	}

	.big_letters {
		font-size: 35pt;
		margin-top: 0;
		font-weight: 800;
		color: var(--accent-dark);
	}

	.three {
		color: var(--accent-dull);
		position: relative;
		right:-10px;
		font-weight: 900;
	}

	.words {
		display: block;
		width: 4em;
		margin-top: 0.5em;
		font-weight: 500;
		font-size: 12pt;
		position: relative;
	}

	.model_word {
		position: relative;
		top: 4px;
	}
	
	.viewer_word {
		margin-top: 0;
		padding-top: 0;
	}

</style>