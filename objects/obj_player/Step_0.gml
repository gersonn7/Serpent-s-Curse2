//GAME PAUSE
if (global.game_paused) exit;



//GAME PAUSE

if (global.game_paused) {
    image_speed = 0; 
    exit; 
}

image_speed = 1;

//movimentacao



var right, left, attack, jump, dash;
var down = place_meeting(x, y + 1, obj_bloqueio);

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(vk_space);
attack = mouse_check_button_pressed(mb_left);
dash = keyboard_check_pressed(vk_control);
velh = (right - left) * max_velh * global.vel_mult;


//gravidade

if(!down){
	if(velv < max_velv){
	velv+=GRAVIDADE*massa * global.vel_mult;
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
			AttackInicio(down)
		}else if(dash){
			state = "dashando";
			image_index = 0;
		}
		
		break;
	
	#endregion
	
	#region movendo
	case "movendo":
    sprite_index = spr_player_movendo;

    if (right) image_xscale = 1;
    else if (left) image_xscale = -1;

    // Troca de estado
    if(abs(velh)< .1){
        state = "parado";
    } else if(jump || velv != 0){
        state = "pulando";
        velv = (-max_velv) * jump;
        image_index = 0;
    } else if(attack){
        AttackInicio(down)
    } else if(dash){
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
		if(attack)
		{
			AttackInicio(down)	
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
			AttackFinal()
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
	#region
case "ataque aereo down":
    velv += 1;

    if(!attackDown){
        sprite_index = spr_ataque_aereo2_ready;
        image_index = 0;
        attackDown = true;
    }

    if(sprite_index == spr_ataque_aereo2_ready && image_index > 0.07){
        sprite_index = spr_player_ataque_aereo2_loop;
        image_index = 0;
    }

    if(sprite_index == spr_player_ataque_aereo2_loop && damage == noone && attackReady) {
        damage = instance_create_layer(x + sprite_width/2 + velh*2 , y - sprite_height/2, layer, obj_damage);
        damage.damage = ataque;
        damage.pai = id;
        damage.destruirDano = false;
        attackReady = false;
    }

    if(down){
        if(sprite_index != spr_player_ataque_aereo2_end){
            sprite_index = spr_player_ataque_aereo2_end;
            image_index = 0;
        } else {
            if(image_index >= image_number - 0.2){
                state = "parado";
                attackDown = false;
                screenShake(5);
                AttackFinal();
            }
        }
    }

break;
	#endregion
	#region ataque aereo
	case "ataque aereo":
		if(sprite_index != spr_player_ataque_aereo1){
			sprite_index = spr_player_ataque_aereo1
			image_index = 0;
		}
   
		
		if(image_index >= 1 && damage == noone && attackReady) {
			damage = instance_create_layer(x + sprite_width/2 + velh*2 , y - sprite_height/2, layer, obj_damage);
			damage.damage = ataque;
			damage.pai = id;
			attackReady = false;
		}
		
		//troca de estado
		if(image_index >= image_number - 1)
		{
			state = "pulando"
			AttackFinal()
		}
		if(down){
			state = "parado"
			AttackFinal()
		}
		
		break;
	#endregion
	
	
	#region dash
	case "dashando":
	if(sprite_index!= spr_player_dash){
		image_index = 0;
		sprite_index = spr_player_dash;
	}
		velh = image_xscale*dash_vel;
		
		if(image_index >= image_number - 1 || !down){
			state = "parado"	
		}
	break;
		
		
	#endregion
	
	#region damage
	case "damage":
		if(sprite_index != spr_player_hit){
			sprite_index = spr_player_hit
			image_index = 0;
			screenShake(3)
		}
		
		velh = 0;	
		
	//condicao saida
		if(vida_atual> 0){
			if(image_index >= image_number -1){
			state = "parado"	
			}
		}else{
			if(image_index >= image_number -1){
			state = "dead"	
			}
		}
		break;
	#endregion
		
	#region dead
	case "dead":
{
    if (sprite_index != spr_player_morte)
    {
        image_index = 0;
        sprite_index = spr_player_morte;
        image_speed = 0.2; // Garante que a animação avance
    }

    // Fica parado no final da animação e ativa o gameover
    if (image_index >= image_number - 1)
    {
        image_index = image_number - 1;

        if (instance_exists(obj_game_controller))
        {
            with (obj_game_controller)
            {
                gameover = true;
            }
        }
    }
}
break;
	#endregion
		
	default:
		state = "parado"
	break
}

	

if(keyboard_check(ord("R")))game_restart();