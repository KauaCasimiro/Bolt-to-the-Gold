draw_set_alpha(0.7);

draw_set_color(c_white);
draw_circle(x, y, spawn_radius, false);

draw_set_color(c_red);

var angle = 0;

while (angle < 360)
{
    // Procura o começo de uma área bloqueada
    if (blocked_distance[angle] != -1)
    {
        var start_angle = angle;

        // Procura o final dessa área contínua
        while (angle < 359 && blocked_distance[angle + 1] != -1)
        {
            angle++;
        }

        var end_angle = angle;

        // Desenha a faixa curva
        draw_primitive_begin(pr_trianglestrip);

        for (var a = start_angle; a <= end_angle; a++)
        {
            var inner = blocked_distance[a];

            var outer_x = x + lengthdir_x(spawn_radius, a);
            var outer_y = y + lengthdir_y(spawn_radius, a);

            var inner_x = x + lengthdir_x(inner, a);
            var inner_y = y + lengthdir_y(inner, a);

            draw_vertex(outer_x, outer_y);
            draw_vertex(inner_x, inner_y);
        }

        draw_primitive_end();
    }

    angle++;
}

draw_set_alpha(1);
draw_set_color(c_white);