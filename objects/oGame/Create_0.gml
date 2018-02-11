/// @description Insert description here
state = "initialize";

#macro REDTEAM 10
#macro BLUETEAM 20
#macro GRID_SIZE 32

draw_set_font(fDefault);


//TURN CONTROL================
randomize();

turnOrder = ds_list_create();
turnCounter = -1;
turnMax = 0;
currentActor = noone;
roundCounter = 0;



//=============================
//define


mapWidth = room_width / GRID_SIZE;
mapHeight = room_height / GRID_SIZE;


//create map array
global.map[mapWidth,mapHeight] = 0;
 

//create nodes
for(xx = 0; xx < mapWidth; xx++){
	for(yy = 0; yy < mapHeight; yy++){
		global.map[xx,yy] = instance_create_depth(xx*GRID_SIZE , yy * GRID_SIZE, 100, oNode);
		global.map[xx,yy].gridX = xx;
		global.map[xx,yy].gridY = yy;
	}
}

//populate neighbor list
for(xx=0; xx<mapWidth; xx++){
	for(yy=0;yy<mapHeight;yy++){
		
		node = global.map[xx,yy];
		
		//add left neightbor
		if(xx>0){
			ds_list_add(node.neighbors,global.map[xx-1,yy]);	
		}
		
		//add right neighbor
		if(xx<mapWidth-1){
			ds_list_add(node.neighbors,global.map[xx+1,yy]);	
		}
		
		//add top neighbor
		if(yy>0){
			ds_list_add(node.neighbors,global.map[xx,yy-1]);	
		}
		
		//add bottom neighbor
		if(yy < mapHeight-1){
			ds_list_add(node.neighbors,global.map[xx,yy+1]);	
		}
		
		//add top left neighbor
		if(xx>0 && yy > 0){
			ds_list_add(node.neighbors,global.map[xx-1,yy-1]);	
		}
		
		//add top right neighbor
		if(xx < mapWidth-1 && yy > 0){
			ds_list_add(node.neighbors,global.map[xx+1,yy-1]);	
		}
		
		//add bottom left neighbor
		if(xx > 0 && yy < mapHeight - 1){
			ds_list_add(node.neighbors,global.map[xx-1,yy+1]);	
		}
		
		//add bottom right neighbor
		if(xx < mapWidth-1 && yy < mapHeight - 1){
			ds_list_add(node.neighbors,global.map[xx+1,yy+1]);	
		}
		
	}
}

instance_create_depth(x,y,1,oCursor);
	

//show_message("worked");

