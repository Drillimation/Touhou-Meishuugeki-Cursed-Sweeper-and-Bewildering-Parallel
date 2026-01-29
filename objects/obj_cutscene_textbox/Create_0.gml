scene_info = -1;
scene = 0;
timer = 0;
current_scene = 0;
current_scene_array = -1;

cutscene_images = []

name_reveal = false;
actual_name = "";
opac = 0;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);