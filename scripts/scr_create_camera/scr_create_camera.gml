function scr_create_camera(_camera){
	var load_array = scr_json_load_file("menu_data/camera_properties.json");
	var ss = struct_get(load_array,_camera)
	
	stage_speed = ss.stage_speed;
	end_path_function = ss.end_path_function;
	midboss = asset_get_index(ss.midboss);
	midboss_sprite = asset_get_index(ss.midboss_sprite);
	camera_path = asset_get_index(ss.camera_path)
	cutscene_index = string(global.player_stats[i].character) + string(ss.cutscene_index);
	
	path_start(camera_path,stage_speed,path_action_stop,true)
}