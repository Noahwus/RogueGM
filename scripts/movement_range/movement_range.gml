///movement_range(origin node, movement range, remaining actions)
//arg0 = origin node, the node to pathfind from
//arg1 = unit's movement range
//arg2 = unit's remaining actions


//reset all node data
wipe_nodes();

var open, closed;				//ds
var start, current, neighbor;	//inst ids
var tempG, range, costMod;		//variables

//declare relevant variables from arguments

start = argument0;
range = argument1 * argument2;

//create data structures

open = ds_priority_create();
closed = ds_list_create();

//add starting node to the open list

ds_priority_add(open, start, start.G);
		//(adding to, what adding to, adding to priority of)

//while open queue is NOT empty
//repeat the following until ALL nodes have been looked at

while(ds_priority_size(open) > 0){
	
	//remove node with the lowest G score from OPEN
	current = ds_priority_delete_min(open);
	
	//add that node to closed list
	ds_list_add(closed, current); //closed is similar to a "visited list"
	
	//step through all of CURRENT neighbors
	for(ii = 0; ii < ds_list_size(current.neighbors); ii++){
		//store current neighbor in current variable
		neighbor = ds_list_find_value(current.neighbors, ii);
		
		//add neighbor to open list if it qualifies
	//-----------------------------------------------\\
		//qualifies if neighbor is PASSABLE
		//qualifies if nieghbor has no occupant
		//qualifies if the neighbor's projected G score is less than movement range
		//qualifies if the neighbor isn't already on the closed list
		
		if(ds_list_find_index(closed,neighbor) < 0) && (neighbor.passable) && (neighbor.occupant == noone) && (neighbor.cost + current.G <= range){
			//only calculate a new G score for neighbor if it hasn't already been calculated
			if(ds_priority_find_priority(open,neighbor) == 0) || (ds_priority_find_priority(open,neighbor) == undefined){
					costMod = 1;
					
					//give neighbor the appropriate parent
					neighbor.parent = current;
					
					//if node is diagonal, create appropriate costMod
					if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
						costMod = 1.5;
					}
					
					//calc G score of neigbor, with costMod in place
					neighbor.G = current.G + (neighbor.cost * costMod);
					
					//add neighbor to the open list so it can be checked as well
					ds_priority_add(open, neighbor, neighbor.G);
			}
			//ELSE! if neighbor score has ALREADY been calculated for the open list!
			else{
				//figure out if the neigbor's score would be lower if found from the current node
				
				costMod = 1;
				
				if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
						costMod = 1.5;
					}
					
				tempG = current.G + (neighbor.cost * costMod);
				
				//check if G score would be lower if tempG is less than neighbor.G
				if(tempG < neighbor.G){
					neighbor.parent = current;
					neighbor.G = tempG;
					ds_priority_change_priority(open,neighbor,neighbor.G);
				}
			
			}
			
		}
		
		
	}
}



//round down all G scores for movement calculations!

with(oNode){
	G = floor(G);	
}

//destory the Data Structures! NO LEAKS!
ds_priority_destroy(open);



//lets color all those move nodes and then DESTORY the closed list
for(ii = 0; ii < ds_list_size(closed); ii++){
	current = ds_list_find_value(closed, ii);
	current.moveNode = true;
	
	color_move_node(current, argument1, argument2);
}

start.moveNode = false;
//start.color = c_white

//destory
ds_list_destroy(closed);





