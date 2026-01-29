/*draw_line_width_color(x,y,
lengthdir_x(sprite_get_width(sprite_index) * image_xscale,direction),
lengthdir_y(sprite_get_width(sprite_index) * image_xscale,direction),2,
make_colour_rgb(255,255,255),
make_colour_rgb(255,255,255))*/
draw_sprite_ext(spr_warning_laser,0,x,y,image_xscale,1,direction,c_white,1)