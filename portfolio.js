document.addEventListener("DOMContentLoaded", function() {

// collapsible bar code for Collaborative Projects
    var collapseCollab = document.getElementsByClassName("collapsible_collab");
    var i;

    for (i = 0; i < collapseCollab.length; i++) {
        collapseCollab[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            if (content.style.display === "block") {
                content.style.display = "none";
            }
            else {
                content.style.display = "block";
            }
        });
    }

// collapsible bar for HCAR Project
    var collapseHcar = document.getElementsByClassName("collapsible_hcar");
    var j;

    for (j = 0; j < collapseHcar.length; j++) {
        collapseHcar[j].addEventListener("click", function() {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            if (content.style.display === "block") {
                    content.style.display = "none";
            }
            else {
                    content.style.display = "block";
            }
        });
    }

// collapsible bar for Cat Cafe Database

    var collapsePetDB = document.getElementsByClassName("collapsible_pet_db");
    var k;

    for (k = 0; k < collapsePetDB.length; k++) {
        collapsePetDB[k].addEventListener("click", function() {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            if (content.style.display === "block") {
                content.style.display = "none";
            }
            else {
                content.style.display = "block";
            }
        });
    }


// collapsible bar for Personal Projects

    var collapsePersonal = document.getElementsByClassName("collapsible_personal");
    var l;

    for (l = 0; l < collapsePersonal.length; l++) {
        collapsePersonal[l].addEventListener("click", function() {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            if (content.style.display === "block") {
                content.style.display = "none";
            }
            else {
                content.style.display = "block";
            }
        });
    }

// collapsible bar for Inn Database
    
    var collapseInnDb = document.getElementsByClassName("collapsible_inn_db");
    var m;

    for (m = 0; m < collapseInnDb.length; m++) {
        collapseInnDb[m].addEventListener("click", function() {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            if (content.style.display === "block") {
                content.style.display = "none";
            }
            else {
                content.style.display = "block";
            }
        });
    }

// collabsible bar for GameCard Project
    var collapseGamecard = document.getElementsByClassName("collapsible_gamecard");
    var n;

    for (n = 0; n < collapseGamecard.length; n++) {
        collapseGamecard[n].addEventListener("click", function() {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            if (content.style.display === "block") {
                content.style.display = "none";
            }
            else {
                content.style.display = "block";
            }
        });
    }



});