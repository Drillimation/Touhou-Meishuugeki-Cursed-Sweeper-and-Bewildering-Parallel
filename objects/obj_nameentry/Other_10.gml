var load_array = scr_json_load_file("main/final_results" + string(global.suf) + ".json");

option = [
	["A","B","C","D","E","F","G","H","I","J","K","L","M"],
	["N","O","P","Q","R","S","T","U","V","W","X","Y","Z"],
	["a","b","c","d","e","f","g","h","i","j","k","l","m"],
	["n","o","p","q","r","s","t","u","v","w","x","y","z"],
	["0","1","2","3","4","5","6","7","8","9",".","!"," "]
]

prompt = load_array.input_prompt;
prompt = scr_button_menu(prompt);

op_length_y = array_length(option);
op_length_x = array_length(option[0]);

for(var i = 0; i < 32; i++) {
	for(var j = 0; j < 32; j++) {
		scribble_object[i][j] = undefined;
	}
}

player_name = ""

if global.player_stats[player_index].cur_score < global.highscores[9].score {
	player_index += 1;
	if player_index > array_length(global.player_stats) - 1 {
		instance_destroy();
		ds_grid_destroy(score_grid);
		for(var i = 0; i < array_length(global.spellcard_statistics); i++) {
			if struct_exists(global.spellcard_statistics,global.main_stats.spells_captured[i][0]) {
				var _ss = struct_get(global.spellcard_statistics,global.main_stats.spells_captured[i][0])
				_ss += global.main_stats.spells_captured[i][1]
				struct_set(global.spellcard_statistics,global.main_stats.spells_captured[i][0],_ss)
			}
		}
		scr_system_close();
		instance_create_depth(0,0,0,obj_true_gameover);
	}
	else {
		event_perform(ev_user0,0);
	}
}