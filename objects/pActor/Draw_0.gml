/// @description draw line from player to place of movement or attack
if(oCursor.selectedActor == id){
	if(oCursor.hoverNode!=noone){
		tempNode = oCursor.hoverNode;
		if(tempNode.moveNode){

			current = tempNode;
			
			//step through every node in the chain, parent to parent, until we reach the actor's node
			while(current.parent != noone){
				draw_set_alpha(.25);
				draw_line_width_color(current.x +16, current.y+16, current.parent.x +16, current.parent.y+16, 4, c_lime, c_lime);
				current = current.parent;
			}
		}
		
		if(tempNode.attackNode){
			switch(attackType){
				case "ranged":
					draw_set_alpha(.45);
					draw_line_width_color(x +16, y+16, tempNode.x +16,tempNode.y+16, 4, c_purple,c_purple);
				break;
				
			}
		}
	}
	
	/*/if cursor is hovering over a different node that isn't the actor
	if(oCursor.hoverNode != noone && oCursor.hoverNode != global.map[gridX, gridY]){
		current = oCursor.hoverNode;
	
		//step through every node, parent to parent, until we reach the actor's node
	
		while(current.parent != noone){
			draw_set_alpha(.25);
			draw_line_width_color(current.x +16, current.y+16, current.parent.x +16, current.parent.y+16, 4, c_lime, c_lime);
		
			current = current.parent;
		
		}
	}	//*/
}
draw_set_alpha(1);

if(shake > 0){
	draw_sprite_ext(sprite_index, -1, x + irandom_range(-shakeMag, shakeMag), y + irandom_range(-shakeMag, shakeMag), 1, 1, 0, c_white, 1);	
}else{
	draw_self();
}