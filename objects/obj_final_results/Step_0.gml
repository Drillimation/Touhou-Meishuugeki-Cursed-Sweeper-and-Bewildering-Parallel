scr_get_input_menu();

delay--;
delay = clamp(delay,0,999999);

if delay <= 0 {
	if (a_button) {
		instance_destroy();
		instance_create_depth(0,0,0,obj_nameentry);
	}
}