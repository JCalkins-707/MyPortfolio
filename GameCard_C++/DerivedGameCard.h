// Julia Calkins
// CS 112 - Project 6
// Last modified: 14-Dec-2024

#ifndef DERIVEDGAMECARD_H
#define DERIVEDGAMECARD_H

#include <iostream>
#include <iomanip>
#include <string>
#include "GameCard.h"

using namespace std;

// Named constants and enums ------------------------

const CardType DEFAULT_SUBTYPE = None;

const int DEFAULT_MOVEMENT = 2;

const int DEFAULT_RANGE = 2;

enum Foil {Plain, Tin, Bronze, Silver, Gold, Iridescent};

const int NUM_FOILS = 6;

const string FOILLIST[NUM_FOILS] = {"", "Tin", "Bronze", "Silver",
    "Gold", "Iridescent"};

const Foil DEFAULT_FOIL = Plain;

// class definition ---------------------------------------

class DerivedGameCard : public GameCard {
public:

// Constructors ------------

    DerivedGameCard();

    DerivedGameCard(string name, int hp, int atk, int mit, int cd,
        Kingdom kingdom, CardType maintype, CardType subtype, StarRank rank,
        Foil foiltype, int movement, int range);

    // constructors that expect an existing GameCard object

    DerivedGameCard(const GameCard&);
    DerivedGameCard(const GameCard&, CardType, Foil, int, int);

// Accessors ---------------

    CardType getSubType() const;

    Foil getFoil() const;

    int getMovement() const;

    int getRange() const;

// Mutators ----------------

    void setSubType(CardType);

    void setFoil(Foil);

    void setMovement(int);

    void setRange(int);

// Operator Methods --------

    bool operator ==(const DerivedGameCard&);

// Other Methods -----------

    void display() const;

    string toString() const;


private:

    CardType cardSubType; // second creature type of
                            // the card, or None if none

    Foil cardFoil; // foil grade of the card, Plain if none

    int cardMovement; // how many tiles the card can move
                      // on the board in one turn

    int cardRange; // the range of tiles that the card
                   // can reach to attack other cards
                   // with an unmodified base attack

};


#endif /* DERIVEDGAMECARD_H */
