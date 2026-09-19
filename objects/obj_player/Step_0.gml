scr_controlls();

// FIRE COOLDOWN

if (fire_cooldown > 0) {
    fire_cooldown--;
}


// RELOAD

if (ammo <= 0 && reload_cooldown <= 0) {
    reload_cooldown = reload_cooldown_time;
}

if (reload_cooldown > 0) {
    reload_cooldown--;

    if (reload_cooldown <= 0) {
        ammo = max_ammo;
    }
}

// RECOIL

if (recoil_speed > 0) {
    
    var recoil_x = lengthdir_x(recoil_speed, recoil_direction);
    var recoil_y = lengthdir_y(recoil_speed, recoil_direction);

    // Horizontal
    if (place_meeting(x + recoil_x, y, obj_wall)) {
        
        while (!place_meeting(x + sign(recoil_x), y, obj_wall)) {
            x += sign(recoil_x);
        }
        
    }
    else {
        x += recoil_x;
    }

    // Vertical
    if (place_meeting(x, y + recoil_y, obj_wall)) {
        
        while (!place_meeting(x, y + sign(recoil_y), obj_wall)) {
            y += sign(recoil_y);
        }
        
    }
    else {
        y += recoil_y;
    }

    recoil_speed = lerp(recoil_speed, 0, recoil_friction);
}


// DIREÇÃO DO SPRITE

if (facing_direction == 0) {
    sprite_direction = 0; // N
}
else if (facing_direction == 1 || facing_direction == 2 || facing_direction == 3) {
    sprite_direction = 1; // E
}
else if (facing_direction == 4) {
    sprite_direction = 2; // S
}
else {
    sprite_direction = 3; // W
}

if (facing_direction == 0) {
    sprite_direction = 0; // N
}
else if (facing_direction == 1 || facing_direction == 2 || facing_direction == 3) {
    sprite_direction = 1; // E
}
else if (facing_direction == 4) {
    sprite_direction = 2; // S
}
else {
    sprite_direction = 3; // W
}

if (damage_flash > 0) {
    damage_flash--;
    
    if (damage_flash mod 2 == 0) {
        image_alpha = 0;
    }
    else {
        image_alpha = 1;
    }
}
else {
    image_alpha = 1;
}

switch (state) {
    case PlayerState.IDLE:
        sprite_index = player_sprites.idle[sprite_direction];
        
        if (input_x != 0 || input_y != 0) {
            state = PlayerState.WALKING;
        }
        
        if (inpunt_melee) {
            attack_type = AttackType.MELEE
            state = PlayerState.ATTACK;
            image_index = 0;
            attack_hit = false;
        }
        
        if (input_ranged && fire_cooldown <= 0 && ammo > 0) {
            attack_type = AttackType.RANGED;
            state = PlayerState.ATTACK;
            image_index = 0;
            projectile_created = false;
        }
        
    break;    

    case PlayerState.WALKING:
        
        sprite_index = player_sprites.walking[sprite_direction];
        
        scr_player_movement();
        
        if (input_x == 0 && input_y == 0) {
            state = PlayerState.IDLE;
        }
        
        if (inpunt_melee && fire_cooldown <= 0 && ammo > 0) {
            attack_type = AttackType.MELEE
            state = PlayerState.ATTACK;
            image_index = 0;
            attack_hit = false;
        }
        
        if (input_ranged) {
            attack_type = AttackType.RANGED;
            state = PlayerState.ATTACK;
            image_index = 0;
            projectile_created = false;
        }
        
    break;

    case PlayerState.ATTACK: 
        
        scr_player_movement();
        
        switch (attack_type) {
        	case AttackType.MELEE: 
                scr_attack_melee();
            break;
        
            case AttackType.RANGED:
                scr_attack_ranged();
            break;    
        }
        
    break;

    case PlayerState.DIE:
        
    break;
}

// RECOIL

if (recoil_speed > 0) {
    
    var recoil_x = lengthdir_x(
        recoil_speed,
        recoil_direction
    );
    
    var recoil_y = lengthdir_y(
        recoil_speed,
        recoil_direction
    );

    // Horizontal
    if (place_meeting(x + recoil_x, y, obj_wall)) {
        
        while (!place_meeting(x + sign(recoil_x), y, obj_wall)) {
            x += sign(recoil_x);
        }
        
    } else {
        x += recoil_x;
    }
    
    // Vertical
    if (place_meeting(x, y + recoil_y, obj_wall)) {
        
        while (!place_meeting(x, y + sign(recoil_y), obj_wall)) {
            y += sign(recoil_y);
        }
        
    } else {
        y += recoil_y;
    }

    recoil_speed = lerp(
        recoil_speed,
        0,
        recoil_friction
    );
    
    if (recoil_speed < 0.05) {
        recoil_speed = 0;
    }
}