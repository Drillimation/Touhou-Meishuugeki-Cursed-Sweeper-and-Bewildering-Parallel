count = 0;

for(var i = 0; i < array_length(global.player_stats); i++) {
	if global.main_stats.continues_used == 0 {
		global.replay_input[i].replay_score[global.main_stats.stage - 1] = variable_clone(global.player_stats[i]);
		global.replay_input[i].stage_played[global.main_stats.stage - 1] = 1;
		show_debug_message(global.replay_input[i].replay_score[global.main_stats.stage - 1])
	}
}