// Julia Calkins
// CS 112 - Project 6
// Last modified: 14-Dec-2024

#include <iostream>
#include <iomanip>
#include <string>
#include "DerivedGameCard.h"

using namespace std;

// Constructors-----------------------------------------------

DerivedGameCard::DerivedGameCard(): GameCard() {
    cardFoil = DEFAULT_FOIL;
    cardSubType = DEFAULT_SUBTYPE;
    cardMovement = DEFAULT_MOVEMENT;
    cardRange = DEFAULT_RANGE;
}

DerivedGameCard::DerivedGameCard(string name, int hpVal, int atkVal,
        int mitVal, int cdVal, Kingdom kingdom, CardType maintype,
        CardType subtype, StarRank rank, Foil foil, int movementVal,
        int rangeVal):
    GameCard(name, hpVal, atkVal, mitVal, cdVal, kingdom, maintype, rank) {

        cardSubType = subtype;
        cardFoil = foil;
        cardMovement = movementVal;
        cardRange = rangeVal;
}

DerivedGameCard::DerivedGameCard(const GameCard& gcard) :
    GameCard(gcard) {
        cardFoil = DEFAULT_FOIL;
        cardSubType = DEFAULT_SUBTYPE;
        cardMovement = DEFAULT_MOVEMENT;
        cardRange = DEFAULT_RANGE;
}

DerivedGameCard::DerivedGameCard(const GameCard& gcard, CardType newSubType,
         Foil newFoil, int newMovement, int newRange) :
    GameCard(gcard) {
        cardSubType = newSubType;
        cardFoil = newFoil;
        cardMovement = newMovement;
        cardRange = newRange;
}


// Accessors--------------------------------------------------

CardType DerivedGameCard::getSubType() const {
    return cardSubType;
}

Foil DerivedGameCard::getFoil() const {
    return cardFoil;
}

int DerivedGameCard::getMovement() const {
    return cardMovement;
}

int DerivedGameCard::getRange() const {
    return cardRange;
}

// Mutators ----------------

void DerivedGameCard::setSubType(CardType newSubType) {
    cardSubType = newSubType;
}

void DerivedGameCard::setFoil(Foil newFoil) {
    cardFoil = newFoil;
}

void DerivedGameCard::setMovement(int newMovement) {
    cardMovement = newMovement;
}

void DerivedGameCard::setRange(int newRange) {
    cardRange = newRange;
}

// Operator Methods --------

bool DerivedGameCard::operator ==(const DerivedGameCard& rhs) {
    bool isSameName = (this->getName() == rhs.getName());

    bool isSameHP = (this->getHP() == rhs.getHP());
    bool isSameATK = (this->getATK() == rhs.getATK());
    bool isSameMIT = (this->getMIT() == rhs.getMIT());
    bool isSameCD = (this->getCD() == rhs.getCD());

    bool isSameKingdom = (this->getKingdom() == rhs.getKingdom());

    bool isSameType = (this->getType() == rhs.getType());
    bool isSameSubType = (this->getSubType() == rhs.getSubType());

    bool isSameRank = (this->getRank() == rhs.getRank());
    bool isSameFoil = (this->getFoil() == rhs.getFoil());

    bool isSameMovement = (this->getMovement() == rhs.getMovement());
    bool isSameRange = (this->getRange() == rhs.getRange());

    return (isSameName && isSameHP && isSameATK && isSameMIT && isSameCD
            && isSameKingdom && isSameType && isSameSubType && isSameRank
            && isSameFoil && isSameMovement && isSameRange);

}

// Other Methods -----------

void DerivedGameCard::display() const {

    cout << "Name: " << setw(13) << left << this->getName()
         << " | Countdown: " << setw(12) << left << this->getCD() << endl;

    cout << "Type: " << setw(13) << left << TYPELIST[this->getType()]
         << " | Kingdom: " << KINGDOMLIST[this->getKingdom()] << endl;

    cout << "Subtype: " << setw(10) << left << TYPELIST[this->getSubType()]
         << " | Rank: " << RANKLIST[this->getRank()];
    if (this->getRank() == One) {
        cout << " Star" << endl;
    }
    else {
        cout << " Stars" << endl;
    }

    cout << "Movement: " << setw(9) << left << this->getMovement()
         << " | Range: " << this->getRange() << endl;

    cout << "Hit Points: " << setw(7) << left << this->getHP()
         << " | Attack: " << this->getATK() << endl;

    cout << "Mitigation: " << setw(7) << left << this->getMIT()
         << " | Foil: " << FOILLIST[this->getFoil()] << endl;
}

string DerivedGameCard::toString() const {
    string resultString = "";

    resultString = this->GameCard::toString();
    resultString = resultString + ", \"" + TYPELIST[this->getSubType()]
                   + "\", " + "\"" + FOILLIST[this->getFoil()] + "\", "
                   + to_string(this->getMovement()) + ", " +
                   to_string(this->getRange());

    return resultString;
}
