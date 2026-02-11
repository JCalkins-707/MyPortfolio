<script>
    import ModelCard from '$lib/components/ModelCard.svelte';
    export let data;
</script>

<h1> Models in {data.tag} Collection </h1>

{#if data.modelsWithTag.length > 0}
    <div class="modelGrid">
        <ul>
        {#each data.modelsWithTag as model}
            <li><ModelCard modelTitle={model.modelTitle} modelAuthor={model.modelAuthor}
                modelId={model.modelId}
                tags={model.tags} modelApproved={model.approved}
                metadata={typeof model.metadata === 'string' ? JSON.parse(model.metadata) : model.metadata} />
            </li>
        {/each}
        </ul>
    </div>
{:else}
    <p> No models found for this tag. </p>
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