//This block is intended to be for customizing the game over sequence.
xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

str = "GAME OVER"

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}