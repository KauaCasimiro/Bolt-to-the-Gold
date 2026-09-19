if(instance_exists(obj_enemy_parent)) {
    var push_x = sign(obj_player.move_x);
    var push_y = sign(obj_player.move_y);
    
    if (push_x == 0 && push_y == 0) {
        push_y = 1;
    }
    
    while (place_meeting(x, y, obj_player)) {
        obj_player.x -= push_x;
        obj_player.y -= push_y;
    }
} else {
    obj_game_controller.next_room();
}
