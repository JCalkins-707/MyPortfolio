<script>
 import { onMount } from 'svelte';
 import CcInfo from "$lib/components/CcInfo.svelte";
 import DrawCanvas from "$lib/components/canvas.svelte";
 import * as anno from "$lib/components/notes2.svelte";
 let { data } = $props();
 // data will now contain the data passed in through the load function
 // in the adjacent +page.server.js

 let model = data.modelEntry.model;
 let account = data.modelEntry.account;
 let tags = data.tags;
 let editable = data.editable;

 //outputting the model entry data to console
 //so you can build a page for it more easily
 console.log(account);
 console.log(model);

 let modelViewport;

 //annotation state stuff
 let currPoint = $state();
 let notes = $state(new anno.NodeSet);
 let currNode = $derived(notes.selectedNode()[1]);

 /*
    enterFullscreen():
    allows for requesting fullscreen
    for regular, safari, and edge browsers
  */
 function enterFullscreen() {
     if (modelViewport.requestFullscreen) {
         modelViewport.requestFullscreen();
     }
     else if (modelViewport.webkitRequestFullscreen) {
         modelViewport.webkitRequestFullscreen();
     }
     else if (modelViewport.msRequestFullscreen) {
         modelViewport.msRequestFullscreen();
     }
 }

 /*
    exitFullscreen():
    allows for exiting fullscreen
    for regular, safari, and edge browsers
  */
 function exitFullscreen() {
     if (document.exitFullscreen) {
         document.exitFullscreen();
     }
     else if (document.webkitExitFullscreen) {
         document.webkitExitFullscreen();
     }
     else if (document.msExitFullscreen) {
         document.msExitFullscreen();
     }
 }

 let documentConst = $state();

 function toggleFullScreen(event) {
     if(event.key === "F11"){
         event.preventDefault();
         enterFullscreen();
         console.log(documentConst.fullscreenElement);
     }
 }


</script>
<svelte:document bind:this={documentConst} onkeydown={toggleFullScreen}/>
<div class="pageContent">
    <div class="modelSlug"
         bind:this={modelViewport} >
        
        <div class="viewport" >
            <DrawCanvas bind:currPoint={currPoint}
                        bind:notes={notes}
                        width="500px"
                        height="500px"
                        src={model.filePath}
                        annotations={model.notes}/>
        </div>
            {#if currNode}
                <div class="annotations">
                    <h1>{currNode.header}</h1>
                    <p>{currNode.body}</p>
                </div>
            {/if}
            <div class="modelInfo">
            <div class="modelText">
                <h1>{model.title}</h1>
                <p> By: <a href="/profile/{account.accId}" class="user"
                        alt="View account for {account.username}">
                    {account.username}
                </a> </p>
                <p> Uploaded On: {model.uploadDate} </p>
            {#if editable}
                <a href="/model/edit/{model.modelId}"> Edit Entry </a>
            {/if}
                <p> License <CcInfo />: {model.license} </p>
                <div class="description">
                    {#if model.description}
                        <p> Model Description: {model.description} </p>
                    {:else}
                        <p> No description given by uploader. </p>
                    {/if}
                </div>
            </div>
                {#if tags.length > 0}
                    <div class="tagBox">
                    {#each tags as tag}
                        <a class="tagLink" href='/model/viewby/{tag}'> {tag} </a>
                    {/each}
                    </div>
      {:else}
                    <p> No tags assigned </p>
                {/if}
            {#if model.metadata}
                <!-- <p> Metadata: {model.metadata} </p> -->
            {:else}
                <!-- <p> No additional metadata provided. </p> -->
            {/if}
        </div>
    </div>
</div>

<style>
    .pageContent {
         display: flex;
         flex-direction: row;
         justify-content: center;
         margin-top: 2em;
    }

    a.user {
        text-decoration: none;
        color: var(--black);
    }

    a.user:hover {
        color: var(--accent-dull);
    }

    .modelSlug {
         display: flex;
         flex-direction: column;
         align-items: center;
         background-image: linear-gradient(0deg, var(--white), var(--primary-light));
         margin: 4em;
         /*padding-left: 1em;
         padding-right: 1em;*/
         border-radius: 50px;
         border: 3px solid var(--accent-dull);
         filter: drop-shadow(9px 9px 9px var(--primary-light));
    }

    .annotations {
         width: 40em;
         background-image: linear-gradient(180deg, var(--primary-light), var(--primary));
         padding: 1.5em;
         border-radius: 3em;
         filter: drop-shadow(5px 5px 5px var(--primary-light));
    }

    .modelText {
        margin-left: 1em;
    }

    .description {
         width:50em;
         margin: 1em;
         margin-left: 0;
         margin-bottom: 3em;
    }

    .viewport {
         width: 80%;
         display: flex;
         flex-direction: column;
         justify-content: center;
         align-items: center;
         /*max-width: 800px;
            min-width: 300px;*/
         aspect-ratio: 3/2;
         height: auto;
         max-height: 400px;
         margin-top: 4em;
    }

    .tagBox {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        height: 20%;
        background-color: var(--accent-dark);
        gap: 2px;
        box-shadow: inset 0px 2px 5px var(--black);
        overflow: hidden;
        position: relative;
        top: -40px;
    }

    .tagBox:last-child {
        border-bottom-left-radius: 50px;
        border-bottom-right-radius: 50px;
    }

    .tagLink {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100%;
        width: 100%;
        background-color: var(--accent-dull);
        box-shadow: inset 0px 2px 5px var(--accent-dark);
        cursor: pointer;
        transition: 100ms ease;
        gap: 5px;
        text-decoration: none;
    }

    .tagLink:hover {
        scale: 0.9;
        border-radius: 10px;
     }

    .tagLink {
        font-size: 10pt;
        font-weight: 500;
        color: var(--white);
    }

</style>


