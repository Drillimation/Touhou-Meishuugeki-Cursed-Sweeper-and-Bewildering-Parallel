if array_length(current_scene_array) >= 1 {
	script_execute_ext(asset_get_index(current_scene[0]),current_scene_array)
}
else {
	script_execute_ext(asset_get_index(current_scene[0]));
}