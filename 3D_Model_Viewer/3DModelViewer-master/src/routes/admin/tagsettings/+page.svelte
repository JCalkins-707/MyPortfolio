<script>
    export let data;
</script>
<h1> Tag Approval </h1>

<form method="POST">
    <fieldset>
        <h2> Tag Approval </h2>
        <p> When toggled on, submissions
            uploaded to that tag will require
            approval from administrators. </p>
        <ul>
            {#each data.tags as tag}
                <li>
                    <label>
                        <input type="checkbox" name={"tag-" + tag.tagId} checked={tag.requiresApproval} />
                        {tag.name}
                    </label>
                </li>
            {/each}
        </ul>
        <button type="submit"> Save Changes </button>
    </fieldset>
</form>

{#if data.success}
    <p> Tag permissions updated successfully. </p>
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
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        align-items: center;
        list-style-type: none;
    }

    h2 {
        margin: 0;
    }

    p {
        margin: 0;
        text-align: center;
    }

    fieldset {
		width: 60%;
		margin: 3em auto;
		border-radius: 25px;;
		background-color: var(--primary-light);
		border: 0.4em solid var(--accent-dull);
		padding: 2em;
        display: flex;
        align-items: center;
		flex-direction: column;
		gap: 1.5em;
		color: var(--black);
		font-weight: 600;
    }

    li {
        padding: 0.3em;
    }
    
    button {
        text-decoration: none;
        width: 70%;
        align-self: center;
		padding: 0.8em 2em;
		font-weight: 600;
		border: none;
		background-color: var(--accent-dull);
		color: var(--white);
		cursor: pointer;
		border-radius: 0.5em;
		transition: transform 0.1s ease-in-out;
	}

	button:hover {
		transform: scale(1.13);
	}


</style>