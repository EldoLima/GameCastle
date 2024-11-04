// Evento Step do esqueleto

// Mover o esqueleto
x += speed * direction;

// Verifica se o esqueleto atingiu a posição específica para inverter
if (x >= 672) {
    x = 672; // Define a posição x como 672
    direction = -1; // Inverte a direção para esquerda
    sprite_index = spr_skeleton_idle; // Muda para o sprite idle
} else if (x <= 0) {
    x = 0; // Limite esquerdo
    direction = 1; // Inverte a direção para direita
    sprite_index = spr_skeleton_idle; // Muda para o sprite idle
} else {
    // Se o esqueleto não atingiu um limite, use o sprite de andar
    sprite_index = spr_skeleton_walk; // Sprite de andar
}

// Verifica a direção do movimento para ajustar a escala da sprite
if (direction == -1) {
    image_xscale = -1; // Inverte o sprite para olhar para a esquerda
} else {
    image_xscale = 1; // Mantém o sprite na direção original (direita)
}
