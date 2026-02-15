scr_get_input_menu();

if (a_button) {
	scr_one_channel_sound(snd_menuconfirm);
	instance_destroy();
	//scr_stop_bgm();
	instance_create_depth(656,32,0,obj_stage_select)
	//room_goto(room_transition_1);
}
if keyboard_check_pressed(vk_f1) {
	instance_destroy();
	scr_stop_bgm();
	//var inst = instance_create_depth(0,0,0,obj_fade_out);
	//inst.target = asset_get_index(room_transition_1);
	room_goto(room_debug);
}
if count == 1800 {
	instance_destroy();
	var inst = instance_create_depth(0,0,0,obj_fade_out);
	inst.target = asset_get_index(room_title);
}
count++;