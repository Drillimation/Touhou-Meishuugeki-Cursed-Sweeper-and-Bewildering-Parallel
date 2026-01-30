function scr_get_input(_player){
	if (gamepad_is_connected(_player)) {
		rKey = gamepad_button_check(_player, gp_padr) || (gamepad_axis_value(_player,gp_axislh) > 0);
		lKey = gamepad_button_check(_player, gp_padl) || (gamepad_axis_value(_player,gp_axislh) < 0);
		dKey = gamepad_button_check(_player, gp_padd) || (gamepad_axis_value(_player,gp_axislv) > 0);
		uKey = gamepad_button_check(_player, gp_padu) || (gamepad_axis_value(_player,gp_axislv) < 0);
	
		xaxis = (rKey - lKey);
		yaxis = (dKey - uKey);
		
		gamepad_set_axis_deadzone(_player,0.5);
		gamepad_set_button_threshold(_player,0.5);
		
		action_shoot = gamepad_button_check(_player, gp_face1);
		action_focus = gamepad_button_check(_player,gp_face2) || gamepad_button_check(_player,gp_shoulderl) || gamepad_button_check(_player,gp_shoulderlb);
		action_bomb = gamepad_button_check_pressed(_player,gp_face3) || gamepad_button_check_pressed(_player,gp_shoulderr) || gamepad_button_check_pressed(_player,gp_shoulderrb);
		action_pause = gamepad_button_check_pressed(_player,gp_start);
	}
	else {
		rKey = max(keyboard_check(vk_right),keyboard_check(ord("D")),0)
		lKey = max(keyboard_check(vk_left),keyboard_check(ord("A")),0)
		dKey = max(keyboard_check(vk_down),keyboard_check(ord("S")),0)
		uKey = max(keyboard_check(vk_up),keyboard_check(ord("W")),0)

		xaxis = (rKey - lKey);
		yaxis = (dKey - uKey);
		
		action_shoot = keyboard_check(ord("Z"));
		action_focus = keyboard_check(vk_shift);
		action_bomb = keyboard_check_pressed(ord("X"));
		action_pause = keyboard_check_pressed(vk_escape);
	}
	
	//Saving inputs to replay
	if global.replay_mode == false {
		array_push(global.replay_input[_player].replay_stage[global.main_stats.stage - 1],[rKey,lKey,dKey,uKey,action_shoot,action_focus,action_bomb])
	}
}

function scr_replay_input(_player) {
	rKey = global.replay_input[_player].replay_stage[global.main_stats.stage - 1][replay_frame][0]
	lKey = global.replay_input[_player].replay_stage[global.main_stats.stage - 1][replay_frame][1]
	dKey = global.replay_input[_player].replay_stage[global.main_stats.stage - 1][replay_frame][2]
	uKey = global.replay_input[_player].replay_stage[global.main_stats.stage - 1][replay_frame][3]

	xaxis = (rKey - lKey);
	yaxis = (dKey - uKey);
		
	action_shoot = global.replay_input[_player].replay_stage[global.main_stats.stage - 1][replay_frame][4]
	action_focus = global.replay_input[_player].replay_stage[global.main_stats.stage - 1][replay_frame][5]
	action_bomb = global.replay_input[_player].replay_stage[global.main_stats.stage - 1][replay_frame][6]
	replay_frame++;
}