var load_file2 = scr_json_load_file("cutscenes/intro" + string(global.suf) + ".json");
var cutscene = scr_json_load_file("cutscenes/intro_scene.json")
s_scene_info = cutscene.t_scene_info;
scr_create_cutscene(s_scene_info);