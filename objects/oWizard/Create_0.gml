/// @description
event_inherited();

name = "Ralph";

class = "Wizard";
race = "Gnome";

//character statistics

level = 1;
profMod  = 2 + floor(level/5);

//base stats (// +3 bonus, +2 bonus, +1 bonus//)
strMod = 0;		//lift / hit
dexMod = 1;		//
conMod = 2;		// tough / poison / hp
intMod = 3;		//
wisMod = 0;		// resist mind control

//health Variables
maxHitPoints = 4 + conMod + ((level - 1) * (3 + conMod));
hitPoints = maxHitPoints;

//attack variables
//hitBonus = profMod + strMod;
hitBonus = profMod + intMod;
attackType = "ranged";
attackRange = 15*GRID_SIZE;

//damage variables

//defense

//movement and action
move = 5;			//how far actor can move peraction
actions = 2;		//number of actions actor can use

//initiative varibles
initiative = dexMod;//
initRoll = 0;		//