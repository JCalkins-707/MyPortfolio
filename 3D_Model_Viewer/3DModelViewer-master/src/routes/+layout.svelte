<script>
	import '$lib/variables.css';
	import favicon from '$lib/assets/favicon.svg';
	import Navbar from '$lib/components/Navbar.svelte'
	import Footer from '$lib/components/Footer.svelte';
	export let data;

</script>
<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<div class="pageContainer">
	<Navbar user={data.user} />
	<!--{@render children?.()}-->
	<main class="content">
		<slot />
	</main>

	<Footer />
</div>

<style>

	:global(html), :global(body) {
		margin: 0; 
		padding-top: 0;
		padding-top: 1em;
		background-color: var(--accent-light);
	}

	.pageContainer {
		display: flex;
		flex-direction: column;
		min-height: 100vh;	
	}

	.content {
		flex: 1;
	}

</style>