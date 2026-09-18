event_inherited();
enemy_type = EnemyType.TYPE_2;

enemy_sprites = {
    idle_up: spr_bat_idle_up,
    idle_down: spr_bat_idle_down,
    side: spr_bat_side,
    attack: spr_bat_attack
};

vision_radius = 25;


dash_speed = 2.5;
dash_duration = 20;
dash_timer = 0;

dash_start_distance = 0;
dash_end_distance = 0;