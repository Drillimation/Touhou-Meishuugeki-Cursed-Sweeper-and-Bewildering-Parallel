if count == 900 {
	instance_destroy();
	if global.replay_mode == true {
		scr_stop_bgm();
		xview = camera_get_view_x(view_camera[1]);
		yview = camera_get_view_y(view_camera[1]);
		var inst = instance_create_layer(xview + 0,yview + 0,"Effects",obj_fade_out);
		inst.target = asset_get_index(room_replay_menu);
	}
	else {
		scr_change_bgm("bgm/ending.it");
		xview = camera_get_view_x(view_camera[1]);
		yview = camera_get_view_y(view_camera[1]);
		var inst = instance_create_layer(xview + 0,yview + 0,"Effects",obj_fade_out);
		inst.target = asset_get_index(room_ending);
	}
}
count++;