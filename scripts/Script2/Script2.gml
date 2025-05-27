/// @function scr_alternar_musica()
// Este script alterna o estado da música de fundo (ligado/desligado)

if (global.musica_ligada) {
    // Se a música está ligada, pare-a
    audio_stop_sound(global.id_musica_fundo);
    global.musica_ligada = false;
    global.id_musica_fundo = noone; // Define como 'noone' pois o som não está mais tocando
} else {
    // Se a música está desligada, toque-a
    // Substitua 'snd_musica_fundo_principal' pelo nome do seu asset de som de música
    global.id_musica_fundo = audio_play_sound(snd_musica_fundo_principal, 10, true);
    global.musica_ligada = true;
}