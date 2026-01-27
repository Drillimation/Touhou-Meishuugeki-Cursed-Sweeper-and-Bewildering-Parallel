count = 0;

var load_array = scr_json_load_file("menu_data/main_menu" + string(global.suf) + ".json");
demo_prompt = load_array.demo_play;
copyr_notice = @"©2026 Drillimation Systems Co., Ltd./E. Enthusiasm.
Characters © Team Shanghai Alice/Drillimation/E. Enthusiasm"

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}