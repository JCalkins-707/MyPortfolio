<script>
 import { onMount } from 'svelte';
 import CcInfo from "$lib/components/CcInfo.svelte";
 import DrawCanvas from "$lib/components/canvas.svelte";
 import * as anno from "$lib/components/notes2.svelte";

 let { data } = $props();
 // data will now contain the data passed in through the load function
 // in the adjacent +page.server.js

 let account = data.modelEntry.account;
 let model = data.modelEntry.model;
 //outputting the model entry data to console
 //so you can build a page for it more easily
 console.log(account);
 console.log(model);

 let modelFields = {
     title: model.title,
     license: model.license,
     description: model.description,
     metadata: model.metadata,
     deleted: model.deleted,
     tags: data.modelEntry.tags?.join(', ') || '',
     annotations: model.notes
 };


 let currPoint = $state();
 let notes = $state(new anno.NodeSet);
 let addingNode = $state(false);
 let currNode = $derived(notes.selectedNode()[1]);
 let exportData = $state(notes.exportList());
 let sneakyField = $state();

 onMount(() => {
     exportData = null;
 });


</script>

<div class="allContent">
    <div class="modelSlug">
        <DrawCanvas editMode="editMode"
                bind:addingNode={addingNode}
                bind:currPoint={currPoint}
                bind:notes={notes}
                generateThumbnail="generateThumbnail"
                width="500px"
                height="500px"
                src={model.filePath}
                annotations={modelFields.annotations}/>
    </div>
<div class="editPanels">
<fieldset class="annotationField" oninput={()=>exportData = notes.exportList()}>
    <h2> Annotations: </h2>
    <div class="annotationControls">
        {#key exportData}
            <div>
                <select class="annoSelect" bind:value={() => notes.selectedNode()[0], (x) => notes.selectNode(x)}>
                    <option value={null}>None</option>
                    {#each notes.getTitleArray() as annotationNode, i}
                        <option value={i}>
                            {i + 1}: "{notes.getTitleArray()[i]}"
                        </option>
                    {/each}
                </select>
            </div>
        {/key}

    <button onclick={() => addingNode = true}>add</button>
    {#if notes.selectedNode()[0] !== null }
        <button onclick={() => notes.removeSelected()}>delete</button>
    {/if}
    </div>
    {#if notes.selectedNode()[0] !== null}
    <div class="titleSubmit">
        <label for="header">Annotation title:</label>
        <input name="header" id="header" type="text" bind:value={() => notes.header(),
                                                                (x) => notes.setHeader(x)}/>
    </div>
    <div class="bodySubmit">
        <label for="body">Annotation body:</label>
        <input name="body" id="body" type="text" bind:value={() => notes.body(),
                                                            (x) => notes.setBody(x)}/>
    </div>
    {/if}
</fieldset>

<form method="POST" enctype="multipart/form-data">
    <fieldset class="editField">
        <div class="fileInput">
            <p> Current file: {model.filePath} </p>
            <!--<label for="fileInput">Choose a File:</label>
                 <input type="file" id="fileInput" name="fileInput" accept=".glb,.stl,.obj,.ply,.gltf" />-->
        </div>
        <div class="modelName">
            <label for="modelName">Title:</label>
            <input type="text" id="modelName" name="title" value={modelFields.title} required="required" />
        </div>
        <div class="modelDescription">
            <label for="modelDescription">Description (Optional):</label>
            <input type="text" id="modelDescription" name="description" value={modelFields.description} />
        </div>
        <div class="modelTags">
            <label for="tags"> Tags (Comma-separated): </label>
            <input type="text" name="tags" id="tags" bind:value={modelFields.tags}
                   placeholder="ex: 3D, Fantasy, Creature" />
        </div>
        <div class="license">
            <label for="license">Creative License:</label>
            <CcInfo />
            <select name="license" id="license" bind:value={modelFields.license}>
                <option value="CC BY">CC BY</option>
                <option value="CC BY-SA">CC BY-SA</option>
                <option value="CC BY-NC">CC BY-NC</option>
                <option value="CC BY-NC-SA">CC BY-NC-SA</option>
                <option value="CC BY-ND">CC BY-ND</option>
                <option value="CC BY-NC-ND">CC BY-NC-ND</option>
                <option value="CC0">CC0</option>
            </select>
        </div>
        <div class="delete">
            <label for="delete"> Delete model: </label>
            <input type="checkbox" name="delete" checked={(modelFields.deleted)?'checked':''}/>
        </div>
        <input type="hidden" name="nodeList" bind:this={sneakyField} value={exportData}/>
        <input type="submit"/>
    </fieldset>
</form>
</div>
</div>

<style>

    .allContent {
        display: flex;
        margin-top: 2em;
    }

    .modelSlug {
        justify-content: center;
        width: 80%;
        margin: auto auto;
        margin-top: 2em;
        position: relative;
        right: -150px;
        caret-color: transparent;
    }

    @media (max-width: 1100px) {
        .modelSlug {
            right: 0px;
        }
    }

    @media (max-width: 700px) {
        .modelSlug {
            right: 60px;
        }
    }

    fieldset {
		width: 60%;
		margin: 3em auto;
		border-radius: 25px;
		background-color: var(--primary-light);
		border: 0.4em solid var(--accent-dull);
		padding: 2em;
        /*display: flex;*/
        align-items: center;
		/*gap: 1.5em;*/
		color: var(--black);
		font-weight: 600;
    }

    .editPanels {
        position: relative;
        left: -60px;
    }

    .annotationField {
        width: 45%;
    }

    .annotationControls {
        display: flex;
        justify-content: center;
        gap: 0.5em;
    }

    .titleSubmit {
        margin-bottom: 0.2em;
        margin-top: 0.2em;
    }

    .titleSubmit input {
        min-width: 50px;
        max-width: 300px;
    }

    button, [type=submit], .annoSelect {
		padding: 0.5em 1em;
		font-weight: 600;
		border: none;
		background-color: var(--accent-dull);
		color: var(--white);
		cursor: pointer;
		border-radius: 0.5em;
		transition: transform 0.1s ease-in-out;
	}

	button:hover, [type=submit]:hover, .annoSelect:hover {
		transform: scale(1.13);
	}

</style>
