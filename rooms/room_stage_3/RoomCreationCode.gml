var inst = instance_create_layer(0,0,"Effects",obj_stage_introduction);
var _load_data = scr_json_load_file("main/stage_names" + string(global.suf) + ".json")
inst.stage_start_number = struct_get(_load_data.stage_start_number,"STAGE_03_" + string(global.main_stats.time_of_day));
inst.stage_name = struct_get(_load_data.stage_names,"STAGE_03_" + string(global.main_stats.time_of_day));
inst.stage_bgm = "bgm/stage_03.it";

scr_create_camera("STAGE_03_" + string(global.main_stats.time_of_day) + "_MID");
if global.main_stats.time_of_day == "NIGHT" {
	for(var i = 1; i < 5; i++) {
		var lay_id = layer_get_id("Tiles_" + string(i));
		var tile_id = layer_tilemap_get_id(lay_id)
		if tilemap_get_tileset(tile_id) == tileset_day {
			tilemap_tileset(tile_id, tileset_night);
		}
	}
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_blend(back_id, make_color_rgb(32,26,20));
}

for(var i = 0; i < array_length(global.player_stats); i++) {
	inst = instance_create_layer(0,0,"Instances",obj_player);
	with(inst) {
		play_id = i;
		event_perform(ev_create,0);
	}
}