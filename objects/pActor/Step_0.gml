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
		actionTimer -= 1;
		if(actionTimer <= 0){
			state = "attack";	
		}
	break;
	
	//
	
	case "attack":
			//rolling for damage, other is in Cursor?
			//make attack roll
			attackRoll = irandom_range(1, 20);
			
			applySneakAttack = false;
			
			//58:05
			if(sneakAttack==true){
				tempNode = global.map[attackTarget.gridX, attackTarget.gridY];
				show_message("Sneak!");
				
				for(ii = 0; ii < ds_list_size(tempNode.neighbors); ii++){
					current = ds_list_find_value(tempNode.neighbors, ii);
					
					if(current.occupant != noone){
						if(current.occupant.army != attackTarget.army){
							applySneakAttack = true;
						}
					}
				}
			}
			
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
				if(applySneakAttack){
					tempDamage += irandom_range(1, sneakAttackDamage);	
				}
				if(attackStatus == "crit"){
					tempDamage += irandom_range(1, damageDice) + damageBonus;	
					if(applySneakAttack){
						tempDamage += irandom_range(1, sneakAttackDamage);	
					}
				}
			}
			
				//determine attack type
				switch(attackType){
					case "ranged":
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
					
						actionTimer = 10;
					
					break;
				
				
					//
				
					case "melee":
						if(attackStatus != "miss"){
							for(i=0; i<6; i+=1){
								with(instance_create_depth(attackTarget.x +16, attackTarget.y + 16, -2, oBiff)){
									direction = irandom(360);
									scale = choose(1,3);
									speed = 1;//choose(1,2);
								
									image_speed = choose(1,.5);
									if(other.attackStatus == "crit"){
										color = c_yellow;	
									}
								}
							}
						
							if(attackStatus == "crit"){
								attackTarget.shake = 8;
								attackTarget.shakeMag = 8;
							}else{
								attackTarget.shake = 4;
								attackTarget.shakeMag = 4;
							}
						
							//deal Damage
							attackTarget.hitPoints -= tempDamage;
						
						
							with(instance_create_depth(attackTarget.x +28, attackTarget.y+2, -2, oDamageText)){
								text = "-" + string(other.tempDamage);
								ground = y;
								if(other.attackStatus == "crit"){
									font = fCrit;	
								}
							}
						
						}else{
							with(instance_create_depth(attackTarget.x +28, attackTarget.y+2, -2, oDamageText)){
								text = "miss";
								ground = y;
							}
						}
					
						state = "end attack";
					
						attackTimer = 10;
					
					
					break;
				
				}
	break;
	
	//
	
	case "end attack":
			actionTimer -= 1;
			if(actionTimer <= 0){
				if(actions > 0){
					oCursor.selectedActor = id;
					movement_range(global.map[gridX,gridY], move, actions);
				}else{
					oGame.currentActor = noone;	
				}
				
				state = "idle";
			}
	break;
	
	//
	
	case "begin action":
	
	break;
	
	//
	
	case "perform action":
	
		perform_action(id, readiedAction);
		wipe_nodes();
		//wipe_buttons();
	
	break;
	
	//
	
	
	case "end action":
		actionTimer -= 1;
		if(actionTimer <= 0){
			state = "idle";
			if(actions > 0){
				movement_range(global.map[gridX,gridY], move, actions);	
			}else{
				state = "idle";
				oCursor.selectedActor = noone;
				oGame.currentActor = noone;
			}
		}
	break;
	
	
	
	case "end turn":
		actionTimer -= 1;
		if(actionTimer <= 0){
			oCursor.selectedActor = noone;
			oGame.currentActor = noone;
			state = "idle";
		}
			
	break;
		
		
}