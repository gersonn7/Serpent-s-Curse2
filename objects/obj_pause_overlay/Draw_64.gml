// Fundo escurecido ou fundo do pause
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);
draw_set_color(c_white);

// Texto título "PAUSADO" centralizado
var titulo = "PAUSADO";
var escala = 2;
var titulo_w = string_width(titulo) * escala;
var titulo_x = (display_get_gui_width() - titulo_w) / 2;
var titulo_y = 95;
draw_text_transformed(titulo_x, titulo_y, titulo, escala, escala, 0);

// Desenha botões (texto centralizado)
function desenhar_botao(btn, texto) {
    var w = btn.x2 - btn.x1;
    var h = btn.y2 - btn.y1;
    draw_rectangle(btn.x1, btn.y1, btn.x2, btn.y2, false);
    var txt_w = string_width(texto);
    var txt_h = string_height(texto);
    draw_text(btn.x1 + (w - txt_w) / 2, btn.y1 + (h - txt_h) / 2, texto);
}
desenhar_botao(btn_pause_continue, "CONTINUAR");
desenhar_botao(btn_pause_restart, "REINICIAR");
desenhar_botao(btn_pause_menu, "MENU");

// Desenha ícones de som e sfx

var music_sprite = global.som_mutado ? spr_som_off : spr_som_on;
var sfx_sprite = global.sfx_mutado ? spr_sfx_off : spr_sfx_on;

var music_scale_x = music_icon_size / sprite_get_width(music_sprite);
var music_scale_y = music_icon_size / sprite_get_height(music_sprite);
var sfx_scale_x = sfx_icon_size / sprite_get_width(sfx_sprite);
var sfx_scale_y = sfx_icon_size / sprite_get_height(sfx_sprite);

draw_sprite_ext(music_sprite, 0, btn_music_x, icon_y, music_scale_x, music_scale_y, 0, c_white, 1);
draw_sprite_ext(sfx_sprite, 0, btn_sfx_x, icon_y + sfx_y_offset, sfx_scale_x, sfx_scale_y, 0, c_white, 1);