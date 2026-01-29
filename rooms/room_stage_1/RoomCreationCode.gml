var inst = instance_create_layer(0,0,"Effects",obj_stage_introduction);
var _load_data = scr_json_load_file("main/stage_names" + string(global.suf) + ".json")
inst.stage_start_number = struct_get(_load_data.stage_start_number,"STAGE_01_DAY");
inst.stage_name = struct_get(_load_data.stage_names,"STAGE_01_DAY");
inst.stage_bgm = "bgm/stage1.it";

scr_create_camera("STAGE_01_DAY_MID");

for(var i = 0; i < array_length(global.player_stats); i++) {
	inst = instance_create_layer(0,0,"Instances",obj_player);
	with(inst) {
		play_id = i;
		event_perform(ev_create,0);
	}
}