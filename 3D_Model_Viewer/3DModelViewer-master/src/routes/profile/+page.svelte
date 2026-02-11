<script>
    import { userData } from 'three/tsl';

    let { data } = $props();
 // data will now contain the data passed in through the load function
 // in the adjacent +page.server.js

    //let account = data.account;
 //outputting the model entry data to console
 //so you can build a page for it more easily
    //console.log(account);
    const account = data.account;
    console.log(account);

</script>

<h1>User Profile</h1>
{#if account}
    <div class="profileHolder {(account.deleted)? 'Deleted':''}">
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
                    <td class="first">{account.username}</td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td>{account.email || 'No email.'}</td>
                </tr>
                <tr>
                    <th>Institution:</th>
                    <td>{account.institution || 'No institution.'}</td>
                </tr>
                <tr>
                    <th>Role:</th>
                    {#if account.admin == '1' || account.admin == 'true'}
                        <td>Administrator</td>
                    {:else}
                        <td>Author</td>
                    {/if}
                </tr>
            </tbody>
        </table>
        <fieldset>
        <a href="/model/mymodels" class="button"> View My Models </a>
        <a href="/auth" class="button"> Sign Out </a>
        </fieldset>
    </div>
{:else}
    <p>You are not logged in.</p>
{/if}

<style>
	h1 {
		padding: 1em;
		padding-top: 1.5em;
		background-color: var(--accent-dull);
		text-align: center;
		color: var(--accent-light);
	}

	.profileHolder {
		width: 40%;
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

    .Deleted {
    opacity:50%;
    }

    .first {
        border: 0;
    }

	.button {
        text-decoration: none;
		padding: 0.8em 2em;
		font-weight: 600;
		border: none;
		background-color: var(--accent-dull);
		color: var(--white);
		cursor: pointer;
		border-radius: 0.5em;
		transition: transform 0.1s ease-in-out;
	}

	.button:hover {
		transform: scale(1.13);
	}

</style>
