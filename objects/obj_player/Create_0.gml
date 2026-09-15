enum PlayerState {
    IDLE,
    WALKING,
    ATTACK,
    DIE
};

player_sprites = {
    idle: [
        spr_player_idle_up,
        spr_player_idle_up_right,
        spr_player_idle_right,
        spr_player_idle_down_right,
        spr_player_idle_down,
        spr_player_idle_down_left,
        spr_player_idle_left,
        spr_player_idle_up_left
    ],

    walking: [
        spr_player_walking_up,
        spr_player_walking_up_right,
        spr_player_walking_right,
        spr_player_walking_down_right,
        spr_player_walking_down,
        spr_player_walking_down_left,
        spr_player_walking_left,
        spr_player_walking_up_left
    ]
};

state = PlayerState.IDLE;

input_x = 0;
input_y = 0;

inpunt_melee = false;
input_ranged = false;

move_x = 0;
move_y = 0;

acceleration = 0.15;
_friction = 0.20;

max_spd = 1;

facing_direction = 0;

hp = 3;

attack_timer = 0;