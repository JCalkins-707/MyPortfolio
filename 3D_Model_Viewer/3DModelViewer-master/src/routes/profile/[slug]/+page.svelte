<script>
    import { userData } from 'three/tsl';

    let { data } = $props();
 // data will now contain the data passed in through the load function
 // in the adjacent +page.server.js

 //outputting the model entry data to console
 //so you can build a page for it more easily
    const account = $state(data.account);
    const isAdmin = data.isAdmin;

 function updatePage(){

 }

 //this is used to update the properties of the profile
 //both in the database and in the live page view.
 async function adminAction(account, action){
         const formData = new FormData();
         const response = await fetch('?/'  + action, {
             method: 'POST',
             body: formData
         });

     if(response.ok){
         switch(action){
             case "deleted":
                 account.deleted = !account.deleted;
                 break;
             case "admin":
                 account.admin = !account.admin;
                 break;
         }
     }
 }

</script>

<h1>User Profile</h1>
{#if account}
    {#key account.deleted}
    <div class="profileHolder {(account.deleted)? "Deleted" : ''}">
        <!--<ul>
            <li><span>Username:</span> {account.username}</li>
            <li><span>Email:</span> {account.email || 'No email, third-party account'}</li>
            <li><span>Institution:</span> {account.institution || 'Not provided'}</li>
            <li><span>Role:</span> {account.role || 'Not assigned'}</li>
        </ul>-->
        <table>
            <tbody>
                <tr>
                    <th class="first">Username:</th>
                    <th class="first">{account.username}</th>
                </tr>
                <tr>
                    <th>Email:</th>
                    <th>{account.email || 'No email.'}</th>
                </tr>
                <tr>
                    <th>Institution:</th>
                    <th>{account.institution || 'No institution.'}</th>
                </tr>
                <tr>
                    <th>Role:</th>
                    {#if account.admin == '1' || account.admin == 'true'}
                        <th>Administrator</th>
                    {:else}
                        <th>Author</th>
                    {/if}
                </tr>
            </tbody>
        </table>
        <div class="buttonBox">
            <a href="./{account.accId}/models" class="button"> View Models </a>
            {#if isAdmin}
                <button class="button" onclick={()=>adminAction(account, "admin")}> Toggle Admin </button>
                <button class="button" onclick={()=>adminAction(account, "deleted")}> Toggle Deletion </button>
            {/if}
        </div>
    </div>
    {/key}
{:else}
    <p>You are not logged in.</p>
{/if}

<style>
    .Deleted{
        opacity: 50%
    }

	h1 {
		padding: 1em;
		padding-top: 1.5em;
		background-color: var(--accent-dull);
		text-align: center;
		color: var(--accent-light);
	}

	.profileHolder {
		width: 70%;
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

	p {
		margin: 0;
		text-align: center;
	}

        tr {
        text-align: left;
    }

    th {
        padding-right: 2em;
    }

    th, td {
        border-top: 1px dashed var(--accent-dull);
        border-collapse: collapse;
        padding-top: 0.3em;
        padding-bottom: 0.3em;
    }

    .first {
        border: 0;
    }

	.button, button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        padding: 1em 2em;
        font-weight: 600;
        border: none;
        background-color: var(--accent-dull);
        color: var(--white);
        cursor: pointer;
        border-radius: 0.5em;
        transition: transform 0.1s ease-in-out;
        box-sizing: border-box;
        width: 150px;
        height: 50px;
        font-size: 1rem;
        text-align: center;
        vertical-align: middle;
        margin-right: 1.5em;
	}

    .buttonBox, .button:last-child {
        margin-right: 0;
    }

	.button:hover {
		transform: scale(1.13);
	}

</style>
