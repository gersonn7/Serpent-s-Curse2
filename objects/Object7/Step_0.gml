if (!collected) {
    frame_timer += frame_speed;

    if (frame_timer >= 1) {
        frame = (frame + 1) mod array_length(coin_sprites);
        sprite_index = coin_sprites[frame];
        frame_timer -= 1; // <-- Aqui é importante usar -= 1 e não = 0 para evitar travar
    }
}