function scr_player_movement(){ 
    if (input_x != 0 || input_y != 0) { 
        var input_lenght = point_distance(0, 0, input_x, input_y);
           
        input_x /= input_lenght;
        input_y /= input_lenght;
        
        if (input_y < 0) {
            if (input_x < 0) {
                facing_direction = 7; // NW
            } else if (input_x > 0) {
                facing_direction = 1; // NE
            } else {
                facing_direction = 0; // N
            }
        } else if (input_y > 0) {
            if (input_x < 0) {
                facing_direction = 5; // SW
            } else if (input_x > 0) {
                facing_direction = 3; // SE
            } else {
                facing_direction = 4; // S
            }
        } else {
            if (input_x < 0) {
                facing_direction = 6; // W
            } else if (input_x > 0) {
                facing_direction = 2; // E
            }
        }
           
        move_x = lerp(move_x, input_x * max_spd, acceleration);
        move_y = lerp (move_y, input_y * max_spd, acceleration);
    } else {
        move_x = lerp(move_x, 0, _friction);
        move_y = lerp(move_y, 0, _friction);
    }
       
    var next_x = x + move_x;
       
    if (!place_meeting(next_x, y, obj_wall)) { 
        x = next_x;
    }
       
    var next_y = y + move_y;
       
    if (!place_meeting(x, next_y, obj_wall)) { 
        y = next_y;
    }
}