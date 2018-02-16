//arg0 = actor whose buttons are to be created

actor = argument0;
button = noone;

buttonList = ds_list_create();

for(i = 0; i<ds_list_size(actor.defaultActions); i++){
	ds_list_add(buttonList, ds_list_find_value(actor.defaultActions, i));
}

buttonY = room_height - 48;
buttonX = room_width/2 - (ds_list_size(buttonList) * 48);

for(ii = 0; ii< ds_list_size(buttonList);ii++){
	button = ds_list_find_value(buttonList,ii);
	
	switch(button){
		case "end turn":
			with(instance_create_depth(buttonX + (ii*96), buttonY, -2, oButton)){
				title = "END TURN";
			
				text = "Finish the turn of current Character";
			
				hotKey = "X";
			}
		break;
	}
}

ds_list_destroy(buttonList);
