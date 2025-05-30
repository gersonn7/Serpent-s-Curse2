// Desenha o sprite centralizado na posição btn_x, btn_y
draw_sprite(spr_pause_btn, 0, btn_x - sprite_get_width(spr_pause_btn) / 2, btn_y - sprite_get_height(spr_pause_btn) / 2);


// Debug da área de clique (retângulo vermelho)
draw_set_color(c_red);
draw_set_alpha(0.4);
draw_rectangle(
    btn_x - btn_size / 2, btn_y - btn_size / 2,
    btn_x + btn_size / 2, btn_y + btn_size / 2,
    false
);
draw_set_alpha(1);
draw_set_color(c_white);
