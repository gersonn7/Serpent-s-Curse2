/// scr_atacando(_sprite_index, _image_index_min, _image_index_max, distX, distY)
function scr_atacando(_sprite_index, _image_index_min, _image_index_max, distX, distY) {
    velh = 0;

    sprite_index = _sprite_index;

    if (image_index > _image_index_min && possoCriarDano) {
        damage = instance_create_layer(x + distX, y + distY, layer, obj_damage);
        damage.damage = ataque;
        damage.pai = id;
        possoCriarDano = false;
    }

    if (damage != noone) {
        if (image_index >= _image_index_max || state != "attack") {
            instance_destroy(damage);
            damage = noone;
        }
    }

    if (image_index > image_number - 1) {
        state = "parado";
        damage = noone;
    }
}