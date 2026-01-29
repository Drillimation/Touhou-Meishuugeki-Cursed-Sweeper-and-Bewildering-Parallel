xview = camera_get_view_x(view_camera[1]);
yview = camera_get_view_y(view_camera[1]);

_bri = round(global.game_options.border_brightness * 255);

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}