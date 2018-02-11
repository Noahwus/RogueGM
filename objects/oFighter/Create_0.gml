/// @description
event_inherited();

name = "Rizo";

class = "Fighter";
race = "Dwarf";

//character statistics

level = 1;
profMod  = 2 + floor(level/5);


//base stats (// +3 bonus, +2 bonus, +1 bonus//)
strMod = 3;		//lift / hit
dexMod = 0;		//
conMod = 2;		// tough / poison / hp
intMod = 0;		//
wisMod = 1;		// resist mind control

//health Variables
maxHitPoints = 10 + conMod + ((level - 1) * (6 + conMod));
hitPoints = maxHitPoints;

//attack variables
hitBonus = profMod + strMod;

//damage variables
damageDice = 8;
damgeBonus = strMod;
damageType = "slashing";

//defense variables
armorClass = 18; //no dex because heavy armor?


//movement + action varibles
move = 5;			//how far actor can move peraction
actions = 2;		//number of actions actor can use

//initiative variables
initiative = dexMod;//
initRoll = 0;		//