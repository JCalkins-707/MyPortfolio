// Julia Calkins
// CS 112 - Project 6
// Last modified: 14-Dec-2024

#include <iostream>
#include <string>
#include <iomanip>
#include "GameCard.h"

using namespace std;

// Constructors ----------------------

GameCard::GameCard() {
    cardName = DEFAULT_NAME;
    cardHP = DEFAULT_HP;
    cardATK = DEFAULT_ATK;
    cardMIT = DEFAULT_MIT;
    cardCD = DEFAULT_CD;
    cardKingdom = DEFAULT_KINGDOM;
    cardType = DEFAULT_TYPE;
    cardRank = DEFAULT_RANK;
}

GameCard::GameCard(string name, int hpVal, int atkVal,
    int mitVal, int cdVal) {
    cardName = name;
    cardHP = hpVal;
    cardATK = atkVal;
    cardMIT = mitVal;
    cardCD = cdVal;
    cardKingdom = DEFAULT_KINGDOM;
    cardType = DEFAULT_TYPE;
    cardRank = DEFAULT_RANK;
}

GameCard::GameCard(string name, int hpVal, int atkVal,
    int mitVal, int cdVal, Kingdom kingdom, CardType type,
    StarRank rank) {
    cardName = name;
    cardHP = hpVal;
    cardATK = atkVal;
    cardMIT = mitVal;
    cardCD = cdVal;
    cardKingdom = kingdom;
    cardType = type;
    cardRank = rank;
}


// Accessors -------------------------

string GameCard::getName() const {
    return cardName;
}

int GameCard::getHP() const {
    return cardHP;
}

int GameCard::getATK() const {
    return cardATK;
}

int GameCard::getMIT() const {
    return cardMIT;
}

int GameCard::getCD() const {
    return cardCD;
}

Kingdom GameCard::getKingdom() const {
    return cardKingdom;
}

CardType GameCard::getType() const {
    return cardType;
}

StarRank GameCard::getRank() const {
    return cardRank;
}

// Mutators ----------------------------

void GameCard::setName(string newName) {
    cardName = newName;
}

void GameCard::setHP(int newHP) {
    cardHP = newHP;
}
void GameCard::setATK(int newATK) {
    cardATK = newATK;
}

void GameCard::setMIT(int newMIT) {
    cardMIT = newMIT;
}

void GameCard::setCD(int newCD) {
    cardCD = newCD;
}

void GameCard::setKingdom(Kingdom newKingdom) {
    cardKingdom = newKingdom;
}

void GameCard::setType(CardType newType) {
    cardType = newType;
}

void GameCard::setRank(StarRank newRank) {
    cardRank = newRank;
}

// Operator methods

bool GameCard::operator ==(const GameCard& rhs) {
    bool isSameName = (this->getName() == rhs.getName());

    bool isSameHP = (this->getHP() == rhs.getHP());
    bool isSameATK = (this->getATK() == rhs.getATK());
    bool isSameMIT = (this->getMIT() == rhs.getMIT());
    bool isSameCD = (this->getCD() == rhs.getCD());

    bool isSameKingdom = (this->getKingdom() == rhs.getKingdom());

    bool isSameType = (this->getType() == rhs.getType());

    bool isSameRank = (this->getRank() == rhs.getRank());

    return (isSameName && isSameHP && isSameATK && isSameMIT && isSameCD
            && isSameKingdom && isSameType && isSameRank);

}

// Other Methods

void GameCard::display() const {
    cout << "Name: " << setw(10) << left << this->getName()
         << " | Countdown: " << setw(12) << left << this->getCD() << endl;

    cout << "Type: " << setw(10) << left << TYPELIST[this->getType()]
         << " | Kingdom: " << KINGDOMLIST[this->getKingdom()] << endl;

    cout << "Hit Points: " << setw(4) << left << this->getHP()
         << " | Attack: " << setw(12) << left << this->getATK() << endl;

    cout << "Mitigation: " << setw(4) << left << this->getMIT()
         << " | Rank: ";
    if (this->getRank() == One) {
        cout << setw(12) << left << RANKLIST[this->getRank()]
             + " Star" << endl;
    }
    else {
        cout << setw(12) << left << RANKLIST[this->getRank()]
             + " Stars" << endl;
    }

}

string GameCard::toString() const {
    string resultString = "";

    resultString = "\"" + this->getName() + "\", " +
                   to_string(this->getHP()) + ", " +
                   to_string(this->getATK()) + ", " +
                   to_string(this->getMIT()) + ", " +
                   to_string(this->getCD()) + ", " + "\""
                   + KINGDOMLIST[this->getKingdom()] + "\""
                   + ", " + "\"" +
                   TYPELIST[this->getType()] + "\""
                   + ", " + "\"" +
                   RANKLIST[this->getRank()] + "\"";

    return resultString;
}
