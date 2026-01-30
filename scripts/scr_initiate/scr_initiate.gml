function scr_system_initiate(_no_of_players = 1){
	/// @function scr_system_initiate(_no_of_players)
	/// @description Initiates the system. This is important when running the game, as running the game without it may result in errors.
	/// @param {real} _no_of_players Sets the number of players.
	
	randomize();
	global.replay_mode = false;
	global.playing_field = {
		x1 : 0,
		y1 : 0,
		x2 : 255,
		y2 : 287,
		minrpriority : 20,
		maxrpriority : 60,
		camera_priority : 80,
		random_seed : random_get_seed()
	}
	global.main_stats = {
		difficulty : 0,
		stage : 1,
		continues_used : 0,
		spells_captured : [],
		max_health : 30,
		time_orbs : 0,
		orb_requirement : 1000
	}
	global.main_stats.orb_requirement = 1000 * global.main_stats.stage;
	for(var i = 0; i < _no_of_players; i++) {
		global.player_stats[i] = {
			character : "CHAR_REIMU",
			cur_score : 0,
			cur_lives : 3,
			cur_health : 30,
			cur_bombs : 3,
			graze : 0,
			point_items : 0,
			power_items : 0,
			rpriority : 60,
			deaths : 0,
			bombs_used : 0,
			point_collected : 0,
			power_collected : 0,
			start_x : (global.playing_field.x1 + 64) + (i * 128),
			start_y : global.playing_field.y1 + 192
		}
		global.replay_input[i] = {
			replay_stage : [[],[],[],[],[],[],[]]
		}
	}
}

function scr_system_close() {
	/// @function scr_system_close()
	/// @description Ends the system and discards the global variables. This is important to prevent memory leaks at the end of the game, which could slow down and potentially crash your game.

	struct_remove(global,"replay_mode");
	struct_remove(global,"playing_field");
	struct_remove(global,"main_stats");
	struct_remove(global,"player_stats");
	struct_remove(global,"replay_input");
}

function scr_load_replay(_file) {
	var _replay_file = scr_json_load_file(_file);
	global.replay_mode = true;
	global.playing_field = struct_get(_replay_file,"playing_field");
	global.main_stats = struct_get(_replay_file,"main_stats");
	global.player_stats = struct_get(_replay_file,"player_stats");
	global.replay_input = struct_get(_replay_file,"replay_input");
}

function scr_save_replay(_file) {
	var save_data = {
		playing_field : global.playing_field,
		main_stats : global.main_stats,
		player_stats : global.player_stats,
		replay_input : global.replay_input
	}
	scr_json_save_file(save_data,_file)
}