/// @description 

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

/*
if(selectedActor != noone){
	tempText = selectedActor.name + " the " + selectedActor.class + " " + selectedActor.race;
	tempHitPoints = "HP: "+ string(selectedActor.hitPoints)+ "/" + string(selectedActor.maxHitPoints);
	tempHitBonus = "Hit Bonus: "+ string(selectedActor.hitBonus);
	
	draw_set_color(c_black);
	draw_rectangle(0,0, string_width(tempHitBonus), string_height(tempHitBonus),false);
	draw_rectangle(0,16, string_width(tempHitPoints),  16 + string_height(tempHitPoints),false);
	draw_rectangle(0, 32 , string_width(tempText), 32+  string_height(tempText),false);
	
	draw_set_color(c_white)
	draw_text(0, 0, tempHitBonus);
	draw_text(0, 16, tempHitPoints);
	draw_text(0, 32, tempText);
}