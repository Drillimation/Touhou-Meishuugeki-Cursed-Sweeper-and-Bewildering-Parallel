var inst = instance_create_layer(0,0,"Effects",obj_stage_introduction);
var _load_data = scr_json_load_file("main/stage_names" + string(global.suf) + ".json")
inst.stage_start_number = struct_get(_load_data.stage_start_number,"STAGE_05_DAY");
inst.stage_name = struct_get(_load_data.stage_names,"STAGE_05_DAY");
inst.stage_bgm = "bgm/stage_05.it";