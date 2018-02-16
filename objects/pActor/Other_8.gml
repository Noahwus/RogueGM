/// @description 

//clear path
path_clear_points(movementPath);

if(endPath = "ready"){
	state = "idle";

	if(actions > 0){
		oCursor.selectedActor = id;
		movement_range(global.map[gridX,gridY], move, actions);
	
		if(canAct){
			switch(attackType){
				case "ranged":
					rangedAttack_range(id);
				break;
			
				case "melee":
					meleeAttack_range(id);
				break;
			}
		}
	}else{
		oGame.currentActor = noone; 
		// oGame checks for noone, and incriments to next turn	
}

}else{
	state = endPath;	
	
}