<script>
    import Page from "./auth/+page.svelte";
    import ModelCard from "$lib/components/ModelCard.svelte";
    export let data;
    console.log(data);
</script>

<div class="main_header_bkg">
    <h1> 3D Model Viewer </h1>
    <p> Welcome{data.username ? `, ${data.username}` : ''}! </p>
    <hr class="stylized_bar" />
</div>

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
    h1, .main_header_bkg p {
        margin-top: 0;
        padding-top: 0;
        color: var(--white);
        text-align: center;
    }

    h1 {
        font-size: 28pt;
    }

    p {
        font-size: 15pt;
        margin-bottom: 0;
    }

    .main_header_bkg {
        background-color: var(--accent-dull);
        margin-top: 0;
        padding-top: 9em;
        padding-bottom: 6em;
    }

    .stylized_bar {
        color: var(--white);
        position: relative;
        top: 60px;
        width: 50vw;
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
