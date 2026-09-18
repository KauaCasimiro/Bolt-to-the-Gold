if (attack_cooldown > 0) {
    attack_cooldown--;
}

switch (state) {
	case EnemyState.IDLE:
        //Code to state idle
        state_timer++;
        
        if (state_timer >= 120) {
            state = EnemyState.PATROL;
            state_timer = 0;
        }
        
        if (scr_can_see_player()) {
            state = EnemyState.CHASE;
            enemy_path = -1;
            path_point = 0;
        }
        
    break;

    case EnemyState.PATROL:
        //Code to enemy patrolling
        var next_x = x + lengthdir_x(move_spd, move_direction);
        var next_y = y + lengthdir_y(move_spd, move_direction);
        
        if (check_collision(next_x, next_y)) {
            move_direction = irandom(359);
        } else {
            x = next_x;
            y = next_y;
        }
        
        patrol_timer++;
        patrol_direction_timer++
        
        //Change direction
        if (patrol_direction_timer >= patrol_change_time) {
            move_direction = irandom(359);
            patrol_direction_timer = 0;
        }
        
        //Return to idle
        if (patrol_timer >= patrol_duration) {
            state = EnemyState.IDLE;
            patrol_timer = 0;
            patrol_direction_timer = 0;
        }
        
        //Condition for switching to state Chase
        if (scr_can_see_player()) {
            state = EnemyState.CHASE;
            enemy_path = -1;
            path_point = 0;
        }
        
    break;

    case EnemyState.CHASE:
        //Code to chasing player
        
        if (!scr_can_see_player()) {
            state = EnemyState.PATROL;
            
        
            if (enemy_path != -1) {
                path_delete(enemy_path);
                enemy_path = -1;
            } 
            
            break;
        }
        
        if (point_distance(x, y, obj_player.x, obj_player.y) <= atk_distance && attack_cooldown <= 0) {
            
            show_debug_message(
    "BAT >>> CHASE -> ATTACK | Distancia: " +
    string(point_distance(x, y, obj_player.x, obj_player.y)) +
    " | Cooldown: " +
    string(attack_cooldown)
);
            
            state = EnemyState.ATTACK;
            
            if (enemy_path != -1) {
                path_delete(enemy_path);
                enemy_path = -1;
            }
            
            path_timer = 0;
            break;
        }
        
        path_timer++;
        
        if (path_timer >= path_update_timer) {
            if (enemy_path != -1) {
                path_delete(enemy_path);
            }
            
            enemy_path = scr_enemy_path(x, y, obj_player.x, obj_player.y);
            
            path_point = 1;
            path_timer = 0;
        }
        
        if (enemy_path == -1) {
            enemy_path = scr_enemy_path(x, y, obj_player.x, obj_player.y);
            
            path_point = 1;
            
            if (enemy_path == -1) {
                move_direction = point_direction(x, y, obj_player.x, obj_player.y);
                
                var move_x = lengthdir_x(move_spd, move_direction);
                var move_y = lengthdir_y(move_spd, move_direction);
                
                if (!check_collision(x + move_x, y)) {
                    x += move_x;
                }
                
                if (!check_collision(x, y + move_y)) {
                    y += move_y;
                }
            }
        }
        
        if (enemy_path != -1) {
            var target_x = path_get_point_x(enemy_path, path_point);
            var target_y = path_get_point_y(enemy_path, path_point);
            
            move_direction = point_direction(x, y, target_x, target_y);
            
            var _next_x = lengthdir_x(move_spd, move_direction); 
            var _next_y = lengthdir_y(move_spd, move_direction);
             
            if (!check_collision(x + _next_x, y)) { 
                x += _next_x; 
            }
            
            if (!check_collision(x, y + _next_y)) {
                y+= _next_y;
            }
            
            if (point_distance(x, y, target_x, target_y) <= move_spd) { 
                path_point++; 
                
                if (path_point >= path_get_number(enemy_path)) {
                    path_delete(enemy_path);
                    enemy_path = -1;
                }
            }
        }
        
    break;

    case EnemyState.ATTACK:
        //Code to attack player
         /*if (!scr_can_see_player()) {
        state = EnemyState.CHASE;
        break; 
        }

        /*if (point_distance(x, y, obj_player.x, obj_player.y) > atk_distance) {
        state = EnemyState.CHASE;
        break; 
        }*/
        
        //Code for enemy-type attack
        
        switch (enemy_type) {
        	case EnemyType.TYPE_1:
                scr_enemy_attack_type_1();
            break;
        
            case EnemyType.TYPE_2:
                scr_enemy_attack_type_2();
            break;
        
            case EnemyType.TYPE_3:
                scr_enemy_attack_type_3();
            break;    
        }
        
    break;           
}

update_facing_direction();
update_sprite_direction();