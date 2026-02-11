<script>

 import { enhance } from '$app/forms';
 let { form } = $props();

 function onSignIn(googleUser) {
     var profile = googleUser.getBasicProfile();
     console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
     console.log('Name: ' + profile.getName());
     console.log('Image URL: ' + profile.getImageUrl());
     console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
 }
 // Provided by google JWT auth documentation

 import { onMount } from 'svelte';
 import { decodeJwtResponse, onGoogleScriptLoad } from '$lib/google';
 
//  example google code:
  onMount(() => {
    onGoogleScriptLoad(decodeJwtResponse);
  });

 let registering = $state(false);
</script>

<h1>Log In or Register</h1>
<div class="formHolder">
	<form method="post" action="?/login" use:enhance>
		<h2> Manual Sign In / Registration </h2>
		{#if registering}
			<label class="usernameField">
				Username (required for registration):
				<input
					name="username" required="required"
					type="text"
					/>
			</label>
		{/if}
		<label class="emailField">
			Email:
			<input
				name="email"
				
			/>
		</label>
		<label class="passwordField">
			Password:
			<input
				type="password"
					name="password"
				
			/>
		</label>
		{#if !registering}
		<button class="loginButton"
		>Login</button>
		<button class="registerButton" type="button"
			onclick={() => {registering = true}}
			
		>Register</button>
		{:else}
		<button
			formaction="?/register"
			
		>Register</button>
		{/if}
	</form>

	<p style='color: red'>{form?.message ?? ''}</p>

	<div class="googleHolder">
		<h2> Or Log In With Google: </h2>
		<div id="googleSignIn"></div>
	</div>
</div>
<style>
	h1 {
		padding: 1em;
		padding-top: 1.5em;
		background-color: var(--accent-dull);
		text-align: center;
		color: var(--accent-light);
	}

	form {
		margin: 0em;
		padding: 3em;
		padding-top: 0;
		padding-bottom: 1em;
		display: flex;
		flex-direction: column;
		border-bottom: 3px solid var(--primary);
	}

	.formHolder {
		padding: 2em;
		flex-direction: column;
		margin: auto auto;
		width: 50%;
		background-color: var(--primary-light);
		border: 0.4em solid var(--accent-dull);
		border-radius: 25px;
	}

	.usernameField, .emailField, .passwordField {
		margin-bottom: 0.75em;
		color: var(--black);
		font-weight: 800;
	}

	.loginButton {
		margin-bottom: 1em;
		margin-top: 2em;
	}

	h2 {
		text-align: center;
		margin-top: 0em;
	}

	button:hover {
		transform: scale(1.13);
	}

	#googleSignIn {
		margin: auto auto;
		width: 60%;
		border: 2px solid var(--accent-dark);
		margin-bottom: 0.5em;
	}

	button {
		padding: 0.8em 2em;
		font-weight: 600;
		border: none;
		margin: auto auto;
		width: 40%;
		background-color: var(--accent-dull);
		color: var(--white);
		cursor: pointer;
		border-radius: 0.5em;
		transition: transform 0.1s ease-in-out;
	}
</style>
