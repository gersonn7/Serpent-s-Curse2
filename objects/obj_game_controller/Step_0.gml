if (gameover){
	global.vel_mult = .5;
}else{
	global.vel_mult = 1;	
}

if(keyboard_check(vk_up)){
	gameover = true;
}else{
	gameover = false	
}