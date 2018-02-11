/// @description all necessary information
//status of the attack * miss * hit * crit *
status = "miss";

//damage
damage = 0
damageType = "piercing";

//who is being attacked
target = noone;

//owner is who MADE the attack (can check if kill for bonuses)
owner = noone;

//path information
movementPath = path_add();
path_set_closed(movementPath, false);
path_set_kind(movementPath, 2);


