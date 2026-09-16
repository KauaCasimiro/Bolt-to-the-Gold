scr_controlls();

switch (state) {
    case PlayerState.IDLE:
        sprite_index = player_sprites.idle[facing_direction];
        
        if (input_x != 0 || input_y != 0) {
            state = PlayerState.WALKING;
        }
        
        if (inpunt_melee) {
            attack_type = AttackType.MELEE
            state = PlayerState.ATTACK;
            image_index = 0;
            attack_hit = false;
        }
        
        if (input_ranged) {
            attack_type = AttackType.RANGED;
            state = PlayerState.ATTACK;
            image_index = 0;
            projectile_created = false;
        }
        
    break;    

    case PlayerState.WALKING:
        
        sprite_index = player_sprites.walking[facing_direction];
        
        scr_player_movement();
        
        if (input_x == 0 && input_y == 0) {
            state = PlayerState.IDLE;
        }
        
        if (inpunt_melee) {
            attack_type = AttackType.MELEE
            state = PlayerState.ATTACK;
            image_index = 0;
            attack_hit = false;
        }
        
        if (input_ranged) {
            attack_type = AttackType.RANGED;
            state = PlayerState.ATTACK;
            image_index = 0;
            projectile_created = false;
        }
        
    break;

    case PlayerState.ATTACK: 
        
        switch (attack_type) {
        	case AttackType.MELEE: 
                scr_attack_melee();
            break;
        
            case AttackType.RANGED:
                scr_attack_ranged();
            break;    
        }
        
    break;

    case PlayerState.DIE:
        
    break;
}