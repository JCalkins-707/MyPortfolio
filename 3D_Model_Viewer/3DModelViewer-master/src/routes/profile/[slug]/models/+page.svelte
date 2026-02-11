<script>
    import ModelCard from "$lib/components/ModelCard.svelte";
    export let data;
</script>

<h1> Models created by {data.results[0].modelAuthor} </h1>

{#if data.results.length > 0}
    <ul>
        {#each data.results as result}
            <li>
                <ModelCard modelTitle={result.modelTitle}
                modelAuthor={result.modelAuthor} modelApproved={result.approved}
                modelId={result.modelId} tags={result.tags} deleted={result.deleted} />
            </li>
        {/each}
    </ul>
{:else}
    <p> No models found. </p>
{/if}

<style>
    h1 {
		padding: 1em;
        padding-top: 1.5em;
        background-color: var(--accent-dull);
        text-align: center;
        color: var(--accent-light);
	}

    ul {
        list-style-type: none;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        justify-content: space-around;
        padding-left: 1em;
        padding-right: 1em;
        place-items: center;
    }

    @media (max-width: 1100px) {
        ul {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media (max-width: 700px) {
        ul {
            grid-template-columns: 1fr;
        }
    }
</style>
