var down = place_meeting(x, y + 1, obj_bloqueio);
if(!down){
	velv += GRAVIDADE * massa;
};


//maquina de estados

//parado
switch(state){
	case "parado":
	velh = 0;
	//timer_state++
	if(sprite_index != spr_inimigo_sprout_idle){
		image_index = 0;	
	}
		sprite_index = spr_inimigo_sprout_idle;
		
		if(irandom(timer_state) > 300){
			state = choose("movendo", "parado", "movendo");
			timer_state = 0;
		}
		
		break;
		
	//movendo
	case "movendo":
		velh = 1;
		if(sprite_index!= spr_inimigo_sprout_move){
			image_index = 0;
			
		}
		sprite_index = spr_inimigo_sprout_move;
		
		//troca de estado
		if(irandom(timer_state) > 300){
			state = chose("parado", "movendo", "parado");
			timer_state = 0;
		}
		break;
	
	//damage
	case "damage":
	if(sprite_index != spr_inimigo_sprout_damage){
		image_index = 0;
	}
		sprite_index = spr_inimigo_sprout_damage;
		
		//troca de estado
		if(image_index > image_number -1){
			//check estado
			if(vida_atual>0){
				state = "parado";
			}else if(vida_atual<=0){
				state = "dead";
			}
		}
		break;
		
	
	//dead
	case "dead":
	if(sprite_index != spr_inimigo_sprout_dead){
		sprite_index = 0;
	}
		sprite_index = spr_inimigo_sprout_dead;
		if(image_index > image_number -1){
			image_speed = 0;
			image_alpha -= .01;
	}
		break;
}