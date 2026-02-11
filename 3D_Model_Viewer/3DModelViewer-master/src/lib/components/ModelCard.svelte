<script>
 import ApprovedInfo from "./ApprovedInfo.svelte";
 import UnapprovedInfo from "./UnapprovedInfo.svelte";
 export let modelTitle = 'Empty Model';
 export let modelAuthor = 'Unknown';
 export let modelDeleted = false;
 export let modelApproved = false;
 export let modelId;
 export let isAuthor = false;
 export let isAdmin = false;
 export let showReview = false;
 export let updateCallback = null;

 console.log({modelApproved});
 console.log({modelDeleted});

let cacheBust = Date.now();
$: thumbSrc = `/static/models/thumbs/${modelId}.png?cb=${cacheBust}`;
$: titleLength = modelTitle.length;

 export let tags = [];

 async function submitReview(modelId, decision, callback){
     if(decision == "1" || decision == "0"){
         const formData = new FormData();
         formData.append("approved", decision);
         const url = '/model/' + modelId + '?review';

         const response = await fetch('/model/' + modelId + '?/review', {
             method: 'POST',
             body: formData
         });
         if(response.ok && callback){
             callback(modelId);
         }
     }
 }

 async function onclick(event){
     const response = await submitReview(modelId, event.originalTarget.value, updateCallback);
 }

 
</script>
    <div class="ModelCard {(modelDeleted)?"Deleted":""}">
        <div class="top_strip"></div>
        <section class="model_info">
            <div class="left_side"></div>
            <div class="middle_side">
                <a href='/model/{modelId}' alt={modelTitle}>
                    <div class="thumbnailHolder">
                        <img class="thumbnail" src={thumbSrc} alt={modelTitle}
                        onerror={(e) => {
                            e.target.src = '/static/sleepy-cat-transparent.png';
                        }} />
                    </div>
                    <h2 class="model_name" style="--title-length: {titleLength}">
                        {modelTitle}
                    </h2>
                </a>
                <p class="model_author"> By: {modelAuthor} </p>
            </div>
            <div class="right_side">
                {#if modelApproved === true || modelApproved === 1}
                    <p class="model_approved"><ApprovedInfo /></p>
                {:else}
                    <p class="model_unapproved"><UnapprovedInfo /></p>
                {/if}
            </div>
        </section>
            <div class="model_tags">
                {#if tags.length === 0}
                    <p class="null_tag">This model has no tags.</p>
                {/if}
                {#each tags as tag}
                    <a href='/model/viewby/{tag}'> {tag} </a>
                {/each}
            </div>
            {#if isAuthor == true || isAdmin == true}
            <div class="editShell">
                <a class="goEdit" href={`/model/edit/${modelId}`}> Edit </a>
            </div>
            {/if}
            {#if isAdmin || showReview}
            <div class="approvalShell">
                <button class="approve" value="1" {onclick}> Approve </button>
                <button class="deny" value="0" {onclick}> Deny </button>
            </div>
            {/if}
    </div>

<style>

    /* card structure */
    .ModelCard {
        display: flex;
        flex-direction: column;
        align-items: center;
        height: 375px;
        width: 350px;
        border-radius: 25px;
        background: var(--accent-dark);
        transition: 100ms ease;
        box-shadow: rgba(0,0,0,0.15) 2px 3px 4px;
        margin: 1em;
        position: relative;
    }

 .Deleted{
     opacity: 50%;
 }

    .model_info {
        position: relative;
        display: flex;
        background-color: var(--primary);
    }

    .top_strip {
        background-color: var(--accent-dark);
        height: 30px;
        width: 100%;
        z-index: 1;
        top: 0;
        border-top-left-radius: 25px;
        border-top-right-radius: 25px;
    }

    .thumbnailHolder {
            border-bottom: 10px solid var(--primary);
            width: 280px;
    }

    .null_tag {
        color: var(--white);
    }
    /* card content */
    .thumbnail {
        width: 60%;
        object-fit: contain;
        animation: float 6s cubic-bezier(0.45, 0.05, 0.65, 0.95) infinite;
    }

    @keyframes float {
        0% {
            transform: translateY(0px) rotate(0deg);
        }
        33% {
            transform: translateY(-6px) rotate(3deg);
        }
        66% {
            transform: translateY(0px) rotate(-3deg);
        }
        100% {
            tranform: translateY(0px) rotate(0deg);
        }
    }

     a {
        text-decoration: none;
     }

     .left_side {
        background-color: var(--accent-dark);
        width: 30px;
     }

     .middle_side {
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        border: 5px solid var(--primary);
        background-color: var(--primary-light);
     }

     .right_side {
        background-color: var(--accent-dark);
        width: 30px;
        text-align: center;
     }

     .model_name {
        font-size: clamp(12px, calc(26px - (0.3px * (var(--title-length, 0)))), 26px);
        text-align: center;
        color: var(--black);
     }

     .model_name:hover, .model_name:visited {
        color: var(--accent-dark);
     }

     .model_tags {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        height: 25%;
        background-color: var(--accent-dark);
        gap: 2px;
        box-shadow: inset 0px 2px 5px var(--black);
        overflow: hidden;
     }

     .model_tags:last-child {
border-bottom-left-radius: 25px;
        border-bottom-right-radius: 25px;
     }

     .model_tags p, .model_tags a {
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
     }

     .model_tags a:hover {
        scale: 0.9;
        border-radius: 10px;
     }

     .model_tags a {
        font-size: 10pt;
        font-weight: 500;
        color: var(--white);
     }

     .editShell, .approvalShell {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        height: 25%;
        background-color: var(--accent-dark);
        gap: 2px;
        box-shadow: inset 0px 2px 5px var(--black);
        overflow: hidden;
        border-bottom-left-radius: 25px;
        border-bottom-right-radius: 25px;
     }

     .goEdit, .approve, .deny {
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
        color: var(--white);
     }

     .approve, .deny {
        border: 0;
     }

     .approve {
        background-color: var(--approved-green);
        color: var(--black);
        font-weight: 600;
     }

     .deny {
        background-color: var(--unapproved-red);
        color: var(--black);
        font-weight: 800;
     }

     .editShell a:hover, .approvalShell button:hover {
        scale: 0.9;
        border-radius: 10px;
     }

</style>

