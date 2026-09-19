enum EnemyState {
    IDLE,
    PATROL,
    CHASE,
    ATTACK
};

enum EnemyType {
    TYPE_1,
    TYPE_2,
    TYPE_3,
    TYPE_4,
    TYPE_5
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

last_vertical_direction = EnemyDirection.DOWN;

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
    
    // =====================================================
    // TYPE 3 - CHASE
    // =====================================================
    if (enemy_type == EnemyType.TYPE_3 && state == EnemyState.CHASE) {
        sprite_index = enemy_sprites.attack;
        
        image_xscale = 1;
        
        if (facing_direction == EnemyDirection.LEFT) {
            image_xscale = -1;
        }
        
        return;
    }
    
    if (enemy_type == EnemyType.TYPE_4) {
    if (move_direction >= 90 && move_direction < 270) {
        sprite_index = enemy_sprites.idle_down;
    }
    else {
        sprite_index = enemy_sprites.idle_up;
    }
    
    image_xscale = 1;
    return;
}
    
    if (enemy_type == EnemyType.TYPE_5 && state == EnemyState.ATTACK) {
    
    switch (facing_direction) {
        
        case EnemyDirection.UP:
            sprite_index = enemy_sprites.attack_up;
            image_xscale = 1;
        break;
        
        case EnemyDirection.DOWN:
            sprite_index = enemy_sprites.attack_down;
            image_xscale = 1;
        break;
        
        case EnemyDirection.RIGHT:
            sprite_index = enemy_sprites.attack_side;
            image_xscale = -1;
        break;
        
        case EnemyDirection.LEFT:
            sprite_index = enemy_sprites.attack_side;
            image_xscale = 1;
        break;
    }
    
    return;
}
    
    
    // =====================================================
    // ATAQUE
    // =====================================================
    if (state == EnemyState.ATTACK) {
        if (variable_struct_exists(enemy_sprites, "attack")) {
            sprite_index = enemy_sprites.attack;
            
            image_xscale = 1;
            
            if (facing_direction == EnemyDirection.LEFT) {
                image_xscale = -1;
            }
            
            return;
        }
    }
    
    
    // =====================================================
    // ESTADO DE MOVIMENTO
    // =====================================================
    var is_walking = (
        state == EnemyState.PATROL ||
        state == EnemyState.CHASE
    );
    
    
    // =====================================================
    // TYPE 3 - ATUALIZA ÚLTIMA DIREÇÃO VERTICAL
    // =====================================================
    if (enemy_type == EnemyType.TYPE_3) {
        
        var dx = lengthdir_x(1, move_direction);
        var dy = lengthdir_y(1, move_direction);
        
        if (abs(dy) > abs(dx)) {
            
            if (dy < 0) {
                last_vertical_direction = EnemyDirection.UP;
            }
            else {
                last_vertical_direction = EnemyDirection.DOWN;
            }
        }
    }
    
    
    // =====================================================
    // DIREÇÃO
    // =====================================================
    switch (facing_direction) {
        
        // -------------------------
        // CIMA
        // -------------------------
        case EnemyDirection.UP:
            
            image_xscale = 1;
            
            if (is_walking && variable_struct_exists(enemy_sprites, "walking_up")) {
                sprite_index = enemy_sprites.walking_up;
            }
            else {
                sprite_index = enemy_sprites.idle_up;
            }
            
        break;
        
        
        // -------------------------
        // BAIXO
        // -------------------------
        case EnemyDirection.DOWN:
            
            image_xscale = 1;
            
            if (is_walking && variable_struct_exists(enemy_sprites, "walking_down")) {
                sprite_index = enemy_sprites.walking_down;
            }
            else {
                sprite_index = enemy_sprites.idle_down;
            }
            
        break;
        
        
        // -------------------------
        // DIREITA
        // -------------------------
        case EnemyDirection.RIGHT:
            
            image_xscale = 1;
            
            if (variable_struct_exists(enemy_sprites, "idle_side")) {
                
                if (is_walking && variable_struct_exists(enemy_sprites, "walking_side")) {
                    sprite_index = enemy_sprites.walking_side;
                }
                else {
                    sprite_index = enemy_sprites.idle_side;
                }
                
            }
            else {
                
                // Inimigo sem sprite lateral.
                // Usa a última direção vertical.
                if (last_vertical_direction == EnemyDirection.UP) {
                    
                    if (is_walking && variable_struct_exists(enemy_sprites, "walking_up")) {
                        sprite_index = enemy_sprites.walking_up;
                    }
                    else {
                        sprite_index = enemy_sprites.idle_up;
                    }
                    
                }
                else {
                    
                    if (is_walking && variable_struct_exists(enemy_sprites, "walking_down")) {
                        sprite_index = enemy_sprites.walking_down;
                    }
                    else {
                        sprite_index = enemy_sprites.idle_down;
                    }
                }
            }
            
        break;
        
        
        // -------------------------
        // ESQUERDA
        // -------------------------
        case EnemyDirection.LEFT:
            
            if (variable_struct_exists(enemy_sprites, "idle_side")) {
                
                image_xscale = -1;
                
                if (is_walking && variable_struct_exists(enemy_sprites, "walking_side")) {
                    sprite_index = enemy_sprites.walking_side;
                }
                else {
                    sprite_index = enemy_sprites.idle_side;
                }
                
            }
            else {
                
                // Inimigo sem sprite lateral.
                // Usa a última direção vertical.
                image_xscale = 1;
                
                if (last_vertical_direction == EnemyDirection.UP) {
                    
                    if (is_walking && variable_struct_exists(enemy_sprites, "walking_up")) {
                        sprite_index = enemy_sprites.walking_up;
                    }
                    else {
                        sprite_index = enemy_sprites.idle_up;
                    }
                    
                }
                else {
                    
                    if (is_walking && variable_struct_exists(enemy_sprites, "walking_down")) {
                        sprite_index = enemy_sprites.walking_down;
                    }
                    else {
                        sprite_index = enemy_sprites.idle_down;
                    }
                }
            }
            
        break;
    }
}