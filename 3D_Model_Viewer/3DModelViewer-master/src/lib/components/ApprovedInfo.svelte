<div class="tooltip">
    &#9989;
    <div class="tooltiptext"> 
        <div>This model is <span class="importantText">verified</span>.
        Verified models have been approved by administrators.</div>
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
        width: 11em;
        background-color: var(--black);
        color: var(--white);
        padding: 1em 1.5em;
        position: absolute;
        z-index: 1000;
        border-radius: 25px;
        right: 0;
        left: auto;
    }

    .tooltiptext div {
        padding: 0em;
        margin: 0em;
    }


    .tooltip:hover .tooltiptext {
        visibility: visible;
    }

    .importantText {
        color: var(--approved-green);
    }

</style>