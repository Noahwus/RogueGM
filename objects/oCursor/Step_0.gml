/// @description Insert description here
// You can write your code in this editor
//GRID_SIZE = 32;

x = mouse_x;
y = mouse_y;

gridX = floor(x/GRID_SIZE);
gridY = floor(y/GRID_SIZE);

if(gridX < 0 || gridY < 0 || gridX >= room_width / GRID_SIZE || gridY >= room_height/GRID_SIZE){
	hoverNode = noone;
}
else{
	hoverNode = global.map[gridX,gridY];	
}

//check if hovering a button
if(instance_place(x,y,oButton)){
	hoverButton = instance_place(x,y,oButton);	
	hoverNode = noone;
}else{
	hoverButton = noone;
}

//check mouse left
if(mouse_check_button_pressed(mb_left)){
	if(selectedActor!=noone && hoverButton !=noone){
		perform_buttons(selectedActor, hoverButton);	
	}
	
	if(instance_place(x,y,oConfirmButton)){
		selectedActor.state = "perform action";
		with(oConfirmButton){
			instance_destroy();	
		}
	}
}


//check right
if(mouse_check_button_pressed(mb_right)){
	if(selectedActor!=noone && hoverNode.moveNode){
		
		current = hoverNode;
		
		create_path(selectedActor, current);
		
		//first clear the node of selected actor
		global.map[selectedActor.gridX, selectedActor.gridY].occupant = noone;
		
		//update selectedActor's appropirate grid coords
		selectedActor.gridX = gridX;
		selectedActor.gridY = gridY;
		
		//update selected Actor's future node
		hoverNode.occupant = selectedActor;
		
		//send selectedActor on its way
		selectedActor.state = "begin path";
		//what to do when it gets there
		selectedActor.endPath = "ready";
		
		//reduce selectedActor's actions and wipe nodes
		if(hoverNode.G > selectedActor.move){
			selectedActor.actions -= 2;
			wipe_nodes();
			wipe_buttons();
		}else{
			selectedActor.actions -= 1;
			wipe_nodes();
			wipe_buttons();
		}
		
		selectedActor = noone;
		
		
	}
	
	if(selectedActor != noone && hoverNode.attackNode){
			switch(selectedActor.attackType){
				case "ranged":
					selectedActor.canAct = false;
					selectedActor.actions -= 1;
					selectedActor.attackTarget = hoverNode.occupant;
					selectedActor.state = "begin attack";
					//set this timer for higher number for any animations
					selectedActor.actionTimer = 5;
			
					selectedActor = noone;
					wipe_nodes();
					wipe_buttons();
				break;
				
				case "melee":
					selectedActor.canAct = false;
					selectedActor.attackTarget = hoverNode.occupant;
									
					tempX = abs(hoverNode.gridX - selectedActor.gridX);
					tempY = abs(hoverNode.gridY - selectedActor.gridY);
					
					if(tempX <= 1 && tempY <= 1){
						selectedActor.actions -= 1;
						selectedActor.attackTarget = hoverNode.occupant;
						selectedActor.state = "begin attack";
						selectedActor.attackTimer = 10;
						
						selectedActor =  noone;
						wipe_nodes();
						wipe_buttons();
					}else{
						
						tempG = 100; //look at all the surrounding nodes, find the closest
						current = noone;
						
						for(ii = 0; ii <ds_list_size(hoverNode.neighbors); ii++){
							tempNode = ds_list_find_value(hoverNode.neighbors, ii);
							
							if(tempNode.occupant == noone && tempNode.G > 0 && tempNode.G < tempG){
								tempG = tempNode.G;
								current = tempNode;
							}
						}
						
						targetNode = current;
						
						create_path(selectedActor, current);
						
						//update the actor's information
						//first clear the node of selected actor
						global.map[selectedActor.gridX, selectedActor.gridY].occupant = noone;
		
						//update selectedActor's appropirate grid coords
						selectedActor.gridX = targetNode.gridX;
						selectedActor.gridY = targetNode.gridY;
		
						//update selected Actor's future node
						targetNode.occupant = selectedActor;
		
						//send selectedActor on its way
						selectedActor.state = "begin path";
						//what to do when it gets there
						selectedActor.endPath = "begin attack";
						selectedActor.attackTarget = hoverNode.occupant;
						selectedActor.actions -= 2;
						selectedActor.canAct = false;
						
						//wipe
						selectedActor = noone;
						wipe_nodes();
						wipe_buttons();

					}
					
					
				break;
			}
			
	}
	

	
}