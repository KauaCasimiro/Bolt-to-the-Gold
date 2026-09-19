draw_self();

// Área de colisão do jogador
draw_set_color(c_lime);

draw_rectangle(
    obj_player.x - 6,
    obj_player.y + 2,
    obj_player.x + 6,
    obj_player.y + 8,
    true
);

draw_set_color(c_white);