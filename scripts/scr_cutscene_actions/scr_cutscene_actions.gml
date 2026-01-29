function scr_create_cutscene(_scene){
	var inst = instance_create_layer(0,0,"Instances",obj_cutscene);
	with(inst) {
		scene_info = _scene;
		event_perform(ev_other,ev_user0);
	}
}

function scr_cutscene_end_action() {
	//show_debug_message("Cutscene transition")
	scene++;
	if (scene >= array_length(scene_info)) {
		instance_destroy();
		exit;
	}
	event_perform(ev_other,ev_user0);
}

function scr_cutscene_wait(_time) {
	timer++;
	if (timer >= _time) {
		timer = 0;
		scr_cutscene_end_action()
	}
}

function scr_cutscene_play_sound(_sound) {
	scr_one_channel_sound(asset_get_index(_sound));
	scr_cutscene_end_action()
}

function scr_cutscene_create_instance(_x,_y,_layer,_obj,_return = false) {
	var inst = instance_create_layer(_x,_y,_layer,asset_get_index(_obj));
	if _return == true {
		scr_cutscene_end_action();
		return inst;
	}
	else {
		scr_cutscene_end_action();
	}
}

function scr_cutscene_set_background(_sprite,_subimage) {
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_sprite(back_id,asset_get_index(_sprite))
	layer_background_index(back_id, _subimage);
	scr_cutscene_end_action();
}

function scr_cutscene_set_portrait(_sprite,_subimage,_x,_y) {
	var array_check = 0;
	for(var i = 0; i < array_length(cutscene_images); i++) {
		if cutscene_images[i][0] == _sprite {
			cutscene_images[i] = [_sprite,_subimage,_x,_y]
			array_check = 1;
			break;
		}
	}
	if array_check == 0 {
		array_push(cutscene_images,[_sprite,_subimage,_x,_y])
	}
	scr_cutscene_end_action();
}

function scr_cutscene_remove_portrait(_sprite) {
	for(var i = 0; i < array_length(cutscene_images); i++) {
		if cutscene_images[i][0] == _sprite {
			array_delete(cutscene_images,i,1);
		}
	}
	scr_cutscene_end_action();
}

function scr_cutscene_stop_bgm() {
	scr_stop_bgm();
	scr_cutscene_end_action();
}

function scr_cutscene_change_bgm(_bgm) {
	scr_change_bgm(_bgm);
	scr_cutscene_end_action();
}

function scr_cutscene_show_text(_file,_key,_sound) {
	if !instance_exists(obj_textbox) {
		var inst = instance_create_depth(8,288,0,obj_textbox)
		with(inst) {
			var load_data = scr_json_load_file(string(_file) + string(global.suf) + ".json");
			speaker = load_data.dialogue_texts[_key][0];
			txt = load_data.dialogue_texts[_key][1];
			
			typist = scribble_typist()
				.in(0.5, 0)
				.sound([_sound],0,1,1.1)
		}
	}
	with(obj_textbox) {
		var check_fade = typist.get_state()
		if check_fade == 1 {
			if count == 120 {
				with(other) {
					scr_cutscene_end_action();
				}
				instance_destroy();
				exit
			}
			count++;
		}
	}
}

function scr_cutscene_room_transition(_room) {
	inst = instance_create_depth(0,0,0,obj_fade_out);
	inst.target = asset_get_index(_room);
	scr_cutscene_end_action();
}