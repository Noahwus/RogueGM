/// @description Parent of all Actors

state = "idle";

army = BLUETEAM;

gridX = 0;
gridY = 0;

name = "Error";

class = "Peasant";
race = "Human";

//character statistics

level = 1;
profMod  = 2 + floor(level/5);

strMod = 0;		//lift / hit
dexMod = 0;		//
conMod = 0;		// tough / poison / hp
intMod = 0;		//
wisMod = 0;		// resist mind control

//health variables
maxHitPoints = 4 + conMod + ((level - 1) * (3 + conMod));
hitPoints = maxHitPoints;

//attack variables
hitBonus = profMod + strMod;
attackType = "melee";
attackTarget = noone;

//Timer to perform actions
actionTimer = 0;

//damage variables
damageDice = 4;
damageBonus = strMod;
damageType = "piercing";

//defense Variables
armorClass = 10 + dexMod;


//move and action variables
move = 6;			//how far actor can move peraction
actions = 2;//number of actions actor can use
canAct = false;
					
//special action variables
charge = false;
//chargeAttackDamage = 0;
sneakAttack = false;
sneakAttackDamage = 0;

//spell and action variables
readiedAction =  "error";


//initiative bariles			
initiative = dexMod;//
initRoll = 0;		//

//variables related to buttons
defaultActions = ds_list_create();
ds_list_add(defaultActions, "end turn");



//variables related to pathing================

movementPath = path_add();
path_set_kind(movementPath,2); //1 is rounded path, 2 is straight line
path_set_closed(movementPath,false);

endPath = "idle";

moveSpeed = 8;


//variables related to effects ========================================
shake = 0;
shakeMag = 0;





