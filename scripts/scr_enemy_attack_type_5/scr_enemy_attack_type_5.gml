function scr_enemy_attack_type_5(){
    
    if (!attack_started) {
        image_index = 0;
        projectile_created = false;
        attack_started = true;
    }
    
    if (!projectile_created && image_index >= 3) {
        
        var projectile_x;
        var projectile_y;
        
        switch (facing_direction) {
            
            case EnemyDirection.UP:
                projectile_x = x;
                projectile_y = y;
            break;
            
            case EnemyDirection.DOWN:
                projectile_x = x;
                projectile_y = y;
            break;
            
            case EnemyDirection.LEFT:
                projectile_x = x - 3;
                projectile_y = y - 1;
            break;
            
            case EnemyDirection.RIGHT:
                projectile_x = x + 2;
                projectile_y = y - 1;
            break;
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
    
    if (image_index >= image_number - 1) {
        image_index = 0;
        projectile_created = false;
        attack_started = false;
        state = EnemyState.CHASE;
    }
}