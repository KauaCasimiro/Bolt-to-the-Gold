function scr_generate_enemies(amount){
    var spawners = [];
    
    with (obj_enemy_spawner) {
        array_push(spawners, id);
    }
    
    if (array_length(spawners) == 0) {
        show_debug_message("No enemy spawners found");
        
        return;
    }
    
    var spawner_index = 0;
    
    for (var i = 0; i < amount; i++) {
       
        var spawner = spawners[spawner_index];
        
        var spawn_x;
        var spawn_y;
        var valid_position = false;
        
        for (var attempt = 0; attempt < 30; attempt++) {
            var angle = irandom(359);
            var max_distance = spawner.spawn_radius;
            
            if (spawner.blocked_distance[angle] != -1) {
                max_distance = spawner.blocked_distance[angle];
            }
            
            if (max_distance <= 0) {
                continue;
            }
            
            var distance = random(max_distance);
            
            spawn_x = spawner.x + lengthdir_x(distance, angle);
            spawn_y = spawner.y + lengthdir_y(distance, angle);
            
            if (!position_meeting(spawn_x, spawn_y, obj_wall)) {
                valid_position = true;
                break;
            }
        }
        
        if (valid_position) {
            var enemy_type = irandom(2);
            
            switch (enemy_type) {
            	
                case 0:
                    instance_create_layer( spawn_x, spawn_y, "Instances", obj_enemy_type_1);
                break;
            
                case 1:
                    instance_create_layer( spawn_x, spawn_y, "Instances", obj_enemy_type_2);
                break;
            
                case 2:
                    instance_create_layer( spawn_x, spawn_y, "Instances", obj_enemy_type_3);
                break;        
            }
        } else {
            show_debug_message("Could not find valid spawn position for enemy " + string (i + 1));
        }
        
        spawner_index++;
        
        if (spawner_index >= array_length(spawners)) {
            spawner_index = 0;
        }
    }
}