for (var i = 0; i < array_length(global.player_stats); i++) {
	system_AddScore(round(10000),i);
}

var load_file2 = scr_json_load_file("cutscenes/" + string(global.player_stats.character) + "_stage_1_postbattle" + string(global.suf) + ".json");
var cutscene = scr_json_load_file("cutscenes/" + string(global.player_stats.character) + "_stage_1_postbattle.json")
s_scene_info = cutscene.t_scene_info;
scr_create_cutscene(s_scene_info,obj_cutscene_textbox);