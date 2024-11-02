// Tilemap com o qual o jogador vai colidir
var _tile = layer_tilemap_get_id("Terreno");

// Checando se o jogador está no chão
var _chao = place_meeting(x, y + 1, _tile);

// Checando as teclas
var _right = keyboard_check(vk_right);
var _left = keyboard_check(vk_left);
var _jump = keyboard_check_pressed(vk_space);

// Configurando a velocidade horizontal
velh = (_right - _left) * velh_max;

// Gravidade e pulo
if (!_chao) {
    // Se não estou no chão, a gravidade me faz cair
    velv += grav;
} else {
    // Estou no chão, zero a velocidade vertical
    velv = 0;

    // Se estou no chão e pressiono pular, aplico o pulo
    if (_jump) {
        velv = -velv_max;
    }
}

// Movendo na horizontal com colisão
move_and_collide(velh, 0, _tile);

// Movendo na vertical com colisão
move_and_collide(0, velv, _tile, 12);

// Troca de sprites com base no estado do jogador
if (!_chao) {
    // Se o jogador está no ar (pulo), exibe o sprite de pulo
    //sprite_index = spr_player_jump;
} else if (velh != 0) {
    // Se o jogador está no chão e se movendo, exibe o sprite de corrida
    sprite_index = spr_player_correndo;
} else {
    // Se o jogador está no chão e parado, exibe o sprite parado
    sprite_index = spr_player_parado;
}

// Verificando a direção do movimento para ajustar o sprite
if (_right) {
    image_xscale = 1; // Vira o sprite para a direita
} else if (_left) {
    image_xscale = -1; // Vira o sprite para a esquerda
}
