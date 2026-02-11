<h1> Administration </h1>

<div class="buttonHolder">
    <div class="tagSettingsInfo">
        <h2 class="tagHeader"> Tag Settings </h2>
        <hr />
        <p> Control tag upload permissions. </p>
        <a href="/admin/tagsettings">Tag Settings</a>
    </div>
    <div class="approvalQueueInfo">
        <h2 class="approvalHeader"> Approval Queue </h2>
        <hr />
        <p>Approve or deny user submissions.</p>
        <a href="/admin/reviewqueue">Approval Queue</a>
    </div>
        <div class="userModerationInfo">
        <h2 class="userHeader"> User Moderation </h2>
        <hr />
        <p>Moderate user accounts.</p>
        <a href="/admin/users">User Moderation</a>
    </div>
</div>

<style>
    h1 {
		padding: 1em;
		padding-top: 1.5em;
		background-color: var(--accent-dull);
		text-align: center;
		color: var(--accent-light);
        margin-bottom: 0;
	}

    .buttonHolder {
        margin: 2em 0em;
        display: flex;
        align-items: center;
        justify-content: center;
        align-items: stretch;
        gap: 2em;
    }

    .tagSettingsInfo, .approvalQueueInfo, .userModerationInfo {
        flex: 1 1 250px;
        max-width: 350px;
        max-height: 500px;
		border-radius: 25px;;
		background-color: var(--primary-light);
		border: 0.4em solid var(--accent-dull);
		padding: 1em;
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 1.5em;
		color: var(--black);
		font-weight: 600;
        box-sizing: border-box;
    }

    hr {
        width: 50px;
        color: var(--accent-dull);
        z-index: 2;
        margin: auto;
    }

    h2 {
        margin-bottom: 0;
        font-size: 1.5rem;
        flex-grow: 0;
    }

    p {
        padding-top: 2em;
        margin: auto;
    }

    a {
        text-decoration: none;
        margin-top: auto;
		padding: 0.8em 2em;
		font-weight: 600;
		border: none;
		background-color: var(--accent-dull);
		color: var(--white);
		cursor: pointer;
		border-radius: 0.5em;
		transition: transform 0.1s ease-in-out;
	}

	a:hover {
		transform: scale(1.13);
	}

</style>