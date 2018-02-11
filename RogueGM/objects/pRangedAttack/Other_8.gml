/// @description 

if(status != "miss"){
	target.hitPoints -= damage;
	
	//
	for(ii=0; ii<6; ii++){
		with(instance_create_depth(target.x + 16 ,target.y + 16, -2, oBiff)){
			direction = irandom(360);
			speed = 1 ; //irandom_range(2,4);
			scale = choose(1,2);
			
			image_speed = .5;
			
			if(other.status == "crit"){
				color = c_yellow;	
			}
			
		}
	}
	
	//output text for damage, 
	with(instance_create_depth(target.x + 28, target.y + 2, -2, oDamageText)){
		text = "-" + string(other.damage);
		ground = y;
		if(other.status == "crit"){
			font = fCrit;	
		}
	}
	
	
	if(status != "miss"){
		if(status == "crit"){
			target.shake = 8;
			target.shakeMag = 8;
		}else{
			target.shake = 4; 
			target.shakeMag = 4;
		}
	}
	
	
	
}else{
	with(instance_create_depth(target.x + 28, target.y + 2, -2, oDamageText)){
		text = "miss";
		ground = y;
		
		//target.shake = 2;
		//target.shakeMag = 2;
	}
}

instance_destroy();