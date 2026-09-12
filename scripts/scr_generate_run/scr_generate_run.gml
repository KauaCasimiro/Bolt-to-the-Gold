function scr_generate_run(room_count){
    var seed = irandom(999999);
    
    random_set_seed(seed);
    
    var sequence = [];
    
    for (var i = 0; i < room_count; i++) {
        array_push(sequence, irandom_range(1, 5));
    }
    
    show_debug_message("Seed: " + string(seed));
    
    for (var i = 0; i < array_length(sequence); i++) {
        show_debug_message("Room " + string(i + 1) + " = Template " + string(sequence[i]));
    }
    
    return sequence;
}