// Obtenha o ID do tilemap para colisão
var _tile = layer_tilemap_get_id("Terreno");

// Verifica se o jogador está no chão
var _chao = place_meeting(x, y + 1, _tile);

// Checando as teclas de movimento e pulo
var _right = keyboard_check(vk_right);
var _left = keyboard_check(vk_left);
var _jump = keyboard_check_pressed(vk_space);

// Configurando a velocidade horizontal
velh = (_right - _left) * velh_max;

// Gravidade e pulo
if (!_chao) {
    // Aplicando gravidade quando o jogador não está no chão
    velv += grav;
} else {
    // Se está no chão, zera a velocidade vertical
    velv = 0;

    // Se o jogador pressiona pular, aplica o impulso de pulo
    if (_jump) {
        velv = -velv_max;
    }
}

// Movimento horizontal com verificação de colisão
x += velh;
if (place_meeting(x, y, _tile)) {
    // Se houver colisão, corrige a posição na direção oposta ao movimento
    if (velh > 0) {
        while (place_meeting(x, y, _tile)) x -= 1;
    } else if (velh < 0) {
        while (place_meeting(x, y, _tile)) x += 1;
    }
}

// Movimento vertical com verificação de colisão
y += velv;
if (place_meeting(x, y, _tile)) {
    // Se houver colisão, corrige a posição na direção oposta ao movimento
    if (velv > 0) {
        while (place_meeting(x, y, _tile)) y -= 1;
    } else if (velv < 0) {
        while (place_meeting(x, y, _tile)) y += 1;
    }
}

// Invertendo a face do personagem apenas se estiver se movendo
if (velh > 0) {
    image_xscale = 1; // Olha para a direita
} else if (velh < 0) {
    image_xscale = -1; // Olha para a esquerda
}
