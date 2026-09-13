function scr_unload_room(){
    for (var yy = 0; yy < 18; yy++) {
		for (var xx = 0; xx < 20; xx++) {
			var tile_data = tilemap_get(obj_game_controller.current_tilemap, xx, yy);
			var tile_index = tile_get_index(tile_data);
			
			var _x = xx * 8;
			var _y = yy * 8;
			
			if (tile_index == 1 || tile_index == 7) {
				var ground = instance_position(_x, _y, obj_ground);
				
				if (ground != noone) {
					with(ground) {
						instance_destroy();
						show_debug_message("Ground destroyed");
					}
				}
			}
			
			if (tile_index == 2) {
				var wall = instance_position(_x, _y, obj_wall);
				
				if (wall != noone) {
					with(wall) {
						instance_destroy();
						show_debug_message("Wall destroyed");
					}
				}
			}
			
			if (tile_index == 4) {
				var door = instance_position(_x, _y, obj_door);
				
				if (door != noone) {
					with(door) {
						instance_destroy();
						show_debug_message("Door destroyed");
					}
				}
			}
			
			if (tile_index == 5) {
				var ground = instance_position(_x, _y, obj_ground);
				
				with(obj_enemy_spawner) {
						instance_destroy();
						show_debug_message("Spawnner destroyed");
					}
				
				if (ground != noone) {
					with(ground) {
						instance_destroy();
					}
				}
			}
			
			if (tile_index == 6) {
				
			}
			
		}
	}
}