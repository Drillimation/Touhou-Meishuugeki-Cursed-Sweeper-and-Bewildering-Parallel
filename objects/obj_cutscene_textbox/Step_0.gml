xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

if array_length(current_scene_array) >= 1 {
	script_execute_ext(asset_get_index(current_scene[0]),current_scene_array)
}
else {
	script_execute_ext(asset_get_index(current_scene[0]));
}

if name_reveal == true {
	opac += 0.01;
	opac = clamp(opac,0,1);
}

/*if room == room_intro {
	gamepad_set_button_threshold(0,0.5);
	if keyboard_check_pressed(vk_anykey) or 
	gamepad_button_check_pressed(0,gp_face1) or
	gamepad_button_check_pressed(0,gp_face2) or
	gamepad_button_check_pressed(0,gp_face3) or
	gamepad_button_check_pressed(0,gp_face4) or
	gamepad_button_check_pressed(0,gp_start) or
	gamepad_button_check_pressed(0,gp_select) or
	gamepad_button_check_pressed(0,gp_shoulderl) or
	gamepad_button_check_pressed(0,gp_shoulderlb) or
	gamepad_button_check_pressed(0,gp_shoulderr) or
	gamepad_button_check_pressed(0,gp_shoulderrb) {
		scr_one_channel_sound(snd_menuconfirm);
		instance_destroy(obj_textbox);
		instance_destroy(obj_cutscene_fade_in);
		instance_destroy(obj_cutscene_fade_out)
		instance_destroy();
		inst = instance_create_depth(0,0,0,obj_fade_out);
		inst.target = asset_get_index(room_title);
	}
}*/