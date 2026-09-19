function scr_enemy_attack_type_2(){
    //show_debug_message("Enemy Type 2 attacking");
    if (dash_timer <= 0) {
        move_direction = point_direction(x, y, obj_player.x, obj_player.y);
        dash_start_distance = point_distance(x, y, obj_player.x, obj_player.y);
        dash_timer = dash_duration;
        damage_applied = false;
    }
        
    var dash_x = lengthdir_x(dash_speed, move_direction);
    var dash_y = lengthdir_y(dash_speed, move_direction);
        
    if (!check_collision(x +  dash_x, y)) {
        x += dash_x;
    }
        
    if (!check_collision(x, y + dash_y)) {
        y += dash_y;
    }
    
    // Dano ao jogador durante o dash
    if (!damage_applied) {
        if (place_meeting(x, y, obj_player)) {
            obj_player.take_damage(x, y, obj_player.recoil_force);
            damage_applied = true;
        }
    }
        
    dash_timer--;
        
    if (dash_timer <= 0) {
        dash_end_distance = point_distance(x, y, obj_player.x, obj_player.y);
        state = EnemyState.CHASE;
        attack_cooldown = attack_cooldown_time;
    }       
}    