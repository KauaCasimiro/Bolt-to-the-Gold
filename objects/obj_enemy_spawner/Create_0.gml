spawn_radius = 20;

blocked_distance = array_create(360, -1);

current_tilemap = obj_game_controller.current_tilemap;

for (var angle = 0; angle < 360; angle += 1)
{
    for (var dist = 0; dist <= spawn_radius; dist += 1)
    {
        var px = x + lengthdir_x(dist, angle);
        var py = y + lengthdir_y(dist, angle);

        var tile_data = tilemap_get_at_pixel(current_tilemap, px, py);
        var tile_index = tile_get_index(tile_data);

        if (tile_index == 2 || tile_index == 6)
        {
            blocked_distance[angle] = dist;
            break;
        }
    }
}