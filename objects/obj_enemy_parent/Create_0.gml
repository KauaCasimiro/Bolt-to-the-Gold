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

enum EnemyDirection {
    UP,
    RIGHT,
    DOWN,
    LEFT
}

enemy_type = EnemyType.TYPE_1;

state = EnemyState.IDLE;

state_timer = 0;

move_spd = 0.5;
vision_radius = 50;
atk_distance = 16;

move_direction = 0;
facing_direction = EnemyDirection.DOWN;

patrol_duration = irandom_range(60,180);
patrol_direction_timer = 0;
patrol_timer = 0;
patrol_change_time = 60;

enemy_path = -1;
path_point = 0;

path_timer = 0;
path_update_timer = 15;

attack_cooldown = 0;
attack_cooldown_time = 60;

function check_collision(_x, _y) {
    return place_meeting(_x, _y, obj_wall) || place_meeting(_x, _y, obj_door);
}

function update_facing_direction() {
    var dx = lengthdir_x(1, move_direction);
    var dy = lengthdir_y(1, move_direction);
    
    if (abs(dx) >= abs(dy)) {
        if (dx > 0) {
            facing_direction = EnemyDirection.RIGHT;
        } else {
            facing_direction = EnemyDirection.LEFT;
        }
    } else {
        if (dy < 0) {
            facing_direction = EnemyDirection.UP;
        } else {
        	facing_direction = EnemyDirection.DOWN;
        }
    }
}

function update_sprite_direction() {
    
    if (state == EnemyState.ATTACK) {
        sprite_index = enemy_sprites.attack;
        return;
    }
    
    switch (facing_direction) {
    	case EnemyDirection.UP:
            sprite_index = enemy_sprites.idle_up;
            image_xscale = 1;
        break;
    
        case EnemyDirection.DOWN:
            sprite_index = enemy_sprites.idle_down;
            image_xscale = 1;
        break;
    
        case EnemyDirection.RIGHT:
            sprite_index = enemy_sprites.side;
            image_xscale = 1;
        break;
    
        case EnemyDirection.LEFT:
            sprite_index = enemy_sprites.side;
            image_xscale = -1;
        break;
    }
}