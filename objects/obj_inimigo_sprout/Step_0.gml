var down = place_meeting(x, y + 1, obj_bloqueio);
if(!down){
	velv += GRAVIDADE * massa * global.vel_mult
};

//maquina de estados

//parado
switch(state){
	case "parado":
	velh = 0;
	timer_state++
	if(sprite_index != spr_inimigo_sprout_idle){
		image_index = 0;	
	}
		sprite_index = spr_inimigo_sprout_idle;
		
	if(position_meeting(mouse_x, mouse_y, self)){
			if(mouse_check_button_pressed(mb_right)){
				state = "damage"	
			}
		}
		
		if(irandom(timer_state) > 300){
			state = choose("movendo", "movendo", "parado");
			timer_state = 0;
		}
		if (instance_exists(obj_player)) {
			  scr_attackPlayer(obj_player, 64, image_xscale);
		}

		
		break;
		
	//movendo
	case "movendo":
		
		timer_state++
		if(sprite_index!= spr_inimigo_sprout_move){
			image_index = 0;
			velh = choose(-1, 1);
		}
		sprite_index = spr_inimigo_sprout_move;
		
		//troca de estado
		if(irandom(timer_state) > 300){
			state = choose("parado", "movendo", "parado");
			timer_state = 0;
		}
		if (instance_exists(obj_player)) {
			scr_attackPlayer(obj_player, 64, image_xscale);
		}

		break;
	
	case "attack":
		velh = 0;
		if(sprite_index!= spr_inimigo_sprout_attack){
			image_index = 0;
			possoCriarDano = true;
			damage = noone;
		}
		sprite_index = spr_inimigo_sprout_attack;
		
		if(image_index > image_number - 1) {
			state = "parado"	
		}
		if(sprite_index != spr_inimigo_sprout_attack){
		    image_index = 0;
		}
		sprite_index = spr_inimigo_sprout_attack;
		if (image_index > 3 && possoCriarDano) {
		    damage = instance_create_layer(x - 20 + sprite_width / 2, y - sprite_height / 2, layer, obj_damage);
		    damage.damage = ataque;
		    damage.pai = id;
		    possoCriarDano = false;
		}
		if (damage != noone) {
		    if (image_index >= 6 || state != "attack") {
		        instance_destroy(damage);
		        damage = noone;
    }
}


		if(image_index > image_number - 1) {
		    state = "parado";
		    damage = noone;
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
		velh = 0;
	}
		sprite_index = spr_inimigo_sprout_dead;
		if(image_index > image_number -1){
			image_speed = 0;
			image_alpha -= .01;
	}
		break;
}