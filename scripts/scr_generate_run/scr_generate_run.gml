function scr_generate_run(room_count){
    var seed = irandom(999999);
    
    random_set_seed(seed);
    
    var sequence = [];
    
    for (var i = 0; i < room_count; i++) {
        
        var template = irandom_range(1, 5)
        
        if (i > 0) {
            while (template == sequence[i - 1]) {
            	template = irandom_range(1, 5)
            }
        }
        
        array_push(sequence, template);
    }
    
    show_debug_message("Seed: " + string(seed));
    
    for (var i = 0; i < array_length(sequence); i++) {
        show_debug_message("Room " + string(i + 1) + " = Template " + string(sequence[i]));
    }
    
    return sequence;
}