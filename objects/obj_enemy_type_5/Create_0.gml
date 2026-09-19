// Inherit the parent event
event_inherited();

enemy_type = EnemyType.TYPE_5;

move_spd = 0.2;

atk_distance = 35;

attack_started = false;

enemy_sprites = {
    idle_up: spr_mimic_idle_up,
    idle_down: spr_mimic_idle_down,
    idle_side: spr_mimic_idle_side,
    walking_up: spr_mimic_walking_up,
    walking_down: spr_mimic_walking_down,
    walking_side: spr_mimic_walking_side,
    attack_up: spr_mimic_attack_up,
    attack_down: spr_mimic_attack_down,
    attack_side: spr_mimic_attack_side
}

projectile_created = false;
