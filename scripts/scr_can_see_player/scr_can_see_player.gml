function scr_can_see_player(){
    if (!instance_exists(obj_player)) {
        return false;
    }
    
    if (distance_to_object(obj_player) > obj_enemy_parent.vision_radius) {
        return false;
    }
    
    if (collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, true) != noone) {
        return false;
    }
    return true;
}