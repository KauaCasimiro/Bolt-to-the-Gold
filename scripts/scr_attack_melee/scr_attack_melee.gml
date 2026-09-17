function scr_attack_melee(){
     sprite_index = player_sprites.attacking[facing_direction];

    if (image_index >= 2 && !attack_hit) {

        attack_hitbox = instance_create_layer(
            x,
            y,
            "Instances",
            obj_collisor_attack
        );

        attack_hitbox.image_index = facing_direction;

        attack_hit = true;
    }

    if (instance_exists(attack_hitbox)) {
        attack_hitbox.x = x;
        attack_hitbox.y = y;
    }

    if (image_index >= 3 && instance_exists(attack_hitbox)) {

        with (attack_hitbox) {
            instance_destroy();
        }

        attack_hitbox = noone;
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