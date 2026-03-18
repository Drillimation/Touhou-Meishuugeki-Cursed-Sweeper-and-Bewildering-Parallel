global.fmod = fmod_system_create();
fmod_system_init(512,FMOD_INIT.NORMAL);
global.bgm = undefined;
global.bgm_channel = undefined;
global.current_bgm = undefined;

game_set_speed(60, gamespeed_fps);
audio_group_load(audiogroup_default);

//Fonts
global.font_effects = {
	shd : scribble_font_bake_shadow("font_ms_gothic","drp_shd",1,1,make_color_rgb(0,0,0),1,0,false),
	shd2 : scribble_font_bake_outline_and_shadow("font_dice","drp_shd2",1,1,SCRIBBLE_OUTLINE.FOUR_DIR,0,false),
	shd3 : scribble_font_bake_outline_and_shadow("font_dice_condensed","drp_shd3",1,1,SCRIBBLE_OUTLINE.FOUR_DIR,0,false),
	shd4 : scribble_font_bake_shadow("font_chicago","drp_shd4",1,1,make_color_rgb(0,0,0),1,0,false),
	shd5 : scribble_font_bake_shadow("font_misaki","drp_shd5",1,1,make_color_rgb(0,0,0),1,0,false),
	sprite_font : font_add_sprite(spr_font,32,false,0)
}

if file_exists("highscores.save") {
	var _load_data = scr_json_load_file("highscores.save");
	global.highscores = [];
	array_copy(global.highscores,0,_load_data.default_table,0,array_length(_load_data.default_table))
}
else {
	var _load_data = scr_json_load_file("main/default_highscores.json");
	global.highscores = [];
	array_copy(global.highscores,0,_load_data.default_table,0,array_length(_load_data.default_table))
}

if file_exists("spell_card_statistics.save") {
	var _load_data = scr_json_load_file("spell_card_statistics.save");
	global.spellcard_statistics = _load_data;
	_load_data = scr_json_load_file("main/spell_card_order.json");
	var spell_card_order = _load_data;
	for(var i = 0; i < array_length(spell_card_order.spell_card_order); i++) {
		if !struct_exists(global.spellcard_statistics,spell_card_order.spell_card_order[i]) {
			struct_set(global.spellcard_statistics,spell_card_order.spell_card_order[i],{ encounters : 0, captures : 0 })
		}
	}
}
else {
	global.spellcard_statistics = {};
	var _load_data = scr_json_load_file("main/spell_card_order.json");
	var spell_card_order = _load_data;
	for(var i = 0; i < array_length(spell_card_order.spell_card_order); i++) {
		if !struct_exists(global.spellcard_statistics,spell_card_order.spell_card_order[i]) {
			struct_set(global.spellcard_statistics,spell_card_order.spell_card_order[i],{ encounters : 0, captures : 0 })
		}
	}
	scr_json_save_file(global.spellcard_statistics,"spell_card_statistics.save");
}

if !file_exists("options.save") {
	global.game_options = {
		language : 0,
		bgm_volume : 0.8,
		sfx_volume : 0.8,
		fullscreen : 1,
		stages_cleared : 0,
		border_brightness : 1
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