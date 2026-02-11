<script>
import CcInfo from "$lib/components/CcInfo.svelte";

 let fileUrl; //unused

 let { form } = $props();

</script>

<h1> Upload New Model </h1>

<form method="POST" action="?/uploadFile" enctype="multipart/form-data">
    <fieldset>
        <div class="fileInput">
            <label for="fileInput">Choose a File:</label>
            <input type="file" id="fileInput" name="fileInput" required="required" accept=".glb,.obj,.stl,.ply,.3ds" />
        </div>
        <div class="modelName">
            <label for="modelName">Title:</label>
            <input type="text" id="modelName" name="modelName" required="required" />
        </div>
        <div class="modelDescription">
            <label for="modelDescription">Description (Optional):</label>
            <input type="text" id="modelDescription" name="modelDescription" />
        </div>
        <div class="modelTags">
            <label for="modelTags"> Tags (Comma-separated): </label>
            <input type="text" id="modelTags" name="modelTags"
                required="required" placeholder="ex: 3D, Fantasy, Creature" />
        </div>
        <div class="license">
            <label for="license">Creative License:</label>
            <CcInfo />
            <select name="license" id="license">
                <option value="CC BY">CC BY</option>
                <option value="CC BY-SA">CC BY-SA</option>
                <option value="CC BY-NC">CC BY-NC</option>
                <option value="CC BY-NC-SA">CC BY-NC-SA</option>
                <option value="CC BY-ND">CC BY-ND</option>
                <option value="CC BY-NC-ND">CC BY-NC-ND</option>
                <option value="CC0">CC0</option>
            </select>
        </div>
        <button type="submit" id="uploadButton">Upload</button>
    </fieldset>
<p style='color: red'>{form?.message ?? ''}</p>
</form>

<!-- unused -->
{#if fileUrl}
    <model-viewer
id="viewer"
camera-controls
auto-rotate
style="width: 600px; height: 400px;"
src={fileUrl}
    ></model-viewer>
    {/if}
<!-- end unused -->

<style>
    h1 {
        padding: 1em;
        padding-top: 1.5em;
        background-color: var(--accent-dull);
        text-align: center;
        color: var(--accent-light);
    }

    fieldset {
		width: 30%;
		margin: 3em auto;
		border-radius: 25px;;
		background-color: var(--primary-light);
		border: 0.4em solid var(--accent-dull);
		padding: 2em;
		display: flex;
		flex-direction: column;
		gap: 1.5em;
		color: var(--black);
		font-weight: 600;
    }
    
    #uploadButton {
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

	#uploadButton:hover {
		transform: scale(1.13);
	}

</style>
