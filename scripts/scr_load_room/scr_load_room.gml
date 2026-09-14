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
        
	        if (tile_index == 2)
	        {
				instance_create_layer(xx * 8, yy * 8, "Scene", obj_wall);
                mp_grid_add_cell(obj_game_controller.path_grid, xx, yy);
                
                
	        }
        
			if (tile_index == 4) {
				instance_create_layer(xx * 8, yy * 8, "Scene", obj_door);
			}
			
	        if (tile_index == 5) {
	            instance_create_layer(xx * 8 + 4, yy * 8 + 4, "Instances", obj_enemy_spawner);
	            instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
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
}