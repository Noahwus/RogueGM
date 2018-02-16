/// @description
switch(state){
	case "initialize":
		// pseudo oNode create event to account for creation order
		with(oNode){
			if(instance_position(x+16,y+16,pTerrain)){
			tempTerrain = instance_position(x+16,y+16, pTerrain);
			switch(tempTerrain.type){
				case "wall":
					type = "wall";
					//sprite_index = sFloor1;  //changed into instance_change
					instance_change(oWall, true); //turns who's calling this code, into this
					passable = false;
			
					break;
		
				case "rubble":
					type = "rubble";
					//sprite_index = sRubble;
					instance_change(oRubble,true); //turns who's calling this code, into this 
					//passable = true;
					cost = 2;
				break;
		
			}

				with(tempTerrain){
					instance_destroy();	
				}
	
			}	
			
			if(instance_position(x+16,y+16,pActor)){
					occupant = instance_position(x+16,y+16,pActor);
					occupant.gridX = gridX;
					occupant.gridY = gridY;
				}
			}
			state = "roll init";
		break;
		
		
		case "roll init":
			tempInit = ds_priority_create();
			
			with(pActor){
				//change later probs
				initRoll = irandom_range(1,20) + initiative;	
				ds_priority_add(other.tempInit, id, initRoll);
				//show_message(string(other.tempInit) + " " + string(id));
			}
			
			while(ds_priority_size(tempInit) > 0){
				ds_list_add(turnOrder, ds_priority_delete_max(tempInit));	
				
			}
			
			turnMax = ds_list_size(turnOrder);
			ds_priority_destroy(tempInit);
			state = "ready";
			
		break;
			
		case "ready":
		
			if(currentActor == noone){
				turnCounter ++;
				if(turnCounter >= turnMax){
					turnCounter = 0;
					roundCounter ++;
				}
			
			//moved from outside closing bracket
			currentActor = ds_list_find_value(turnOrder, turnCounter);	
			currentActor.actions = 2;
			currentActor.canAct = true;
			}
			
			
			//only pass off actions and cursor control if actor is BLUETEAM
			//otherwise set flash to variable to true and set alarm
			if(currentActor.army == BLUETEAM){
				oCursor.selectedActor = currentActor;
				movement_range(global.map[currentActor.gridX, currentActor.gridY], currentActor.move, currentActor.actions);
			
				switch(currentActor.attackType){
					case "ranged":
						rangedAttack_range(currentActor);
					break;
					
					case "melee":
						meleeAttack_range(currentActor);
					break;
				}
			}else{
				//ENEMY TURN
				currentActor.flash = true;
				currentActor.alarm[0] = 1;
			}
			
		break;
		
		
}