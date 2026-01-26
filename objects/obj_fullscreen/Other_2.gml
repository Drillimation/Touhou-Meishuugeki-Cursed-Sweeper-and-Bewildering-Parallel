global.fmod = fmod_system_create();
fmod_system_init(512,FMOD_INIT.NORMAL);
global.bgm = undefined;
global.bgm_channel = undefined;
global.current_bgm = undefined;

game_set_speed(60, gamespeed_fps);
//audio_group_load(audiogroup_default);

if !file_exists("options.save") {
	global.game_options = {
		language : 0,
		bgm_volume : 0.8,
		sfx_volume : 0.8,
		fullscreen : 1,
		stages_cleared : 0
	}
	scr_change_language();
	instance_create_depth(0,0,0,obj_language_select_first);
	scr_json_save_file(global.game_options,"options.save")
	audio_group_set_gain(audiogroup_default,global.game_options.sfx_volume,0);
}
else {
	global.game_options = scr_json_load_file("options.save");
	scr_change_language();
	audio_group_set_gain(audiogroup_default,global.game_options.sfx_volume,0);
	room_goto(room_intro);
}