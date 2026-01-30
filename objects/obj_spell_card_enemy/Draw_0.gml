xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

//Cut in
var dist = point_distance(xview + 128,yview + 0,xview + draw_x,yview + draw_y);
draw_set_alpha(1 - (dist / 144))
draw_sprite(sprite_index,image_index,xview + draw_x,yview + draw_y);
draw_set_alpha(1)