/// @description
event_inherited();

name = "Sandy";

class = "Rogue";
race = "Human";

//character statistics

level = 1;
profMod  = 2 + floor(level/5);

//base stats (// +3 bonus, +2 bonus, +1 bonus//)
strMod = 0;		//lift / hit
dexMod = 3;		//
conMod = 2;		// tough / poison / hp
intMod = 1;		//
wisMod = 0;		// resist mind control

//health variables
maxHitPoints = 6 + conMod + ((level - 1) * (4 + conMod));
hitPoints = maxHitPoints;

//attack variables (range may change in the future (good enoguh TM))
hitBonus = profMod + dexMod;
attackType = "ranged";
attackRange = 15*GRID_SIZE;

//movement and action variables
move = 7;			//how far actor can move peraction
actions = 2;		//number of actions actor can use

//initiative variables
initiative = dexMod;//
initRoll = 0;		//