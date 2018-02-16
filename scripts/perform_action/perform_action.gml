//arg0 = actor
//arg1 = action to be performed

actor = argument0;
action = argument1;

switch(action){
	case "END TURN":
		actor.state = "end turn";
		actor.actionTimer = 20;
	break;
}