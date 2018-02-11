//arg0 = actor performing the range check
//arg1 = 

actor = argument0;

with(pActor){
	tempActor = other.actor;
	
	if(army != tempActor.army){
		//check range
		if(point_distance(x+16, y + 16, tempActor.x+16, tempActor.y + 16) <= tempActor.attackRange){
				if(!collision_line(x+16,y+16,tempActor.x+16,tempActor.y+16, oWall, false, false)){
					global.map[gridX,gridY].attackNode = true;
					global.map[gridX,gridY].color = c_red;
				}
		}
	}
}