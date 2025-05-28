if (mouse_check_button_pressed(mb_left)) {
    var tx = device_mouse_x_to_gui(0);
    var ty = device_mouse_y_to_gui(0);

    if (point_in_rectangle(tx, ty, btn_pause_continue.x1, btn_pause_continue.y1, btn_pause_continue.x2, btn_pause_continue.y2)) {
        global.game_paused = false;
        instance_destroy();
    }
    else if (point_in_rectangle(tx, ty, btn_pause_restart.x1, btn_pause_restart.y1, btn_pause_restart.x2, btn_pause_restart.y2)) {
        global.game_paused = false;
        room_restart();
    }
    else if (point_in_rectangle(tx, ty, btn_pause_menu.x1, btn_pause_menu.y1, btn_pause_menu.x2, btn_pause_menu.y2)) {
        global.game_paused = false;
        room_goto(Menu);
    }
    else if (point_in_rectangle(tx, ty, btn_music_area.x1, btn_music_area.y1, btn_music_area.x2, btn_music_area.y2)) {
        // Alterna mute global
        global.som_mutado = !global.som_mutado;

        // Ajusta volume da música atual
        if (global.som_mutado) {
            audio_sound_gain(global.musica_rodando, 0, 0.1);
        } else {
            audio_sound_gain(global.musica_rodando, 1, 0.1);
        }
    }
}
