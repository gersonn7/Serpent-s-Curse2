//movimentacao

var right, left, attack, jump;
var down = place_meeting(x, y + 1, obj_bloqueio);

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(vk_space);
attack = mouse_check_button_pressed(mb_left);

velh = (right - left) * max_velh;

//gravidade

if(!down){
	if(velv < max_velv){
	velv+=GRAVIDADE*massa;
	}
	
}

//maquina de estados

//estado parado
switch(state){
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
		}
		
		break;
	
	
	//estado movendo
	case "movendo":
		//comportamento
		
		sprite_index = spr_player_movendo;
		
		//troca de estado
		//parado
		if(abs(velh)< .1){
		 state = "parado";
		}else if(jump){
			state = "pulando";
			velv = -max_velv;
			image_index = 0;
		}else if(attack){
			state = "ataque"
			velh=0;
			image_index = 0;
		}
		
		break;
		
	//estado pulando
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
		
		//combo
		
		if(attack && combo<2 && image_index >= image_number-2){
			combo++;
			image_index = 0;
		}
		//troca de estado
		if(image_index > image_number - 1){
			state = "parado";
			velh = 0;
			combo = 0;
		}
		break
		
		
}
