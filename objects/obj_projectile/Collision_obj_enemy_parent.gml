other.take_damage(
    x,
    y,
    obj_player.recoil_force * 0
);

if (other.hp <= 0) {
    obj_player.gold++;
    instance_destroy();
    instance_destroy(other);
}