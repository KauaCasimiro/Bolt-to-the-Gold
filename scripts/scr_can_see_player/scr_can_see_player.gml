function scr_can_see_player(){
    if (!instance_exists(obj_player)) {
        return false;
    }
    
    var _closest_x = clamp(x, obj_player.bbox_left, obj_player.bbox_right);
    var _closest_y = clamp(y, obj_player.bbox_top, obj_player.bbox_bottom);
    
    var _real_distance = point_distance(x, y, _closest_x, _closest_y);
    
    if (_real_distance > vision_radius) {
        return false;
    }
    
    var p_left   = obj_player.bbox_left;
    var p_right  = obj_player.bbox_right;
    var p_top    = obj_player.bbox_top;
    var p_bottom = obj_player.bbox_bottom;
    
    var see_top_left     = (collision_line(x, y, p_left,  p_top,    obj_wall, false, true) == noone);
    var see_top_right    = (collision_line(x, y, p_right, p_top,    obj_wall, false, true) == noone);
    var see_bottom_left  = (collision_line(x, y, p_left,  p_bottom, obj_wall, false, true) == noone);
    var see_bottom_right = (collision_line(x, y, p_right, p_bottom, obj_wall, false, true) == noone);
    var see_center       = (collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, true) == noone);
    
    if (see_center || see_top_left || see_top_right || see_bottom_left || see_bottom_right) {
        return true;
    }
    
    return false;
}