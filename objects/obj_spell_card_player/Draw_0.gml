xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

var dist = point_distance(xview + 0,yview + 0,draw_x,draw_y);
draw_set_alpha(1 - (dist / 144))
draw_sprite(sprite_index,image_index,xview + draw_x,yview + draw_y);
draw_set_alpha(1)