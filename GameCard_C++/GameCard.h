// Julia Calkins
// CS 112 - Project 6
// Last modified: 14-Dec-2024

#ifndef GAMECARD_H
#define GAMECARD_H

#include <iostream>
#include <string>

using namespace std;

// Enumerated types & constants--------------------
enum Kingdom {Outcast, Greymire, Issira, OlenGara,
    Thiamoth, Rivenay, Glistenar, theBeyond,
    Kawrille, Zolith};

const int NUM_KINGDOMS = 10;

const string KINGDOMLIST[NUM_KINGDOMS] = {"Outcast",
    "Greymire", "Issira", "Olen'Gara", "Thiamoth", "Rivenay",
    "Glistenar", "The Beyond", "Kawrille", "Zolith"};

// None is only used for if there is no subtype, every card should
//      have a defined cardType (not None)
enum CardType {None, Human, Elf, Dwarf, Orc, Goblin, Draconic,
    Botanic, Beast, Ethereal, Astral, Undead, Monstrosity, Construct,
    Celestial, Abyssal};

const int NUM_CARDTYPES = 16;

const string TYPELIST[NUM_CARDTYPES] = {"", "Human", "Elf", "Dwarf",
    "Orc", "Goblin", "Draconic", "Botanic", "Beast", "Ethereal",
    "Astral", "Undead", "Monstrosity","Construct", "Celestial",
    "Abyssal"};

enum StarRank {One, Two, Three, Four, Five, Six, Seven};

const int NUM_RANKS = 7;

const string RANKLIST[NUM_RANKS] = {"One", "Two", "Three", "Four",
    "Five", "Six", "Seven"};

const string DEFAULT_NAME = "Peasant";
const int DEFAULT_HP = 1;
const int DEFAULT_ATK = 1;
const int DEFAULT_MIT = 0;
const int DEFAULT_CD = 0;
const Kingdom DEFAULT_KINGDOM = Outcast;
const CardType DEFAULT_TYPE = Human;
const StarRank DEFAULT_RANK = One;

// class GameCard definition---------------------
class GameCard {
public:

// Constructors-----------
    GameCard();

    GameCard(string name, int hp, int atk, int mit, int cd);

    GameCard(string name, int hp, int atk, int mit, int cd,
        Kingdom kingdom, CardType type, StarRank rank);

// Big 3 Methods ---------
/*
    // copy constructor
    GameCard(const GameCard&);

    // destructor
    ~GameCard();

    // assignment-equals operator
    GameCard& operator =(GameCard&);
*/

// Accessors -------------

    string getName() const;
    int getHP() const;
    int getATK() const;
    int getMIT() const;
    int getCD() const;
    Kingdom getKingdom() const;
    CardType getType() const;
    StarRank getRank() const;

// Mutators --------------

    void setName(string);
    void setHP(int);
    void setATK(int);
    void setMIT(int);
    void setCD(int);
    void setKingdom(Kingdom);
    void setType(CardType);
    void setRank(StarRank);

// Operator methods --------

    virtual bool operator ==(const GameCard&);


// Other Methods ---------

    virtual void display() const;

    string toString() const;

//----------------------------------
private:
    string cardName; // Name of the card.

    int cardHP; // card hitpoints (health).

    int cardATK; // card attack value.

    int cardMIT; // card damage mitigation value.

    int cardCD; // card countdown: how many turns after
                // drawing until it can be played;
                // card draws occur between turns.

    Kingdom cardKingdom; // kingdom of card's alliegance.

    CardType cardType; // type of creature the card is.

    StarRank cardRank; // how many stars the card is
                       // 1 star is the most common,
                       // and 7 stars is super rare
                       // rarer cards have better stats
};






#endif /* GAMECARD_H */
