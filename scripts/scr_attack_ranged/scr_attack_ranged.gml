function scr_attack_ranged(){
    sprite_index = player_sprites.shooting[facing_direction];
    
    if (image_index < 1 && !projectile_created) {
        ranged_attack_direction = facing_direction;
        
    }
    
    if (image_index >= 1 && !projectile_created) { 
        
        var offset = ranged_spawn_offset[ranged_attack_direction];
        
        ranged_spawn_x = x + offset.x;
        ranged_spawn_y = y + offset.y;
        
        var projectile = instance_create_layer(ranged_spawn_x, ranged_spawn_y, "Instances", obj_projectile);
        
        projectile.direction = projectile_direction[ranged_attack_direction]
        
        ammo--;
        fire_cooldown = fire_cooldown_time;
        
        recoil_direction = projectile_direction[ranged_attack_direction] + 180;
        recoil_speed = recoil_force;
        
        projectile_created = true;
    }
    
    if (image_index >= image_number - 1) { 
        image_index = 0; 
        projectile_created = false; 
        
        if (input_x != 0 || input_y != 0) { 
            state = PlayerState.WALKING;
       } else { 
            state = PlayerState.IDLE; 
        }
    }
}