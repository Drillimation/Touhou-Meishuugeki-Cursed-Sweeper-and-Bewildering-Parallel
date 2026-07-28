if global.game_options.player_name == "" {
	instance_create_depth(0,0,0,obj_first_name_entry);
}
else {
	instance_create_depth(0,0,0,obj_title);
}