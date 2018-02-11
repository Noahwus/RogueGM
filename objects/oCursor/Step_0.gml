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


if(mouse_check_button_pressed(mb_right)){
	if(selectedActor!=noone && hoverNode.moveNode){
		
		current = hoverNode;
		
		//create priority queue
		path = ds_priority_create();
		
		//add current node to queue
		ds_priority_add(path, current, current.G);
		
		//step throught each node parent to parent, until done
		while(current.parent!=noone){
			//add parent node to queue to priority
			ds_priority_add(path, current.parent, current.parent.G);
			
			//set current to current = to current parent
			current = current.parent;
		}
		
		do{
			// lowest priority node(closest to actors, store ID in current)
			current = ds_priority_delete_min(path);
			
			//add current node's sprite coordinates to selectedActor's path
			if(current.type == "rubble"){
				path_add_point(selectedActor.movementPath, current.x, current.y, 35);	
			} else{
				path_add_point(selectedActor.movementPath, current.x, current.y, 85);		
			}
			
		}until(ds_priority_empty(path));
		
		//clean up queue
		ds_priority_destroy(path);
		
		
		//first clear the node of selected actor
		global.map[selectedActor.gridX, selectedActor.gridY].occupant = noone;
		
		//update selectedActor's appropirate grid coords
		selectedActor.gridX = gridX;
		selectedActor.gridY = gridY;
		
		//update selected Actor's future node
		hoverNode.occupant = selectedActor;
		
		//send selectedActor on its way
		selectedActor.state = "begin path";
		
		//reduce selectedActor's actions and wipe nodes
		if(hoverNode.G > selectedActor.move){
			selectedActor.actions -= 2;
			wipe_nodes();
		}else{
			selectedActor.actions -= 1;
			wipe_nodes();
		}
		
		selectedActor = noone;
		
		
	}
	
	if(selectedActor != noone) && (hoverNode.attackNode){
			
			selectedActor.canAct = false;
			selectedActor.actions -= 1;
			selectedActor.attackTarget = hoverNode.occupant;
			selectedActor.state = "begin attack";
			selectedActor.attackTimer = 30;
			
			selectedActor = noone;
			wipe_nodes();
			
	}
	

	
}