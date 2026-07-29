xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

script_execute(state)

x = xview + x_pos;
y = yview + y_pos;

if count == 300 {
	instance_destroy();
	if global.freeplaymode == true {
		instance_create_depth(0,0,0,obj_stage_clear);
	}
	else {
		instance_create_depth(0,0,0,obj_game_clear);
	}
}

count++;
count2++;