function scr_enemy_attack_type_2(){
    //show_debug_message("Enemy Type 2 attacking");
    if (dash_timer <= 0) {
        move_direction = point_direction(x, y, obj_player.x, obj_player.y);
        dash_start_distance = point_distance(x, y, obj_player.x, obj_player.y);
        dash_timer = dash_duration;
        
        

        show_debug_message("BAT >>>>> INICIO DASH | Distancia: " + string(dash_start_distance));
    }
        
    var dash_x = lengthdir_x(dash_speed, move_direction);
    var dash_y = lengthdir_y(dash_speed, move_direction);
        
    if (!check_collision(x +  dash_x, y)) {
        x += dash_x;
    }
        
    if (!check_collision(x, y + dash_y)) {
        y += dash_y;
    }
        
    dash_timer--;
        
    if (dash_timer <= 0) {
        dash_end_distance = point_distance(x, y, obj_player.x, obj_player.y);
        
        show_debug_message("BAT >>>>> FIM DASH | Distancia final: " + string(dash_end_distance));
        
        state = EnemyState.CHASE;
        
        attack_cooldown = attack_cooldown_time;
        
        show_debug_message("BAT >>>>> Voltou pro Chase | Cooldown: " + string(attack_cooldown));
    }       
}    