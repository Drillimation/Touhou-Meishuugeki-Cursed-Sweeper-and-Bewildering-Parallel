if global.replay_mode == false and global.main_stats.continues_used == 0 {
	for(var i = 0; i < array_length(global.player_stats); i++) {
		scr_get_input(i);
		array_push(global.replay_input[i].replay_stage[global.main_stats.stage - 1],[rKey,lKey,dKey,uKey,action_shoot,action_focus,action_bomb])
		//if global.replay_frame mod 60 == 0 {
			//show_debug_message(global.replay_input[i].replay_stage[global.main_stats.stage - 1])
			//show_debug_message(array_length(global.replay_input[i].replay_stage[global.main_stats.stage - 1]))
		//}
	}
}