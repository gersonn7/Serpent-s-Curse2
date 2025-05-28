
scroll_y -= velocidade_scroll;


if (device_mouse_check_button(0, mb_left)) {
    var touch_y = device_mouse_y(0);

    if (touch_last_y != -1) {
        touch_scroll_vel = touch_y - touch_last_y;
        scroll_y += touch_scroll_vel;
    }

    touch_last_y = touch_y;
} else {
    touch_last_y = -1;
}


var total_altura = array_length(creditos) * 32;
if (scroll_y < -total_altura + room_height - 100) {
    scroll_y = -total_altura + room_height - 100;
}
