// Inherit the parent event
event_inherited();

enemy_type = EnemyType.TYPE_4;

move_spd = 0;

atk_distance = vision_radius;


enemy_sprites = {
    idle_up: spr_state_up,
    idle_down: spr_state_down
}

projectile_created = false;
