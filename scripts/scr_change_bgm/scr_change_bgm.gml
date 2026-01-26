function scr_change_bgm(_bgm){
	if fmod_channel_control_is_playing(global.bgm_channel) && global.current_bgm != _bgm {
		fmod_channel_control_stop(global.bgm_channel);
		global.bgm_channel = undefined;
		global.current_bgm = undefined;
	}
	if global.bgm_channel == undefined || !fmod_channel_control_is_playing(global.bgm_channel) || fmod_channel_get_current_sound(global.bgm_channel) != global.bgm {
		global.bgm = fmod_system_create_sound(fmod_path_bundle(_bgm),FMOD_MODE.LOOP_NORMAL);
		global.current_bgm = _bgm;
		global.bgm_channel = fmod_system_play_sound(global.bgm,false);
		for(var i = 0; i < 12; i++) {
			fmod_sound_set_music_channel_volume(global.bgm,i,global.game_options.bgm_volume);
		}
	}
}

function scr_stop_bgm(){
	if fmod_channel_control_is_playing(global.bgm_channel) {
		fmod_channel_control_stop(global.bgm_channel);
		global.bgm_channel = undefined;
		global.current_bgm = undefined;
	}
}