function scr_get_input_menu(_player = 0){
	if gamepad_is_connected(_player) {
		rKey = gamepad_button_check(_player, gp_padr) || (gamepad_axis_value(_player,gp_axislh) > 0);
		lKey = gamepad_button_check(_player, gp_padl) || (gamepad_axis_value(_player,gp_axislh) < 0);
		dKey = gamepad_button_check(_player, gp_padd) || (gamepad_axis_value(_player,gp_axislv) > 0);
		uKey = gamepad_button_check(_player, gp_padu) || (gamepad_axis_value(_player,gp_axislv) < 0);
		a_button = gamepad_button_check_pressed(_player,gp_face1);
		b_button = gamepad_button_check_pressed(_player,gp_face2);
		x_button = gamepad_button_check_pressed(_player,gp_face3);
		start_button = gamepad_button_check_pressed(_player,gp_start);
		
		gamepad_set_axis_deadzone(_player,0.5);
	}
	else {
		rKey = max(keyboard_check(vk_right),keyboard_check(ord("D")),0)
		lKey = max(keyboard_check(vk_left),keyboard_check(ord("A")),0)
		dKey = max(keyboard_check(vk_down),keyboard_check(ord("S")),0)
		uKey = max(keyboard_check(vk_up),keyboard_check(ord("W")),0)
		a_button = max(keyboard_check_pressed(ord("Z")),keyboard_check_pressed(vk_enter),0);
		b_button = max(keyboard_check_pressed(ord("X")),keyboard_check_pressed(vk_escape),0);
		x_button = max(keyboard_check_pressed(ord("C")),keyboard_check_pressed(vk_delete),0);
		start_button = max(keyboard_check_pressed(vk_escape),0);
	}
	
	xaxis = (rKey - lKey);
	yaxis = (dKey - uKey);
}