if count == 600 {
	instance_destroy();
	if global.freeplaymode == true or os_get_config() == "kiosk" or global.main_stats.stage == 3 {
		scr_change_bgm("bgm/ending.it");
		xview = camera_get_view_x(view_camera[1]);
		yview = camera_get_view_y(view_camera[1]);
		var inst = instance_create_layer(xview + 0,yview + 0,"Effects",obj_fade_out);
		inst.target = asset_get_index(room_gameover);
	}
	else {
		xview = camera_get_view_x(view_camera[0]);
		yview = camera_get_view_y(view_camera[0]);
		global.main_stats.stage += 1;
		instance_create_layer(xview + 0,yview + 0,"Effects",obj_transition_in);
	}
}
count++;