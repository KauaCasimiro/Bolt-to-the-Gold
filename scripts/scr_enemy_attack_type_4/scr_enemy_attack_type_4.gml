function scr_enemy_attack_type_4(){
    if (!projectile_created) {
        
        move_direction = point_direction(
            x,
            y,
            obj_player.x,
            obj_player.y
        );
        
        var projectile_x;
        var projectile_y;
        
        if (move_direction >= 90 && move_direction < 270) {
            projectile_x = x - 7;
            projectile_y = y - 2;
        }
        else {
            projectile_x = x + 7;
            projectile_y = y - 2;
        }
        
        var projectile = instance_create_layer(
            projectile_x,
            projectile_y,
            "Instances",
            obj_projectile_state
        );
        
        projectile.direction = move_direction;
        
        projectile_created = true;
    }
    
    attack_cooldown = attack_cooldown_time;
    projectile_created = false;
    state = EnemyState.CHASE;
    
    show_debug_message("inimigo atacando");
}