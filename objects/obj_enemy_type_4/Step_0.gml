// Inherit the parent event
event_inherited();

if (place_meeting(x, y, obj_player)) {
    obj_player.take_damage(x, y, obj_player.recoil_force * 2);
}

