if (damage_timer > 0) {
    damage_timer--;
    exit;
}


// Verifica se o retângulo do jogador está sobre a trap
var has_target = rectangle_in_rectangle(
    obj_player.x - 3,
    obj_player.y + 2,
    obj_player.x + 3,
    obj_player.y + 8,
    x,
    y,
    x + 8,
    y + 8
);


// Verifica se algum inimigo terrestre está sobre a trap
if (!has_target) {
    var enemy_count = instance_number(obj_enemy_parent);

    for (var i = 0; i < enemy_count; i++) {
        var enemy = instance_find(obj_enemy_parent, i);

        if (enemy.enemy_type != EnemyType.TYPE_2) {
            if (place_meeting(x, y, enemy)) {
                has_target = true;
                break;
            }
        }
    }
}


// Se ninguém está sobre a trap, ela fica parada no sprite 0
if (image_index == 0 && !has_target) {
    image_index = 0;
    image_speed = 0;
    exit;
}


// Ativa a trap
if (image_index == 0 && has_target) {
    image_index = 1;
    image_speed = 0.5;
    damage_applied = false;
}


// Dano no sprite 3
if (image_index >= 2 && !damage_applied) {

    damage_applied = true;

    // PLAYER
    if (rectangle_in_rectangle(
        obj_player.x - 6,
        obj_player.y + 2,
        obj_player.x + 6,
        obj_player.y + 8,
        x,
        y,
        x + 8,
        y + 8
    )) {
        obj_player.take_damage(x, y, obj_player.recoil_force * 0.5);
    }


    // INIMIGOS
    var enemy_count = instance_number(obj_enemy_parent);

    for (var i = 0; i < enemy_count; i++) {
        var enemy = instance_find(obj_enemy_parent, i);

        if (enemy.enemy_type == EnemyType.TYPE_2) {
            continue;
        }

        if (place_meeting(x, y, enemy)) {
            obj_enemy_parent.take_damage(x, y, 2.5)
        }
    }
}


// Terminou os sprites 2, 3 e 4
if (image_index >= 3) {
    image_index = 0;
    image_speed = 0;
    damage_timer = damage_cooldown;
}