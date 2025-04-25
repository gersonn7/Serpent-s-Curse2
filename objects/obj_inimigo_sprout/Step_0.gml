var down = place_meeting(x, y + 1, obj_bloqueio);

if(!down){
	velv += GRAVIDADE * massa;
};


//maquina de estados

//parado
switch(state){
	case "parado":
	if(sprite_index != spr_inimigo_sprout_idle){
		image_index = 0;	
	}
		sprite_index = spr_inimigo_sprout_idle;
		
		//troca de estado
		if(position_meeting(mouse_x, mouse_y, self)){
			if(mouse_check_button(mb_left)){
				state = "damage";
			}
		}
		break;
		
	//movendo
	case "movendo":
		sprite_index = spr_inimigo_sprout_move;
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