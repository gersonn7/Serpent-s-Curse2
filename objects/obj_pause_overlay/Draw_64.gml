// Desenha a sprite de fundo cobrindo toda a tela GUI
draw_sprite_stretched(spr_fundo_gameplay, 0, 0, 0, display_get_gui_width(), display_get_gui_height());

// Retângulo semi-transparente sobre o fundo

//draw_set_alpha(1);
//draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Reset de alpha para desenhar texto e ícones
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(Font_menu);

// Título centralizado "PAUSADO"
var titulo = "PAUSADO";
var escala = 2;
var titulo_w = string_width(titulo) * escala;
var titulo_x = (display_get_gui_width() - titulo_w) / 2;
var titulo_y = 95;
draw_text_transformed(titulo_x, titulo_y, titulo, escala, escala, 0);

// Botões
var txt;
var txt_w;
var txt_h;
var btn_w;
var btn_h;

txt = "CONTINUAR";
txt_w = string_width(txt);
txt_h = string_height(txt);
btn_w = btn_pause_continue.x2 - btn_pause_continue.x1;
btn_h = btn_pause_continue.y2 - btn_pause_continue.y1;
draw_text(btn_pause_continue.x1 + (btn_w - txt_w)/2, btn_pause_continue.y1 + (btn_h - txt_h)/2, txt);

txt = "REINICIAR";
txt_w = string_width(txt);
txt_h = string_height(txt);
btn_w = btn_pause_restart.x2 - btn_pause_restart.x1;
btn_h = btn_pause_restart.y2 - btn_pause_restart.y1;
draw_text(btn_pause_restart.x1 + (btn_w - txt_w)/2, btn_pause_restart.y1 + (btn_h - txt_h)/2, txt);

txt = "MENU";
txt_w = string_width(txt);
txt_h = string_height(txt);
btn_w = btn_pause_menu.x2 - btn_pause_menu.x1;
btn_h = btn_pause_menu.y2 - btn_pause_menu.y1;
draw_text(btn_pause_menu.x1 + (btn_w - txt_w)/2, btn_pause_menu.y1 + (btn_h - txt_h)/2, txt);

// Dimensões das sprites de som
var music_sprite_width = sprite_get_width(spr_som_on); 
var music_sprite_height = sprite_get_height(spr_som_on);
var sfx_sprite_width = sprite_get_width(spr_sfx_on);
var sfx_sprite_height = sprite_get_height(spr_sfx_on);

// Escalas para manter o tamanho definido nos ícones
var music_scale_x = music_icon_size / music_sprite_width;
var music_scale_y = music_icon_size / music_sprite_height;
var sfx_scale_x = sfx_icon_size / sfx_sprite_width;
var sfx_scale_y = sfx_icon_size / sfx_sprite_height;

// Desenha ícones de música e efeitos mutados ou não
if (global.som_mutado) {
    draw_sprite_ext(spr_som_off, 0, btn_music_x, icon_y, music_scale_x, music_scale_y, 0, c_white, 1);
} else {
    draw_sprite_ext(spr_som_on, 0, btn_music_x, icon_y, music_scale_x, music_scale_y, 0, c_white, 1);
}

if (global.sfx_muted) {
    draw_sprite_ext(spr_sfx_off, 0, btn_sfx_x, icon_y + sfx_y_offset, sfx_scale_x, sfx_scale_y, 0, c_white, 1);
} else {
    draw_sprite_ext(spr_sfx_on, 0, btn_sfx_x, icon_y + sfx_y_offset, sfx_scale_x, sfx_scale_y, 0, c_white, 1);
}
