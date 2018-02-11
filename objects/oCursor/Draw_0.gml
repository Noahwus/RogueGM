/// @description Insert description here
// You can write your code in this editor

if(hoverNode != noone){
	//layer_sprite_speed(sSelect,1);
	draw_sprite(sSelected, 1, gridX * GRID_SIZE, gridY * GRID_SIZE);	
}

draw_self();

if(hoverNode != noone){
		tempText = string(gridX) +  " / " + string(gridY) + " / ";
		if(hoverNode.occupant != noone){
			tempText += hoverNode.occupant.name;	
		}else{
			tempText += "noone";	
		}
		
		draw_set_color(c_black);
		draw_rectangle(0,0,string_width(tempText), string_height(tempText), false);
		draw_set_color(c_white);
		draw_text(0,0,tempText);
		
		tempText = hoverNode.type;
		if(hoverNode.passable){
			tempText += " passable = true " + "cost = " + string(hoverNode.cost);
		}
		
		draw_set_color(c_black);
		draw_rectangle(0,20,string_width(tempText), 20 + string_height(tempText), false);
		draw_set_color(c_white);
		draw_text(0,20,tempText);
}


if(selectedActor != noone){
	tempText = selectedActor.name + " the " + selectedActor.class + " " + selectedActor.race;
	tempHitPoints = "HP: "+ string(selectedActor.hitPoints)+ "/" + string(selectedActor.maxHitPoints);
	tempHitBonus = "Hit Bonus: "+ string(selectedActor.hitBonus);
	
	draw_set_color(c_black);
	draw_rectangle(0,room_height, string_width(tempHitBonus), room_height-string_height(tempHitBonus),false);
	draw_rectangle(0,room_height - 16, string_width(tempHitPoints), (room_height - 16) - string_height(tempHitPoints),false);
	draw_rectangle(0,room_height - 32 , string_width(tempText), (room_height - 32) - string_height(tempText),false);
	
	draw_set_color(c_white)
	draw_text(0, room_height - string_height(tempHitBonus), tempHitBonus);
	draw_text(0, (room_height - 16) - string_height(tempHitPoints), tempHitPoints);
	draw_text(0, (room_height - 32) - string_height(tempText), tempText);
}