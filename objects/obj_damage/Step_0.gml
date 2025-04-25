var enemy_hit = instance_place(x, y, obj_entidade);

if(enemy_hit){
	if(enemy_hit.id != pai){
		
		if(enemy_hit.vida_atual > 0){
			enemy_hit.state = "damage";
			enemy_hit.vida_atual -= damage;
		}
		instance_destroy();
	}
}