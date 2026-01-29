function sound_ObjSound_Play(_sound) {
	/// @function sound_ObjSound_Play(_sound)
	/// @description Plays a sound file from the given name. If the designated sound is already playing, it will be stopped first before playing at the beginning. Also returns the ID of the sound.
	/// @param {real} _sound The name of the sound file to play.
	
	if audio_is_playing(_sound) {
		audio_stop_sound(_sound)
	}
	var sound_id = audio_play_sound(_sound,10,false,0.5);
	return sound_id
}

function sound_ObjSound_Stop(_sound) {
	/// @function sound_ObjSound_Stop(_sound)
	/// @description Stops the playback of a sound file from the given name.
	/// @param {real} _sound The name of the sound file to stop.

	if audio_is_playing(_sound) {
		audio_stop_sound(_sound)
	}
}

function sound_ObjSound_SetVolumeRate(_sound,_volume) {
	/// @function sound_ObjSound_SetVolumeRate(_sound,_volume)
	/// @description Sets the volume of a sound file.
	/// @param {real} _sound The name of the sound file to change the volume.
	/// @param {real} _volume The volume to set the sound file to.
	
	audio_sound_gain(_sound,_volume,0)
}

///function sound_ObjSound_SetFade

function sound_ObjSound_SetFade(_sound,_fade) {
	/// @function sound_ObjSound_SetVolumeRate(_sound,_volume)
	/// @description Sets the volume of a sound file.
	/// @param {real} _sound The name of the sound file to change the volume.
	/// @param {real} _fade The time in seconds that the sound will fade.
	
	audio_sound_gain(_sound,0,1000 * _fade)
}

