randomize();

path_grid = mp_grid_create(0, 0, 20, 18, 8, 8);

template_1 = layer_get_id("Template_1");
template_2 = layer_get_id("Template_2");
template_3 = layer_get_id("Template_3");
template_4 = layer_get_id("Template_4");
template_5 = layer_get_id("Template_5");

current_room = 0;

run_sequence = scr_generate_run(5);
current_template = run_sequence[0];

scr_load_room(current_template);

next_room = function () {
	scr_unload_room();
	
	current_room++;
	
	if (current_room >= array_length(run_sequence)) {
			show_debug_message("End of run!");
			return;
	}
	
	scr_load_room(run_sequence[current_room]);
	
	show_debug_message("Room " + string(current_room + 1) + " - Template " + string(current_template));
}

