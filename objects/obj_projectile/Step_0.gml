show_debug_message(
    "PROJECTILE | Direção atual: " +
    string(direction)
);

x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

image_angle = direction;