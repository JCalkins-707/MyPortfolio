<script>
 import ModelCard from "$lib/components/ModelCard.svelte";
 let { data } = $props();
 var modelsList = $state(data);
 console.log(modelsList);
 function hideModel(modelId, list){
     const index = modelsList.results.findIndex(element => element.modelId == modelId);
     modelsList.results.splice(index,1);
 }

</script>
<h1> Model Approval Queue </h1>
{#if modelsList.results.length > 0}
    <ul>
        {#each modelsList.results as result (result.modelId)}
            <li>
                <ModelCard modelTitle={result.modelTitle}
                            modelAuthor={result.modelAuthor}
                            modelId={result.modelId}
                            updateCallback={hideModel}
                            tags={result.tags}
                            showReview=true/>
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
