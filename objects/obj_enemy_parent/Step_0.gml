switch (state) {
	case EnemyState.IDLE:
        //Code to state idle
        state_timer++;
        
        if (state_timer >= 120) {
            state = EnemyState.PATROL;
            state_timer = 0;
        }
        
    break;

    case EnemyState.PATROL:
        //Code to enemy patrolling
        var next_x = x + lengthdir_x(move_spd, move_direction);
        var next_y = y + lengthdir_y(move_spd, move_direction);
        
        if (check_collision(next_x, next_y)) {
            move_direction = irandom(359);
        } else {
            x = next_x;
            y = next_y;
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
        
    break;

    case EnemyState.CHASE:
        //Code to chasing player
    break;

    case EnemyState.ATTACK:
        //Code to attack player
    break;           
}