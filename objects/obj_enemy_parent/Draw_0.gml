draw_self();

draw_set_alpha(0.25);

draw_set_color(c_yellow);
draw_circle(x, y, vision_radius, false)

draw_set_alpha(1);
if (state == EnemyState.CHASE && enemy_path != -1) {
    var _target_x = path_get_point_x(enemy_path, path_point);
    var _target_y = path_get_point_y(enemy_path, path_point);

    draw_set_color(c_red);
    draw_circle(_target_x, _target_y, 3, false);
    
    draw_set_color(c_lime);
    
    var points = path_get_number(enemy_path);
    
    for (var i = 0; i < points - 1; i++) {
        
        var x1 = path_get_point_x(enemy_path, i);
        var y1 = path_get_point_y(enemy_path, i);
        
        var x2 = path_get_point_x(enemy_path, i + 1);
        var y2 = path_get_point_y(enemy_path, i + 1);
        
        draw_line_width(x1, y1, x2, y2, 3);
    }
}

var _state_name = "";

switch (state) {
    case EnemyState.IDLE:
        _state_name = "IDLE";
    break;

    case EnemyState.PATROL:
        _state_name = "PATROL";
    break;

    case EnemyState.CHASE:
        _state_name = "CHASE";
    break;

    case EnemyState.ATTACK:
        _state_name = "ATTACK";
    break;
}

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(x, y - 16, _state_name);


if (instance_exists(obj_player)) {

    var _closest_x = clamp(x, obj_player.bbox_left, obj_player.bbox_right);
    var _closest_y = clamp(y, obj_player.bbox_top, obj_player.bbox_bottom);
    
    if (point_distance(x, y, _closest_x, _closest_y) <= vision_radius) {
        
        var p_left   = obj_player.bbox_left;
        var p_right  = obj_player.bbox_right;
        var p_top    = obj_player.bbox_top;
        var p_bottom = obj_player.bbox_bottom;
        
        var draw_vision_line = function(_x1, _y1, _x2, _y2) {
            var _wall = collision_line(_x1, _y1, _x2, _y2, obj_wall, false, true);
            if (_wall == noone) {
                draw_set_color(c_blue); 
            } else {
              draw_set_color(c_red);  
            } 
            draw_line(_x1, _y1, _x2, _y2);
        }
        
        draw_vision_line(x, y, obj_player.x, obj_player.y);
        draw_vision_line(x, y, p_left, p_top);
        draw_vision_line(x, y, p_right, p_top);
        draw_vision_line(x, y, p_left, p_bottom);
        draw_vision_line(x, y, p_right, p_bottom);
    }
}