if global.replay_mode == true {
	if global.replay_input[0].replay_stage[global.main_stats.stage - 1][global.replay_frame][4] == 1 and global.replay_input[0].replay_stage[global.main_stats.stage - 1][global.replay_frame - 1][4] == 0 {
		cursor_moved = true;
	}
	else {
		cursor_moved = false;
	}
}