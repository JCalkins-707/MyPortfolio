// Julia Calkins
// CS 112 - Project 6
// Last modified: 14-Dec-2024

#ifndef CARDPACK_H
#define CARDPACK_H

#include <iostream>
#include <string>
#include <vector>
#include "DerivedGameCard.h"

using namespace std;

// Enums and constants ------------------------------

const string DEFAULT_PACK_NAME = "Standard Pack";
const int DEFAULT_PACK_SIZE = 5;
const int DEFAULT_PACK_CAPACITY = 5;


// class definition ---------------------------------

class CardPack {
public:

    // Constructors --------------

    CardPack();

    CardPack(string, int, int);

    CardPack(const CardPack&);

    // Destructor ----------------

    ~CardPack();

    // Accessors -----------------

    string getPackName() const; // returns packName

    int getPackSize() const; // returns packSize

    int getPackCapacity() const; // returns packCapacity

    GameCard getCardAt(int) const; // returns the card at the
                                   // given index in a pack

    // Mutators ------------------

    void setPackName(string); // sets packName

    void setPackSize(int); // sets packSize

    void setPackCapacity(int); // sets packCapacity

    void setCardAt(int, GameCard); // sets the card in the
                                          // pack at the given index to
                                          // the given GameCard

    // Operator Methods ----------

    CardPack operator =(const CardPack&);

    bool operator ==(const CardPack&);


    // Other Methods -------------

    void display() const;

    string toString() const;

    bool addCard(GameCard);

private:

    string packName; // name for CardPacks
    int packSize; // num cards in a pack
    int packCapacity; // num cards allowed in a pack
    GameCard* thePack; // pointer for an array of card objects

};





#endif /* CARDPACK_H */
