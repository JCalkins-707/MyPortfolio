<script>
    let { children } = $props();
</script>

<footer>
    <p>CS 458 - Senior Capstone Project</p>
    <p> Cal Poly Humboldt </p>
    <p> By Julia Calkins, Matthew MacDevitt, 
        Aidan Sevillia, and Michael Thoreson </p>

    <p>Visit <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a> to read the documentation</p>
</footer>

<style>
    footer {
        margin-top: 3em;
        border-top: 0.5em solid var(--accent-dark);
        background-color: var(--primary);
        padding-top: 1em;
        padding-bottom: 1em;
    }

    a {
        text-decoration: none;
    }

</style>