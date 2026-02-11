<script >
	import { enhance } from '$app/forms';
	
	let { data } = $props();
</script>

<h1> You are logged in. </h1>

<div class="login_container">
	<h2>Hi, <span>{data.user.username}</span>!</h2>
	<p>Your user ID is <span class="userid">{data.user.id}</span>.</p>
	<form method='post' action='?/logout' use:enhance>
		<button type="submit" class="logout_button">Sign out</button>
	</form>
</div>

<style>
	h1 {
		padding: 1em;
		padding-top: 1.5em;
		background-color: var(--accent-dull);
		text-align: center;
		color: var(--accent-light);
	}

	.login_container {
		width: 30%;
		margin: 3em auto;
		border-radius: 25px;;
		background-color: var(--primary-light);
		border: 0.4em solid var(--accent-dull);
		padding: 2em;
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 1.5em;
		color: var(--black);
		font-weight: 600;
	}

	h2 {
		margin: 0;
		text-align: center;
	}

	h2 span {
		color: var(--accent-dark);
	}

	p {
		margin: 0;
		text-align: center;
	}

	.userid {
		color: var(--accent-dull);
		font-weight: 700;
	}

	form {
		margin-top: 1em;
	}

	.logout_button {
		padding: 0.8em 2em;
		font-weight: 600;
		border: none;
		background-color: var(--accent-dull);
		color: var(--white);
		cursor: pointer;
		border-radius: 0.5em;
		transition: transform 0.1s ease-in-out;
	}

	.logout_button:hover {
		transform: scale(1.13);
	}
</style>