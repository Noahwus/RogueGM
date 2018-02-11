/// @description 

shake -= 1;

switch(state){
	case "begin path":
		//being moving along path
		path_start(movementPath, moveSpeed, 0, true);
		state = "moving";
	break;
	
	//
	
	case "begin attack": // winding up animations, drawing bow
		attackTimer -= 1;
		if(attackTimer <= 0){
			state = "attack";	
		}
	break;
	
	//
	
	case "attack":
			switch(attackType){
				case "ranged":
					//make attack roll
					attackRoll = irandom_range(1, 20);
					//determine outcome of roll
					if(attackRoll == 20){
						attackStatus = "crit";
					}else{
						if(attackRoll + hitBonus > attackTarget.armorClass){
							attackStatus = "hit";	
						}else{
							attackStatus = "miss";	
						}
					}
					
					
					tempDamage = 0;
					//make Damage roll
					if(attackStatus != "miss"){
						tempDamage = irandom_range(1, damageDice) + damageBonus;
						if(attackStatus == "crit"){
							tempDamage += irandom_range(1, damageDice) + damageBonus;	
						}
					}
					
					//determine the trajectory 
					attackDir = point_direction(x+16, y+16, attackTarget.x +16, attackTarget.y + 16);
					
					beginX = x + 16 + lengthdir_x(30, attackDir);
					beginY = y + 16 + lengthdir_y(30, attackDir);
					
					//create the arrow
					with(instance_create_depth(beginX, beginY, -2, oArrow)){
						target = other.attackTarget;
						status = other.attackStatus;
						damage = other.tempDamage;
						damageType = other.damageType;
						
						//image_angle =
						
						path_add_point(movementPath, other.beginX, other.beginY, 10);
						
						if(status != "miss"){
							path_add_point(movementPath, target.x + 16, target.y +16, 100);	
						}else{
							path_add_point(movementPath, target.x + (irandom_range(20, 60) * choose(-1, 1)), target.y + (irandom_range(30, 50) * choose(-1, 1)), irandom_range(30, 80));
						}
						
						path_start(movementPath, speed, true, true);
					}
					state = "end attack";
					
				break;
				
				case "melee":
				
				break;
			}
	break;
	
	//
	
	case "end attack":
			attackTimer -= 1;
			if(attackTimer <= 0){
				if(actions > 0){
					oCursor.selectedActor = id;
					movement_range(global.map[gridX,gridY], move, actions);
				}else{
					oGame.currentActor = noone;	
				}
				
				state = "idle";
			}
	break;
	
	
		
		
}