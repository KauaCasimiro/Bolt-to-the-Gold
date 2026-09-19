// O baú só pode abrir quando não existem inimigos
can_open = !instance_exists(obj_enemy_parent);


// Área de interação na frente do baú
var player_in_front = collision_rectangle(
    x - 4,
    y - 8,
    x + 12,
    y + 20,
    obj_player,
    false,
    true
);

var player_collision = rectangle_in_rectangle(
    obj_player.x - 3,
    obj_player.y + 2,
    obj_player.x + 3,
    obj_player.y + 8,
    x,
    y,
    x + 8,
    y + 8
);

if (player_collision > 0) {
    obj_player.x -= obj_player.move_x;
    obj_player.y -= obj_player.move_y;
}

// Abre automaticamente
if (!opened && can_open) {
    if (player_in_front && obj_player.facing_direction == 0) {
        
        opened = true;
        image_index = 1;
        
        // Sorteia a recompensa
        var reward = irandom(1);
        
        if (reward == 0) {
            // Ouro
            obj_player.gold += 5;
        }
        else {
            // Vida
            obj_player.hp += 1;
        }
    }
}