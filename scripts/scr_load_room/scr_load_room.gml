function scr_load_room(template){
    layer_set_visible(obj_game_controller.template_1, false);
    layer_set_visible(obj_game_controller.template_2, false);
    layer_set_visible(obj_game_controller.template_3, false);
    layer_set_visible(obj_game_controller.template_4, false);
    layer_set_visible(obj_game_controller.template_5, false);
    
    switch (template) {
    	case 1:
            layer_set_visible(obj_game_controller.template_1, true);
            obj_game_controller.current_tilemap = layer_tilemap_get_id(obj_game_controller.template_1); 
        break;
    
        case 2:
            layer_set_visible(obj_game_controller.template_2, true);
            obj_game_controller.current_tilemap = layer_tilemap_get_id(obj_game_controller.template_2);
        break;
    
        case 3:
            layer_set_visible(obj_game_controller.template_3, true);
            obj_game_controller.current_tilemap = layer_tilemap_get_id(obj_game_controller.template_3);
        break;
    
        case 4:
            layer_set_visible(obj_game_controller.template_4, true);
            obj_game_controller.current_tilemap = layer_tilemap_get_id(obj_game_controller.template_4);
        break;
    
        case 5:
            layer_set_visible(obj_game_controller.template_5, true);
            obj_game_controller.current_tilemap = layer_tilemap_get_id(obj_game_controller.template_5);
        break;
    }
    
    obj_game_controller.current_template = template;
    
    show_debug_message("Choosed template: " + string(obj_game_controller.current_template));
    
    mp_grid_clear_all(obj_game_controller.path_grid);
    
    for (var yy = 0; yy < 18; yy++) {
	    for (var xx = 0; xx < 20; xx++) {
	        var tile_data = tilemap_get(obj_game_controller.current_tilemap, xx, yy);
	        var tile_index = tile_get_index(tile_data);

	        if (tile_index == 1) {
	            instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
	        }
            
            if (tile_index == 14) {
	            var ground_corner_left_up = instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
                ground_corner_left_up.sprite_index = spr_ground_corner_left_up;
	        }
            
            if (tile_index == 15) {
	            var ground_corner_left_down = instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
                ground_corner_left_down.sprite_index = spr_ground_corner_left_down;
	        }
            
            if (tile_index == 16) {
	            var ground_corner_right_up = instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
                ground_corner_right_up.sprite_index = spr_ground_corner_right_up;
	        }
            
            if (tile_index == 17) {
	            var ground_corner_right_down = instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
                ground_corner_right_down.sprite_index = spr_ground_corner_right_down;
	        }
            
            if (tile_index == 18) {
	            var ground_up = instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
                ground_up.sprite_index = spr_ground_up;
	        }
            
            if (tile_index == 19) {
	            var ground_down = instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
                ground_down.sprite_index = spr_ground_down;
	        }
            
            if (tile_index == 24) {
	            var ground_right = instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
                ground_right.sprite_index = spr_ground_corner_right_edge;
	        }
            
            if (tile_index == 25) {
	            var ground_left = instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
                ground_left.sprite_index = spr_ground_corner_left_edge;
	        }
        
	        if (tile_index == 2)
	        {
				var wall_left = instance_create_layer(xx * 8, yy * 8, "Scene", obj_wall);
                wall_left.sprite_index = spr_wall_edge_left;
                mp_grid_add_cell(obj_game_controller.path_grid, xx, yy);
                
                /*mp_grid_add_cell(obj_game_controller.path_grid, xx + 1, yy + 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx - 1, yy - 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx + 1, yy - 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx - 1, yy + 1);*/
                
	        }
            
            if (tile_index == 3) {
                var chest = instance_create_layer(xx * 8, yy * 8, "Scene", obj_chest);
                //chest.sprite_index = spr
                image_speed = 0;
            }
            
            if (tile_index == 8) {
                var wall_corner_right_up = instance_create_layer(xx * 8, yy * 8, "Scene", obj_wall);
                wall_corner_right_up.sprite_index = spr_wall_corner_right_up;
                
                mp_grid_add_cell(obj_game_controller.path_grid, xx + 1, yy + 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx - 1, yy - 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx + 1, yy - 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx - 1, yy + 1);
            }
            
            if (tile_index == 9) {
                var wall_corner_right_down = instance_create_layer(xx * 8, yy * 8, "Scene", obj_wall);
                wall_corner_right_down.sprite_index = spr_wall_corner_right_down;
                
                mp_grid_add_cell(obj_game_controller.path_grid, xx + 1, yy + 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx - 1, yy - 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx + 1, yy - 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx - 1, yy + 1);
            }
            
            if (tile_index == 10) {
                var wall_corner_left_up = instance_create_layer(xx * 8, yy * 8, "Scene", obj_wall);
                wall_corner_left_up.sprite_index = spr_wall_corner_left_up;
                
                mp_grid_add_cell(obj_game_controller.path_grid, xx + 1, yy + 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx - 1, yy - 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx + 1, yy - 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx - 1, yy + 1);
            }
            
            if (tile_index == 11) {
                var wall_corner_left_down = instance_create_layer(xx * 8, yy * 8, "Scene", obj_wall);
                wall_corner_left_down.sprite_index = spr_wall_corner_left_down;
                
                mp_grid_add_cell(obj_game_controller.path_grid, xx + 1, yy + 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx - 1, yy - 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx + 1, yy - 1);
                mp_grid_add_cell(obj_game_controller.path_grid, xx - 1, yy + 1);
            }
            
            if (tile_index == 12) {
                var wall_up = instance_create_layer(xx * 8, yy * 8, "Scene", obj_wall);
                wall_up.sprite_index = spr_wall_up;
            }
            
            if (tile_index == 13) {
                var wall_down = instance_create_layer(xx * 8, yy * 8, "Scene", obj_wall);
                wall_down.sprite_index = spr_wall_down;
            }
            
            if (tile_index == 23) {
                var wall_right = instance_create_layer(xx * 8, yy * 8, "Scene", obj_wall);
                wall_right.sprite_index = spr_wall_edge_right;
            }
            
        
			if (tile_index == 4) {
				instance_create_layer(xx * 8, yy * 8, "Scene", obj_door);
			}
            
            if (tile_index == 20) {
				var path_right = instance_create_layer(xx * 8, yy * 8, "Scene", obj_door);
                path_right.sprite_index = spr_path_right;
			}
            
            if (tile_index == 21) {
				var path_left = instance_create_layer(xx * 8, yy * 8, "Scene", obj_door);
                path_left.sprite_index = spr_path_left;
			}
            
            if (tile_index == 22) {
				var path_down = instance_create_layer(xx * 8, yy * 8, "Scene", obj_door);
                path_down.sprite_index = spr_path_down;
			}
			
	        if (tile_index == 5) {
	            instance_create_layer(xx * 8 + 4, yy * 8 + 4, "Instances", obj_enemy_spawner);
	            instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
	        }
            
            if (tile_index == 6) {
                instance_create_layer(xx * 8, yy * 8, "Scene", obj_trap);
                mp_grid_add_cell(obj_game_controller.path_grid, xx, yy);
            }
        
	        if (tile_index == 7)
	        {
				if (!instance_exists(obj_player)) {
					instance_create_layer(xx * 8, yy * 8, "Instances", obj_player);
				} else {
					obj_player.x = xx * 8;
					obj_player.y = yy * 8;
				}
	            
	            instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
	        }
	    }
	}
    
    var amount = irandom_range(4, 12)
    scr_generate_enemies(0);
}