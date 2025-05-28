var enemy_hit = instance_place(x, y, obj_entidade);

if (enemy_hit != noone && enemy_hit.id != pai) {
    
    var elementoPai = object_get_parent(enemy_hit.object_index);
    if (elementoPai != object_get_parent(pai.object_index)) {
        
        if (enemy_hit.vida_atual > 0) {
            enemy_hit.state = "damage";
            enemy_hit.image_index = 0;
            enemy_hit.vida_atual -= damage;
        }
        
        instance_destroy();
    }
}