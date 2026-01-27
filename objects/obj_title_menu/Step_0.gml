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
	instance_destroy();
	inst = instance_create_depth(0,0,0,obj_fade_out);
	inst.target = asset_get_index(room_setup);
}

if count == 1800 {
	scr_stop_bgm();
	room_goto(room_intro);
}
count++