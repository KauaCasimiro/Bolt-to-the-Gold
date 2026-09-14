function scr_enemy_path(star_x, star_y, target_x, target_y){
    var path = path_add();
    
    var found = mp_grid_path (obj_game_controller.path_grid, path, star_x, star_y, target_x, target_y, true);
    
    if (!found) {
        path_delete(path);
        return -1;
    }
    
    return path;
}