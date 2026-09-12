randomize();

template_1 = layer_get_id("Template_1");
template_2 = layer_get_id("Template_2");
template_3 = layer_get_id("Template_3");
template_4 = layer_get_id("Template_4");
template_5 = layer_get_id("Template_5");

current_room = 0;

run_sequence = scr_generate_run(5);
current_template = run_sequence[0];



load_room = function(template) {
	layer_set_visible(template_1, false);
	layer_set_visible(template_2, false);
	layer_set_visible(template_3, false);
	layer_set_visible(template_4, false);
	layer_set_visible(template_5, false);

	switch (template) {
		case 1: 
			layer_set_visible(template_1, true);
			current_tilemap = layer_tilemap_get_id(template_1);
			break;
		
		case 2: 
			layer_set_visible(template_2, true);
			current_tilemap = layer_tilemap_get_id(template_2);
			break;
		
		case 3: 
			layer_set_visible(template_3, true);
			current_tilemap = layer_tilemap_get_id(template_3);
			break;
		
		case 4: 
			layer_set_visible(template_4, true);
			current_tilemap = layer_tilemap_get_id(template_4);
			break;
		
		case 5: 
			layer_set_visible(template_5, true);
			current_tilemap = layer_tilemap_get_id(template_5);
			break;
	}
	
	current_template = template;
	
	show_debug_message("Template sorteado: " + string(current_template));

	for (var yy = 0; yy < 18; yy++) {
	    for (var xx = 0; xx < 20; xx++) {
	        var tile_data = tilemap_get(current_tilemap, xx, yy);
	        var tile_index = tile_get_index(tile_data);

	        if (tile_index == 1) {
	            instance_create_layer(xx * 8, yy * 8, "Scene", obj_ground)
	        }
        
	        if (tile_index == 2)
	        {
				instance_create_layer(xx * 8, yy * 8, "Scene", obj_wall);
	        }
        
			if (tile_index == 4) {
				instance_create_layer(xx * 8, yy * 8, "Scene", obj_door);
			}
			
	        if (tile_index == 5) {
	            var spawner = instance_create_layer(xx * 8 + 4, yy * 8 + 4, "Instances", obj_enemy_spawner);
				
				show_debug_message("Spawner criado: " + string(spawner));

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

load_room(current_template)

unload_room = function () {
	for (var yy = 0; yy < 18; yy++) {
		for (var xx = 0; xx < 20; xx++) {
			var tile_data = tilemap_get(current_tilemap, xx, yy);
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
				//var spawner = instance_position(_x + 4, _y + 4, obj_enemy_spawner);
				var ground = instance_position(_x, _y, obj_ground);
				
				with(obj_enemy_spawner) {
						instance_destroy();
						show_debug_message("Spawnner destroyed");
					}
				/*if (obj_enemy_spawner != noone) {
					
				}*/
				
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

next_room = function () {
	unload_room();
	
	current_room++;
	
	if (current_room >= array_length(run_sequence)) {
			show_debug_message("End of run!");
			return;
	}
	
	load_room(run_sequence[current_room]);
	
	show_debug_message("Room " + string(current_room + 1) + " - Template " + string(current_template));
}