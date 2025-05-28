draw_set_font(Font_menu);

btn_pause_continue = { x1: 500, y1: 250, x2: 866, y2: 320 };
btn_pause_restart  = { x1: 500, y1: 340, x2: 866, y2: 410 };
btn_pause_menu     = { x1: 500, y1: 430, x2: 866, y2: 500 };


var frame_width = btn_pause_continue.x2 - btn_pause_continue.x1;
var frame_center_x = btn_pause_continue.x1 + frame_width / 2;

music_icon_size = 48; 
sfx_icon_size = 32;   

var icon_spacing = 30; 
var total_icons_width = music_icon_size + icon_spacing + sfx_icon_size;

icon_y = 175; 


btn_music_x = frame_center_x - (total_icons_width / 2);
btn_sfx_x   = btn_music_x + music_icon_size + icon_spacing;


sfx_y_offset = (music_icon_size - sfx_icon_size) / 2;


btn_music_area = { x1: btn_music_x, y1: icon_y, x2: btn_music_x + music_icon_size, y2: icon_y + music_icon_size };
btn_sfx_area   = { x1: btn_sfx_x,   y1: icon_y + sfx_y_offset, x2: btn_sfx_x   + sfx_icon_size, y2: icon_y + sfx_y_offset + sfx_icon_size };


if (!variable_global_exists("global.music_muted")) {
    global.music_muted = false;
}
if (!variable_global_exists("global.sfx_muted")) {
    global.sfx_muted = false;
}

if (!variable_global_exists("id_musica_fundo")) {
    global.id_musica_fundo = noone;
}
if (!variable_global_exists("music_muted")) {
    global.music_muted = false;
}