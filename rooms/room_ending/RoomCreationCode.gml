if global.main_stats.hours_passed >= 9 or global.main_stats.continues_used >= 1 {
	var load_file2 = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_bad_ending_day" + string(global.suf) + ".json");
	var cutscene = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_bad_ending_day.json")
	s_scene_info = cutscene.t_scene_info;
	scr_create_cutscene(s_scene_info);
}
else {
	var load_file2 = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_good_ending_day" + string(global.suf) + ".json");
	var cutscene = scr_json_load_file("cutscenes/" + string(global.player_stats[0].character) + "_good_ending_day.json")
	s_scene_info = cutscene.t_scene_info;
	scr_create_cutscene(s_scene_info);
}