enum EnemyState {
    IDLE,
    PATROL,
    CHASE,
    ATTACK
};

enum EnemyType {
    TYPE_1,
    TYPE_2,
    TYPE_3
};

enemy_type = EnemyType.TYPE_1;

state = EnemyState.IDLE;

state_timer = 0;

move_spd = 0.5;
vision_radius = 50;
atk_distance = 16;

move_direction = 0;

patrol_duration = irandom_range(60,180);
patrol_direction_timer = 0;
patrol_timer = 0;
patrol_change_time = 60;

enemy_path = -1;
path_point = 0;

path_timer = 0;
path_update_timer = 15;

function check_collision(_x, _y) {
    return place_meeting(_x, _y, obj_wall) || place_meeting(_x, _y, obj_door);
}