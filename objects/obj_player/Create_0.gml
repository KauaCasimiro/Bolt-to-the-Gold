enum PlayerState {
    IDLE,
    WALKING,
    ATTACK,
    DIE
};

enum AttackType {
    MELEE,
    RANGED
}

player_sprites = {
    idle: [
        spr_player_idle_up,
        spr_player_idle_right,
        spr_player_idle_down,
        spr_player_idle_left
    ], 
    
    walking: [ 
        spr_player_walking_up, 
        spr_player_walking_right, 
        spr_player_walking_down, 
        spr_player_walking_left 
    ], 

    attacking: [ 
        spr_player_attacking_up, 
        spr_player_attacking_right, 
        spr_player_attacking_down, 
        spr_player_attacking_left 
    ], 
    
    shooting: [ 
        spr_player_shooting_up, 
        spr_player_shooting_right,
        spr_player_shooting_down, 
        spr_player_shooting_left 
    ]
};

sprite_direction = 0;
facing_direction = 0;

state = PlayerState.IDLE;
attack_type = AttackType.MELEE;

input_x = 0;
input_y = 0;

inpunt_melee = false;
input_ranged = false;

move_x = 0;
move_y = 0;

acceleration = 0.15;
_friction = 0.20;

max_spd = 1;

hp = 6;
gold = 0;

attack_timer = 0;
attack_hit = false;
attack_hitbox = noone;

ranged_spawn_x = 0;
ranged_spawn_y = 0;
ranged_attack_direction = 0;
projectile_created = false;

ranged_spawn_offset = [
    {x: -4,  y: 9},   // N
    {x: 11,  y: 4},  // NE
    {x: 11, y: 4},  // E
    {x: 11,  y: 4},  // SE
    {x: -4,  y: 13},  // S
    {x: 4,  y: 4},  // SW
    {x: 4,  y: 4},  // W
    {x: 4,  y: 4}   // NW
];

projectile_direction = [
    90,  // N
    45,  // NE
    0,   // E
    315, // SE
    270, // S
    225, // SW
    180, // W
    135  // NW
];

ammo = 6;
max_ammo = 6;

fire_cooldown = 0;
fire_cooldown_time = 10;

reload_cooldown = 0;
reload_cooldown_time = 60;
recoil_force = 2;
recoil_speed = 0;
recoil_friction = 0.2;

damage_flash = 0;

function take_damage(source_x, source_y, _recoil_force) {
    hp -= 1;
    
    damage_flash = 18;

    var damage_direction = point_direction(
        x,
        y,
        source_x,
        source_y
    );

    recoil_direction = damage_direction + 180;
    recoil_speed = _recoil_force;

    if (damage_direction >= 337.5 || damage_direction < 22.5) {
        facing_direction = 2; // E
    }
    else if (damage_direction < 67.5) {
        facing_direction = 3; // SE
    }
    else if (damage_direction < 112.5) {
        facing_direction = 0; // S
    }
    else if (damage_direction < 157.5) {
        facing_direction = 5; // SW
    }
    else if (damage_direction < 202.5) {
        facing_direction = 6; // W
    }
    else if (damage_direction < 247.5) {
        facing_direction = 7; // NW
    }
    else if (damage_direction < 292.5) {
        facing_direction = 4; // N
    }
    else {
        facing_direction = 1; // NE
    }
    
}