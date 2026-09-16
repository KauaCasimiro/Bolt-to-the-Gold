function scr_attack_ranged(){
    sprite_index = player_sprites.shooting[facing_direction];
    
    if (image_index < 1 && !projectile_created) {
        ranged_attack_direction = facing_direction;
        
        var offset = ranged_spawn_offset[ranged_attack_direction];
        
        ranged_spawn_x = x + offset.x;
        ranged_spawn_y = y + offset.y;
        
        show_debug_message(
            "RANGED | Frame 0 | Direção: " +
            string(ranged_attack_direction) +
            " | Spawn: (" +
            string(ranged_spawn_x) +
            ", " +
            string(ranged_spawn_y) +
            ")"
        );
    }
    
    if (image_index >= 1 && !projectile_created) {
        var projectile = instance_create_layer(ranged_spawn_x, ranged_spawn_y, "Instances", obj_projectile);
        
        projectile.direction = projectile_direction[ranged_attack_direction]
        
        projectile_created = true;
        
        show_debug_message(
            "RANGED | Frame 1 | PROJÉTIL CRIADO | Direção: " +
            string(projectile.direction) +
            " | Posição: (" +
            string(projectile.x) +
            ", " +
            string(projectile.y) +
            ")"
        );
    }
}