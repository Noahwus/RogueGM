/// @description
event_inherited();

name = "Rizoh";

class = "Cleric";
race = "Human";

//character statistics
level = 1;
profMod  = 2 + floor(level/5);


//base stats (// +3 bonus, +2 bonus, +1 bonus//)
strMod = 2;		//lift / hit
dexMod = 0;		//
conMod = 1;		// tough / poison / hp
intMod = 0;		//
wisMod = 3;		// resist mind control


//health Variables
maxHitPoints = 8 + conMod + ((level - 1) * (5 + conMod));
hitPoints = maxHitPoints;

//attack variables
hitBonus = profMod + strMod;

//damage variables
damageDice = 6;
damageBonus = strMod;
damageType = "blunt";

//defense variables
armorClass = 16;

//movement and action variables
move = 6;				//how far actor can move peraction
actions = 2;			//number of actions actor can use

//initiative variables
initiative = dexMod;	//
initRoll = 0;			//