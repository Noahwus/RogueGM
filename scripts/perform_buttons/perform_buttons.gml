//arg0 = actor who is performing the action
//arg1 = the button to be performed

actor = argument0;
button = argument1;

switch(button.title){
	case "END TURN":
		actor.state = "begin action";
		actor.readiedAction = "END TURN";
		actor.targetingType = "noone";
		
		with(instance_create_depth(room_width/2, room_height, -2, oConfirmButton)){
			title = other.button.title;
			text = other.button.text;
			hotKey = other.button.hotKey;
		}
		
		wipe_nodes();
		wipe_buttons();
		
	break;
}