// Atualiza base_y para o tamanho correto da tela a cada frame
base_y = display_get_gui_height() - 120;

// base_x é fixo (distância da esquerda)
base_x = 120;

// Desenha a base do joystick
draw_sprite(spr_btn_base, 0, base_x, base_y);

// Desenha o stick (joystick) no centro da base, por enquanto sem movimento
draw_sprite(spr_btn_stick, 0, base_x + stick_x, base_y + stick_y);
