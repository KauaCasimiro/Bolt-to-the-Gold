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