scr_controlls();

switch (state) {
    case PlayerState.IDLE:
        sprite_index = player_sprites.idle[facing_direction];
        
        if (input_x != 0 || input_y != 0) {
            state = PlayerState.WALKING;
        }
        
        if (inpunt_melee) {
            state = PlayerState.ATTACK;
            image_index = 0;
            attack_hit = false;
        }
        
    break;    

    case PlayerState.WALKING:
        
        sprite_index = player_sprites.walking[facing_direction];
        
        scr_player_movement();
        
        if (input_x == 0 && input_y == 0) {
            state = PlayerState.IDLE;
        }
        
        if (inpunt_melee) {
            state = PlayerState.ATTACK;
            image_index = 0;
            attack_hit = false;
        }
        
    break;

    case PlayerState.ATTACK: 
        sprite_index = player_sprites.attacking[facing_direction]; 
        
        scr_player_movement();
        
        if (image_index >= 2 && !attack_hit) { 
            attack_hitbox = instance_create_layer(x, y, "Instances", obj_collisor_attack ); 
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
            state = PlayerState.IDLE; 
            image_index = 0; 
        }
        
    break;

    case PlayerState.DIE:
        
    break;
}