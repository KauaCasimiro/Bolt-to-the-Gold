scr_controlls();

switch (state) {
    case PlayerState.IDLE:
        sprite_index = player_sprites.idle[facing_direction];
        
        if (input_x != 0 || input_y != 0) {
            state = PlayerState.WALKING;
        }
    break;    

    case PlayerState.WALKING:
        
        sprite_index = player_sprites.walking[facing_direction];
        
        scr_player_movement();
        
        if (input_x == 0 && input_y == 0) {
            state = PlayerState.IDLE;
        }
    break;

    case PlayerState.ATTACK:
        
    break;

    case PlayerState.DIE:
        
    break;
}