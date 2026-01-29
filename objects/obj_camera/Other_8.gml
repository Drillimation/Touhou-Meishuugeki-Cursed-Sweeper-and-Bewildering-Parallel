camera_set_view_pos(view_camera[0], x - (view_wport[0] / 2), y - (view_hport[0] / 2));
camera_set_view_pos(view_camera[1], x - (view_wport[1] / 2), y - (view_hport[1] / 2));
xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
switch(end_path_function) {
	case "MIDBOSS": 
		var inst = instance_create_layer(xview + 128,yview + 96,"Instances",obj_spawn_midboss);
		with(inst) {
			sprite_index = other.midboss_sprite;
			midboss = other.midboss;
		}
		break;
	case "CUTSCENE": 
		var load_file2 = scr_json_load_file("cutscenes/" + string(cutscene_index) + string(global.suf) + ".json");
		var cutscene = scr_json_load_file("cutscenes/" + string(cutscene_index) + ".json")
		s_scene_info = cutscene.t_scene_info;
		scr_create_cutscene(s_scene_info,obj_cutscene_textbox);
		break;
}

with(obj_enemy_bullet) {
	instance_destroy();
}

with(obj_enemy) {
	if can_attack == true {
		instance_destroy();
	}
}
instance_destroy();