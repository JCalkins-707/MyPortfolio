<div class="tooltip">
    &#9432;
    <div class="tooltiptext"> 
        <p>How can others share and modify your work?</p>
        <br />
        <p>View the <a target="_blank" 
            href="https://creativecommons.org/share-your-work/cclicenses/">
        Creative Commons</a> website to learn more about CC licenses. </p>
    </div>
</div>

<style>
    .tooltip {
        position: relative;
        display: inline-block;
        border-bottom: 2px dotted var(--black);
        cursor: pointer;
        padding-bottom: 0em;
        caret-color: transparent;
    }

    .tooltiptext {
        visibility: hidden;
        width: 10em;
        background-color: var(--black);
        color: var(--white);
        padding: 1em 1.5em;
        position: absolute;
        z-index: 1;
        border-radius: 25px;
    }

    .tooltiptext p {
        padding: 0em;
        margin: 0em;
    }


    .tooltip:hover .tooltiptext {
        visibility: visible;
    }

</style>