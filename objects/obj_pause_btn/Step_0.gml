if (mouse_check_button_pressed(mb_left)) {
    var tx = device_mouse_x_to_gui(0);
    var ty = device_mouse_y_to_gui(0);  // Definido corretamente!

    if (point_in_rectangle(tx, ty,
        x - btn_size/2, y - btn_size/2,
        x + btn_size/2, y + btn_size/2)) {
        
        if (!global.game_paused) {
            global.game_paused = true;
            instance_create_layer(0, 0, "GUI", obj_pause_overlay);
        }
    }
}
