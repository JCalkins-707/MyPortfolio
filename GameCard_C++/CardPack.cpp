// Julia Calkins
// CS 112 - Project 6
// Last modified: 14-Nov-2024

#include <iostream>
#include <string>
#include "CardPack.h"

using namespace std;

// Constructors ------------------------

CardPack::CardPack() {
    packName = DEFAULT_PACK_NAME;
    packSize = DEFAULT_PACK_SIZE;
    packCapacity = DEFAULT_PACK_CAPACITY;

    thePack = new GameCard[DEFAULT_PACK_SIZE];
}

CardPack::CardPack(string name, int size, int capacity) {
        if (size < 0) {
            size = 0;
        }
        if (capacity < 0) {
            capacity = 0;
        }
        if (size > capacity) {
            size = capacity;
        }

        packName = name;
        packSize = size;
        packCapacity = capacity;

        thePack = new GameCard[size];
}

CardPack::CardPack(const CardPack& originalPack) {
    packName = originalPack.getPackName();
    packSize = originalPack.getPackSize();
    packCapacity = originalPack.getPackCapacity();

    thePack = new GameCard[packSize];

    for (int i = 0; i < packSize; i++) {
        thePack[i] = originalPack.getCardAt(i);
    }
}

// Destructor -------------------------------

CardPack::~CardPack() {
    delete [] thePack;
}

// Accessors --------------------------------
string CardPack::getPackName() const {
    return packName;
}

int CardPack::getPackSize() const {
    return packSize;
}

int CardPack::getPackCapacity() const {
    return packCapacity;
}

GameCard CardPack::getCardAt(int index) const {
    return thePack[index];
}

// Mutators ---------------------------------
void CardPack::setPackName(string newName) {
    packName = newName;
}

void CardPack::setPackSize(int newSize) {
    if ((newSize < 0) || (newSize > packCapacity)) {
        return;
    }

    int tempSize = packSize;

    GameCard *tempArray = new GameCard[newSize];

    for (int i = 0; i < newSize; i++) {
        if (i < tempSize) {
            tempArray[i] = thePack[i];
        }
    }

    delete [] thePack;
    thePack = tempArray;
    packSize = newSize;

}

void CardPack::setCardAt(int index, GameCard newCard) {
    thePack[index] = newCard;
}

// Operator Methods -------------------------

CardPack CardPack::operator =(const CardPack& rhs) {
    int rhsSize = rhs.getPackSize();
    int lhsSize = this->getPackSize();

    this->packCapacity = rhs.getPackCapacity();

    if (lhsSize != rhsSize) {
        this->setPackSize(rhsSize);
    }

    for (int i = 0; i < lhsSize; i++) {
        thePack[i] = rhs.getCardAt(i);
    }

    return *this;
}

bool CardPack::operator ==(const CardPack& rhs) {
    int rhsSize = rhs.getPackSize();
    int lhsSize = this->getPackSize();

    int rhsCapacity = rhs.getPackCapacity();
    int lhsCapacity = this->getPackCapacity();

    bool equality = false;

    if (lhsSize != rhsSize) {
        return equality;
    }

    for (int i = 0; i < lhsSize; i++) {
        if (thePack[i] == rhs.getCardAt(i)) {
            equality = true;
        }
        else {
            equality = false;
            return equality;
        }
    }

    return equality;

}

// Other Methods ----------------------------

void CardPack::display() const {
    cout << "Within " + this->getPackName() + " is: " << endl;
    cout << "---------------------------------------" << endl;
    for (int i = 0; i < this->getPackSize(); i++) {
        thePack[i].display();
        cout << "---------------------------------------" << endl;
    }
    cout << this->getPackSize() << "/" << this->getPackCapacity()
         << " cards in pack." << endl;
}

string CardPack::toString() const {
    string resultString = "";

    for (int i = 0; i < this->getPackSize(); i++) {
        resultString = resultString + thePack[i].toString();
        if (i < (this->getPackSize() - 1)) {
            resultString = resultString + ", ";
        }
    }

    return resultString;
}

bool CardPack::addCard(GameCard newCard) {
    bool cardAdded = false;

    int currSize = this->getPackSize();
    int newSize = currSize + 1;
    int capacity = this->getPackCapacity();


    if (currSize == capacity) {
        return cardAdded;
    }

    this->setPackSize(newSize);
    thePack[newSize - 1] = newCard;

    cardAdded = true;

    return cardAdded;
}

