/// @description

draw_self();

draw_set_font(fHotKey);
draw_set_color(c_black);

draw_text(x+32, y-32, string(hotKey));

//reset defaults
draw_set_font(fDefault);
draw_set_color(c_white);
