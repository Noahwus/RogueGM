//arg0 = actor we are creating the path for
//arg1 = destination node of the path to end up at
//


selectedActor = argument0;
current = argument1;



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