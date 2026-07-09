if global.main_stats.stage == 6 {
	var time_hour = string_lower(global.main_stats.time_of_day);
	if global.main_stats.hours_passed >= 9 or global.main_stats.continues_used >= 1 {
		var load_file2 = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_bad_ending_" + string(time_hour) + string(global.suf) + ".json");
		var cutscene = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_bad_ending_" + string(time_hour) + ".json")
		s_scene_info = cutscene.t_scene_info;
		scr_create_cutscene(s_scene_info);
	}
	else {
		var load_file2 = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_good_ending_" + string(time_hour) + string(global.suf) + ".json");
		var cutscene = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_good_ending_" + string(time_hour) + ".json")
		s_scene_info = cutscene.t_scene_info;
		scr_create_cutscene(s_scene_info);
	}
}
if global.main_stats.stage == 7 {
	var load_file2 = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_extra_ending" + string(global.suf) + ".json");
	var cutscene = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_extra_ending.json")
	s_scene_info = cutscene.t_scene_info;
	scr_create_cutscene(s_scene_info);
}
if global.main_stats.stage == 8 {
	var load_file2 = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_phantasm_ending" + string(global.suf) + ".json");
	var cutscene = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_phantasm_ending.json")
	s_scene_info = cutscene.t_scene_info;
	scr_create_cutscene(s_scene_info);
}