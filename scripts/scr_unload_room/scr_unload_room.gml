function scr_unload_room(){
    for (var yy = 0; yy < 18; yy++) {
        for (var xx = 0; xx < 20; xx++) {
            var tile_data = tilemap_get(obj_game_controller.current_tilemap, xx, yy);
            var tile_index = tile_get_index(tile_data);
            
            var _x = xx * 8;
            var _y = yy * 8;
            
            // GROUND
            if (tile_index == 1 || tile_index == 5 || tile_index == 7 ||
                tile_index >= 14 && tile_index <= 19 ||
                tile_index == 24 || tile_index == 25) {
                
                var ground = instance_position(_x, _y, obj_ground);
                
                if (ground != noone) {
                    with (ground) {
                        instance_destroy();
                    }
                }
            }
            
            // WALL
            if (tile_index == 2 ||
                tile_index >= 8 && tile_index <= 13 ||
                tile_index == 23) {
                
                var wall = instance_position(_x, _y, obj_wall);
                
                if (wall != noone) {
                    with (wall) {
                        instance_destroy();
                    }
                }
            }
            
            // DOOR / PATH
            if (tile_index == 4 ||
                tile_index >= 20 && tile_index <= 22) {
                
                var door = instance_position(_x, _y, obj_door);
                
                if (door != noone) {
                    with (door) {
                        instance_destroy();
                    }
                }
            }
            
            // ENEMY SPAWNER
            if (tile_index == 5) {
                with (obj_enemy_spawner) {
                    instance_destroy();
                    show_debug_message("Spawner destroyed");
                }
            }
        }
    }
}