
btn_pause_continue = { x1: 500, y1: 250, x2: 866, y2: 320 };
btn_pause_restart  = { x1: 500, y1: 340, x2: 866, y2: 410 };
btn_pause_menu     = { x1: 500, y1: 430, x2: 866, y2: 500 };

music_icon_size = 48; 
sfx_icon_size = 32;
var icon_spacing = 30; 

var frame_width = btn_pause_continue.x2 - btn_pause_continue.x1;
var frame_center_x = btn_pause_continue.x1 + frame_width / 2;

icon_y = 175; 
btn_music_x = frame_center_x - (music_icon_size + icon_spacing + sfx_icon_size) / 2;
btn_sfx_x   = btn_music_x + music_icon_size + icon_spacing;

sfx_y_offset = (music_icon_size - sfx_icon_size) / 2;

btn_music_area = { x1: btn_music_x, y1: icon_y, x2: btn_music_x + music_icon_size, y2: icon_y + music_icon_size };
btn_sfx_area   = { x1: btn_sfx_x,   y1: icon_y + sfx_y_offset, x2: btn_sfx_x   + sfx_icon_size, y2: icon_y + sfx_y_offset + sfx_icon_size };

if (!variable_global_exists("som_mutado")) {
    global.som_mutado = false;
}
if (!variable_global_exists("sfx_mutado")) {
    global.sfx_mutado = false;
}
if (!variable_global_exists("musica_rodando")) {
    global.musica_rodando = noone; 
}

// Pausa o jogo
global.game_paused = true;