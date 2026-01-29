fmod_system_update();

if global.bgm_fadeout == true {
	if !variable_instance_exists(self,"current_volume") {
		current_volume = global.game_options.bgm_volume;
	}
	if current_volume != 0 {
		current_volume -= 0.01;
		current_volume = clamp(current_volume,0,1)
		for(var i = 0; i < 12; i++) {
			fmod_sound_set_music_channel_volume(global.bgm,i,current_volume);
		}
	}
	else {
		global.bgm_channel = undefined;
		global.current_bgm = undefined;
		struct_remove(self,"current_volume");
		global.bgm_fadeout = false;
	}
}