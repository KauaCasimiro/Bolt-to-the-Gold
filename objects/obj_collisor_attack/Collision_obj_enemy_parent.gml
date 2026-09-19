other.take_damage(
    x,
    y,
    obj_player.recoil_force
);

if (other.hp <= 0) {
    obj_player.gold++;
    instance_destroy(other);
}