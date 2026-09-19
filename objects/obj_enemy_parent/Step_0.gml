if (attack_cooldown > 0) {
    attack_cooldown--;
}

if (damage_flash > 0) {
    damage_flash--;
    
    if (damage_flash mod 2 == 0) {
        image_alpha = 0;
    }
    else {
        image_alpha = 1;
    }
}
else {
    image_alpha = 1;
}

if (recoil_speed > 0) {
    
    var recoil_x = lengthdir_x(
        recoil_speed,
        recoil_direction
    );
    
    var recoil_y = lengthdir_y(
        recoil_speed,
        recoil_direction
    );

    // Horizontal
    if (check_collision(x + recoil_x, y)) {
        
        while (!check_collision(x + sign(recoil_x), y)) {
            x += sign(recoil_x);
        }
        
    }
    else {
        x += recoil_x;
    }

    // Vertical
    if (check_collision(x, y + recoil_y)) {
        
        while (!check_collision(x, y + sign(recoil_y))) {
            y += sign(recoil_y);
        }
        
    }
    else {
        y += recoil_y;
    }

    recoil_speed = lerp(
        recoil_speed,
        0,
        0.2
    );

    if (recoil_speed < 0.05) {
        recoil_speed = 0;
    }

    update_facing_direction();
    update_sprite_direction();
    
    exit;
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
        var move_x = lengthdir_x(move_spd, move_direction); 
        var move_y = lengthdir_y(move_spd, move_direction); 
        
        if (check_collision(x + move_x, y) || check_collision(x, y + move_y)) { 
            move_direction = irandom(359); 
        } else { 
            move_with_collision(move_x, move_y); 
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
        
        
        
        if (enemy_type == EnemyType.TYPE_5) { 
            if (point_distance(x, y, obj_player.x, obj_player.y) <= atk_distance) { 
                state = EnemyState.ATTACK;
                
                move_direction = point_direction(x, y, obj_player.x, obj_player.y); 
                update_facing_direction();
                
                if (enemy_path != -1) { 
                    path_delete(enemy_path);
                    enemy_path = -1;
                } 
                
                path_timer = 0; 
                break;
            } 
        } else if (point_distance(x, y, obj_player.x, obj_player.y) <= atk_distance && attack_cooldown <= 0) { 
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
                
                var move_xx = lengthdir_x(move_spd, move_direction);
                var move_yy = lengthdir_y(move_spd, move_direction);
                
                move_with_collision(move_xx, move_yy);
            }
        }
        
        if (enemy_path != -1) {
            var target_x = path_get_point_x(enemy_path, path_point);
            var target_y = path_get_point_y(enemy_path, path_point);
            
            move_direction = point_direction(x, y, target_x, target_y);
            
            var _next_x = lengthdir_x(move_spd, move_direction); 
            var _next_y = lengthdir_y(move_spd, move_direction);
             
            move_with_collision(_next_x, _next_y);
            
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
        
            case EnemyType.TYPE_4:
                show_debug_message("Entrou no estado do inimigo 4")
                scr_enemy_attack_type_4();
            break;
        
            case EnemyType.TYPE_5:
                scr_enemy_attack_type_5();
            break;    
        }
        
    break;           
}

update_facing_direction();
update_sprite_direction();