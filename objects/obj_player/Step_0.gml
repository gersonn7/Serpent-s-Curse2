//movimentacao

var right, left, attack, jump, dash;
var down = place_meeting(x, y + 1, obj_bloqueio);

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(vk_space);
attack = mouse_check_button_pressed(mb_left);
dash = keyboard_check_pressed(vk_control);
velh = (right - left) * max_velh;


//gravidade

if(!down){
	if(velv < max_velv){
	velv+=GRAVIDADE*massa;
	}
	
}

//maquina de estados


switch(state){
	#region parado
	case "parado":
		//comportamento
		sprite_index = spr_player_parado_1;
		
		
		//troca de estado
		//movendo
		if(right || left){
			state ="movendo";
			image_index = 0;
		}
		else if(jump || velv != 0){
			state = "pulando";
			velv = (-max_velv) * jump;
			image_index = 0;
		}else if(attack){
			state = "ataque";
			velh = 0;
			image_index = 0;
		}else if(dash){
			state = "dashando";
			image_index = 0;
		}
		
		break;
	
	#endregion
	
	#region movendo
	case "movendo":
		//comportamento
		
		sprite_index = spr_player_movendo;
		
		//troca de estado
		//parado
		if(abs(velh)< .1){
		 state = "parado";
		}else if(jump || velv != 0){
			state = "pulando";
			velv = (-max_velv) * jump;
			image_index = 0;
		}else if(attack){
			state = "ataque"
			velh=0;
			image_index = 0;
		}else if(dash){
			state = "dashando";
			image_index = 0;
		}
		
		break;
	#endregion
		
	#region pulando
	case "pulando":
		//comportamento
		
		if(velv > 0){
			sprite_index = spr_player_caindo;
		}else{
			sprite_index = spr_player_pulo;
			
			if(image_index >= image_number-1){
				image_index = image_number - 1;
			}
		}

		//troca de estado
		if(down){
			state = "parado"
			velh = 0;
		}
		break;
		
		//estado de ataque
		
	#endregion
	
	#region ataque
		case "ataque":
		
		velh = 0;
		//comportamento
		if(combo == 0){
		sprite_index = spr_player_ataque1;
		}else if(combo ==2){
			sprite_index = spr_player_ataque2;
		}else if(combo == 3){
			sprite_index = spr_player_ataque3;
		}
		
		//objeto damage
		
		// Criar objeto de dano
		if(image_index >= 2 && damage == noone && attackReady) {
			damage = instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_damage);
			damage.damage = ataque;
			damage.pai = id;
			attackReady = false;
		}
		
		
		//combo 
		
		if(attack && combo<2 && image_index >= image_number-2){
			combo++;
			image_index = 0;
			attackReady = true;
			if(damage){
				instance_destroy(damage, false);
				damage = noone;
			}
		}
		//troca de estado
		if(image_index > image_number - 1){
			state = "parado";
			velh = 0;
			combo = 0;
			attackReady = true;
			if(damage){
				instance_destroy(damage, false);
				damage = noone;
			}
		}
		if(dash){
			state = "dashando";
			image_index = 0;
			combo = 0;
			if(damage){
				instance_destroy(damage, false);
				damage = noone;
			}
		}
		break
		
	#endregion	
	
	#region dash
	case "dashando":
		sprite_index = spr_player_dash;
		
		velh = image_xscale*dash_vel;
		
		if(image_index >= image_number - 1){
			state = "parado"	
		}
		
		
	#endregion
}

if(keyboard_check(ord("R")))room_restart();