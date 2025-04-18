// Julia Calkins
// CS 112 - Project 6
// Last modified: 14-Dec-2024

#include <iostream>
#include <string>
#include <cmath>
#include "CardPack.h"

int main() {

    srand(time(0));

/*  cout << "*** TEST OF GAMECARD == OPERATOR***" << endl;
    DerivedGameCard jim;
    GameCard mike;
    GameCard janet;

    janet.setName("Destroyer");
    janet.setHP(4);
    janet.setATK(10);
    janet.setMIT(3);
    janet.setCD(3);
    janet.setKingdom(Thiamoth);
    janet.setType(Draconic);
    janet.setRank(Five);


    if (janet == mike) {
        cout << "equal" << endl;
    }
    else {
        cout << "unequal" << endl;
    }
*/

    cout << "***TESTING CARDPACK CONSTRUCTORS***" << endl << endl;

    CardPack standardPack;
    cout << "standardPack made." << endl;

    CardPack heroPack("Hero's Pack", 5, 7);
    cout << "heroPack made." << endl;

    CardPack royalPack("Royal Pack", 0, 3);
    cout << "royalPack made." << endl;

    CardPack duplicateStandardPack(standardPack);
    cout << "duplicateStandardPack made." << endl << endl;

    cout << "filling CardPacks..." << endl << endl;

    // card objects for the packs:
    GameCard hunter("Hunter", 1, 2, 0, 2, Rivenay, Human, One);
    GameCard squire("Squire", 2, 1, 0, 1, Rivenay, Human, One);
    GameCard spriggan("Spriggan", 1, 1, 1, 2, Issira, Botanic, One);
    GameCard jaguar("Jaguar", 1, 3, 0, 2, Kawrille, Beast, One);
    GameCard skeleton("Skeleton", 1, 1, 0, 2, Greymire, Undead, One);
    GameCard skyMessenger("Sky Messenger", 1, 2, 0, 4, theBeyond, Celestial, One);
    GameCard imp("Imp", 1, 1, 0, 1, Outcast, Abyssal, One);

    GameCard ghoul("Ghoul", 2, 2, 1, 2, Outcast, Undead, Two);
    GameCard gobLord("Gob Lord", 4, 2, 1, 4, OlenGara, Goblin, Two);
    GameCard whelp("Whelp", 1, 3, 1, 1, Thiamoth, Draconic, Two);
    GameCard ranger("Ranger", 1, 3, 0, 2, Issira, Elf, Two);
    GameCard miner("Miner", 2, 2, 2, 3, Glistenar, Dwarf, Two);
    GameCard rhino("Rhino", 3, 1, 3, 3, Kawrille, Beast, Two);

    GameCard barbarian("Barbarian", 2, 3, 1, 2, OlenGara, Human, Three);
    GameCard zolGuard("Zol'Guard", 4, 3, 1, 4, Zolith, Orc, Three);
    GameCard greatToad("Great Toad", 3, 2, 1, 2, OlenGara, Beast, Three);
    GameCard greenSlime("Green Slime", 3, 3, 1, 3, Greymire, Monstrosity, Three);
    GameCard crusader("Crusader", 4, 2, 3, 5, Rivenay, Human, Three);

    GameCard redDragon("Red Dragon", 6, 3, 2, 4, Thiamoth, Draconic, Four);
    GameCard golem("Golem", 8, 2, 3, 4, Glistenar, Construct, Four);
    GameCard snowElf("Snow Elf", 3, 4, 0, 2, Thiamoth, Elf, Four);
    GameCard squireTwo("Squire", 5, 3, 2, 4, Rivenay, Human, Four);

    GameCard goblin("Goblin", 8, 4, 3, 3, OlenGara, Goblin, Five);
    GameCard skyKnight("Sky Knight", 10, 1, 5, 4, theBeyond, Celestial, Five);
    GameCard fae("Fae", 5, 7, 0, 3, Issira, Ethereal, Five);

    GameCard impTwo("Imp", 8, 5, 3, 1, Outcast, Abyssal, Six);
    GameCard lightningOrb("Lightning Orb", 6, 8, 2, 3, Zolith, Construct, Six);

    GameCard blueSlime("Blue Slime", 16, 4, 4, 3, Greymire, Monstrosity, Seven);

    DerivedGameCard werewolf("Werewolf", 2, 2, 0, 3, Outcast, Human, Beast,
        One, Plain, 3, 2);
    DerivedGameCard mine("Mine", 1, 0, 0, 2, Kawrille, Construct, None,
        One, Plain, 0, 0);
    DerivedGameCard brambleWall("Bramble Wall", 6, 0, 1, 4, Issira, Botanic, Construct,
        One, Plain, 0, 0);
    DerivedGameCard revenant("Revenant", 2, 1, 1, 3, Outcast, Undead, Abyssal,
        One, Plain, 2, 2);
    DerivedGameCard mudcrab("Mudcrab", 1, 1, 1, 2, Greymire, Beast, None,
        One, Plain, 2, 2);
    DerivedGameCard nomad("Nomad", 1, 1, 0, 1, Outcast, Human, Elf,
        One, Plain, 2, 2);
    DerivedGameCard trillopede("Trillopede", 1, 3, 1, 4, OlenGara, Beast, Monstrosity,
        One, Plain, 3, 1);
    DerivedGameCard mason("Mason", 3, 1, 1, 3, Glistenar, Dwarf, None,
        One, Plain, 1, 2);

    DerivedGameCard bigOrc("Big Orc", 4, 1, 1, 3, OlenGara, Orc, None, Two, Plain,
        2, 2);
    DerivedGameCard runeGolem("Rune Golem", 5, 1, 2, 5, Zolith, Construct, Ethereal,
        Two, Plain, 1, 2);
    DerivedGameCard darkKnight("Dark Knight", 3, 2, 0, 4, Greymire, Human, Abyssal,
        Two, Plain, 4, 2);
    DerivedGameCard miningMech("Mining Mech", 4, 2, 1, 4, Glistenar, Dwarf, Construct,
        Two, Plain, 1, 2);
    DerivedGameCard vampire("Vampire", 2, 2, 0, 3, Greymire, Human, Undead,
        Two, Plain, 3, 2);
    DerivedGameCard dryad("Dryad", 1, 2, 1, 2, Issira, Botanic, Ethereal,
        Two, Plain, 2, 2);

    DerivedGameCard wraith("Wraith", 3, 3, 1, 3, Greymire, Undead, Ethereal,
        Three, Plain, 2, 2);
    DerivedGameCard cryomancer("Cryomancer", 2, 4, 1, 3, Thiamoth, Elf, None,
        Three, Plain, 2, 3);
    DerivedGameCard adventurer("Adventurer", 4, 3, 1, 4, Outcast, Human, None,
        Three, Plain, 2, 2);
    DerivedGameCard giantBat("Giant Bat", 4, 2, 0, 3, Greymire, Beast, None,
        Three, Plain, 2, 2);
    DerivedGameCard shaman("Shaman", 4, 2, 0, 2, Kawrille, Human, Elf,
        Three, Plain, 2, 3);

    DerivedGameCard hellhound("Hellhound", 6, 3, 1, 2, Greymire, Beast, Abyssal,
        Four, Plain, 3, 2);
    DerivedGameCard mudcrabTwo("Mudcrab", 5, 3, 2, 2, Greymire, Beast, None,
        Four, Tin, 2, 2);
    DerivedGameCard dragonborn("Dragonborn", 4, 4, 2, 3, Thiamoth, Human, Draconic,
        Four, Plain, 2, 2);
    DerivedGameCard innkeeper("Innkeeper", 4, 2, 0, 1, Rivenay, Human, None,
        Four, Tin, 3, 2);

    DerivedGameCard holySeer("Holy Seer", 6, 2, 1, 3, Issira, Elf, Celestial,
        Five, Bronze, 2, 3);
    DerivedGameCard hoplite("Hoplite", 8, 3, 2, 4, Zolith, Human, Orc,
        Five, Plain, 2, 2);
    DerivedGameCard guardPost("Guard Post", 5, 2, 3, 4, Rivenay, Construct, Human,
        Five, Silver, 0, 3);

    DerivedGameCard geomancer("Geomancer", 8, 4, 3, 4, Glistenar, Dwarf, None,
        Six, Silver, 2, 3);
    DerivedGameCard chosenOne("Chosen One", 13, 4, 4, 5, Kawrille, Human, Ethereal,
        Six, Plain, 2, 2);

    DerivedGameCard ufo("UFO", 12, 7, 9, 5, Outcast, Astral, Construct, Seven,
        Iridescent, 2, 4);

    const int CARDPOOL = 57;

    GameCard cardPoolArray[CARDPOOL] = {
        hunter, squire, spriggan, jaguar, skeleton, skyMessenger, imp,
        ghoul, gobLord, whelp, ranger, miner, rhino,
        barbarian, zolGuard, greatToad, greenSlime, crusader,
        redDragon, golem, snowElf, squireTwo, goblin, skyKnight, fae,
        impTwo, lightningOrb, blueSlime, werewolf, mine,
        brambleWall, revenant, mudcrab, nomad, trillopede, mason,
        bigOrc, runeGolem, darkKnight, miningMech, vampire, dryad,
        wraith, cryomancer, adventurer, giantBat, shaman,
        hellhound, mudcrabTwo, dragonborn, innkeeper,
        holySeer, hoplite, guardPost, geomancer, chosenOne, ufo
        };

    // standardPack:
    for (int i = 0; i < standardPack.getPackSize(); i++) {
        int cardChance = (rand() % CARDPOOL);

        standardPack.setCardAt(i, cardPoolArray[cardChance]);

        while ( (standardPack.getCardAt(i)).getRank() > 4) { // no cards greater than 5 stars
            cardChance = rand() % CARDPOOL;                  // in standardPack

            standardPack.setCardAt(i, cardPoolArray[cardChance]);
        }
    }

    cout << "Trying to add a card to standardPack." << endl;
    cout << "Should return false, since standardPack is full:" << endl;

    if (standardPack.addCard(nomad) == true) {
        cout << "True. Card added successfully." << endl;
    }
    else {
        cout << "False. Cannot add card to the pack." << endl;
    }
    cout << endl;

    // heroPack:

    for (int i = 0; i < heroPack.getPackSize(); i++) {
        int cardChance = rand() % CARDPOOL;
        heroPack.setCardAt(i, cardPoolArray[cardChance]);
    }

    cout << "Trying to add a card to heroPack." << endl;
    cout << "Should return true, since heroPack is not yet full:" << endl;

    if (heroPack.addCard(mudcrabTwo) == true) {
                cout << "True. Card added successfully." << endl;
    }
    else {
        cout << "False. Cannot add card to the pack." << endl;
    }
    cout << endl;

    cout << "Trying to add a card to heroPack." << endl;
    cout << "Should return true, since heroPack is not yet full:" << endl;

    if (heroPack.addCard(innkeeper) == true) {
                cout << "True. Card added successfully." << endl;
    }
    else {
        cout << "False. Cannot add card to the pack." << endl;
    }
    cout << endl;
    cout << "heroPack is now full." << endl << endl;

    // royalPack:

    cout << "royalPack has no cards in it currently." << endl << endl;

    cout << "Increasing packSize to 2 using royalPack.setPackSize()." << endl;
    cout << "This will also serve as a test of setPackSize() method." << endl;
    cout << "Will state true if successful, else false:" << endl;

    royalPack.setPackSize(2);

    if (royalPack.getPackSize() == 2) {
        cout << "True. Pack increase successful." << endl;
    }
    else {
        cout << "False, pack increase unsuccessful." << endl;
    }

    for (int i = 0; i < royalPack.getPackSize(); i++) {
        int cardChance = rand() % CARDPOOL;
        royalPack.setCardAt(i, cardPoolArray[cardChance]);

        while ( (royalPack.getCardAt(i)).getRank() < 3) { // no cards less than 4 stars
            cardChance = rand() % CARDPOOL;                  // in royalPack

            royalPack.setCardAt(i, cardPoolArray[cardChance]);
        }
    }


    cout << endl << "Now to add one more card to royalPack:" << endl;

    if (royalPack.addCard(chosenOne) == true) {
        cout << "True. Card added successfully." << endl;
    }
    else {
        cout << "False. Cannot add card to the pack." << endl;
    }
    cout << endl;

    cout << "royalPack is now full." << endl << endl;


    // duplicatedStandardPack:

    for (int i = 0; i < duplicateStandardPack.getPackSize(); i++) {
        int cardChance = (rand() % CARDPOOL);

        duplicateStandardPack.setCardAt(i, cardPoolArray[cardChance]);

        while ( (duplicateStandardPack.getCardAt(i)).getRank() > 4) {
            cardChance = rand() % CARDPOOL;   // no cards greater than 5 stars in
                                              //duplicateStandardPack
            duplicateStandardPack.setCardAt(i, cardPoolArray[cardChance]);
        }
    }

    cout << "Trying to add a card to duplicateStandardPack." << endl;
    cout << "Should return false, since duplicateStandardPack is full:" << endl;

    if (duplicateStandardPack.addCard(nomad) == true) {
        cout << "True. Card added successfully." << endl;
    }
    else {
        cout << "False. Cannot add card to the pack." << endl;
    }
    cout << endl;


    cout << endl << "***TESTING CARDPACK ACCESSORS***" << endl << endl;

    cout << "Testing getPackName()" << endl << endl;

    cout << heroPack.getPackName() << endl;
    cout << royalPack.getPackName() << endl;

    cout << "Testing getPackSize()" << endl << endl;

    cout << standardPack.getPackSize() << endl;
    cout << royalPack.getPackSize() << endl;

    cout << "Testing getPackCapacity()" << endl << endl;

    cout << duplicateStandardPack.getPackCapacity() << endl;
    cout << royalPack.getPackCapacity() << endl;

    cout << "Testing getCardAt()" << endl << endl;

    (duplicateStandardPack.getCardAt(0)).display();
    (heroPack.getCardAt(6)).display();

    cout << "***TESTING GAMECARD/DERIVEDGAMECARD ACCESSORS***" << endl << endl;

    cout << "From standardPack:" << endl;
    (standardPack.getCardAt(3)).display();

    cout << endl << "From heroPack:" << endl;
    (heroPack.getCardAt(2)).display();

    cout << endl << "From royalPack:" << endl;
    (royalPack.getCardAt(0)).display();

    cout << endl << "From duplicateStandardPack:" << endl;
    (duplicateStandardPack.getCardAt(1)).display();

    cout << "***TESTING CARDPACK MUTATORS***" << endl;

    cout << "standardPack's name before .setPackName(Cheap Pack):" << endl;
    cout << standardPack.getPackName() << endl;
    cout << "standardPack's name after .setPackName(Cheap Pack):" << endl;
    standardPack.setPackName("Cheap Pack");
    cout << standardPack.getPackName() << endl << endl;


    cout << "standardPack's size before .setPackSize(3):" << endl;
    cout << standardPack.getPackSize() << endl;
    cout << "standardPack's size after .setPackSize(3):" << endl;
    standardPack.setPackSize(3);
    cout << standardPack.getPackSize() << endl << endl;


    cout << endl <<"standardPack's first card before .setCardAt(0, nomad):" << endl;
    (standardPack.getCardAt(0)).display();
    cout << "standardPack's first card after .setCardAt(0, nomad):" << endl;
    standardPack.setCardAt(0, nomad);
    (standardPack.getCardAt(0)).display();

    cout << endl << "heroPack's third card before .setCardAt(2, mudcrab):" << endl;
    (heroPack.getCardAt(2)).display();
    cout << "standardPack's first card after .setCardAt(2, mudcrab):" << endl;
    heroPack.setCardAt(2, mudcrab);
    (heroPack.getCardAt(2)).display();

    cout << endl << "royalPack's second card before .setCardAt(1, ghoul):" << endl;
    (royalPack.getCardAt(1)).display();
    cout << "standardPack's second card after .setCardAt(1, ghoul):" << endl;
    royalPack.setCardAt(1, ghoul);
    (royalPack.getCardAt(1)).display();

    cout << endl << "duplicateStandardPack's first card before .setCardAt(0, mine):" << endl;
    (duplicateStandardPack.getCardAt(0)).display();
    cout << "duplicateStandardPack's first card after .setCardAt(0, mine):" << endl;
    standardPack.setCardAt(0, mine);
    (standardPack.getCardAt(0)).display();

    cout << "***TESTING OPERATOR METHODS***" << endl;

    cout << "standardPack & heroPack before copy operator with royalPack:" << endl << endl;
    standardPack.display();
    cout << endl;
    royalPack.display();
    standardPack = royalPack;
    cout << "standardPack after assignment operator with royalPack:" << endl << endl;
    royalPack.display();
    cout << endl;

    cout << "Checking royalPack == duplicateStandardPack." << endl
         << "Should return false:" << endl;

    if (royalPack == duplicateStandardPack) {
        cout << "True." << endl << endl;
    }
    else {
        cout << "False." << endl << endl;
    }

    cout << "Checking standardPack == royalPack." << endl;
    cout << "Should return true (after assignment operator):" << endl;

    if (standardPack == royalPack) {
        cout << "True." << endl << endl;
    }
    else {
        cout << "False." << endl << endl;
    }


    cout << "***TESTING CARDPACK DISPLAY()***" << endl << endl;

    standardPack.display();
    cout << endl;
    heroPack.display();
    cout << endl;
    royalPack.display();
    cout << endl;
    duplicateStandardPack.display();
    cout << endl << endl;


    cout << "***TESTING CARDPACK TOSTRING()***" << endl << endl;
    cout << standardPack.toString() << endl;
    cout << heroPack.toString() << endl;
    cout << royalPack.toString() << endl;
    cout << duplicateStandardPack.toString() << endl;

    return 0;
}
