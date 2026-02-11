<script>
 let {data} = $props();

 const accounts = data.results;

</script>
<h1> All Users </h1>
<div class="userBox">
    <p class="listHead">Click on an account to moderate it.</p>
    <div class="userList">
        <ul> 
            {#each accounts as account}
                <li><a href="/profile/{account.accId}">{account.username}</a></li>
            {/each}
        </ul>
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

    .userBox{
		width: 60%;
		margin: 3em auto;
		border-radius: 25px;;
		background-color: var(--primary-light);
		border: 0.4em solid var(--accent-dull);
		padding: 2em;
		gap: 1.5em;
		color: var(--black);
		font-weight: 600;
        display: flex;
        flex-direction: column;
    }

    .userList {
        background-color: var(--primary);
        z-index: 1;
        border: 0.4em solid var(--accent-dark);
        border-radius: 25px;
        overflow-y: auto;
        max-height: 300px;
    }

    .userList ul {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .userList li {
        border-top: 1px solid var(--accent-dark);
    }

    .userList li:first-child {
        border-top: none;
    }

    .userList li a {
        display: block;
        padding: 0.8em 1em;
        color: var(--black);
        text-decoration: none;
        transition: background 0.15s ease;
        font-weight: 700;
    }

    .userList li a:hover {
        background-color: var(--accent-light);
    }

    .listHead {
        margin-top: 0;
    }

    ul {
        list-style-type: none;
    }

</style>

