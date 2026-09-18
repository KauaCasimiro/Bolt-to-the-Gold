draw_set_color(#3A5068);
draw_rectangle(0, 135, 160, 144, false);

draw_set_color(#CFAB51);

draw_set_font(fnt_gb_hud);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite(spr_hp, 0, 8, 140);
draw_text(14, 140, "X");
draw_text(22, 140, string(obj_player.hp));

draw_sprite(spr_gold, 0, 80, 140);
draw_text(86, 140, "X");
draw_text(94, 140, string(obj_player.gold));

draw_text(152, 140, string(obj_player.ammo));
draw_text(144, 140, "X");
draw_sprite(spr_ammo, 0, 136, 140);