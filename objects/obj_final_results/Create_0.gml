op_space = 32;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

load_array = scr_json_load_file("main/final_results" + string(global.suf) + ".json");

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);

left_text = [
	load_array.main_texts.text_rank,
	load_array.main_texts.text_continues_used,
	load_array.main_texts.text_spells_captured,
	load_array.main_texts.text_deaths,
	load_array.main_texts.text_final_score,
	load_array.main_texts.text_bombs_used,
	load_array.main_texts.text_graze,
	load_array.main_texts.text_power_items,
	load_array.main_texts.text_point_items
]

right_text = []
for(var i = 0; i < array_length(global.player_stats); i++) {
	array_push(right_text,[
		global.player_stats[i].deaths,
		global.player_stats[i].cur_score,
		global.player_stats[i].bombs_used,
		global.player_stats[i].graze,
		global.player_stats[i].power_collected,
		global.player_stats[i].point_collected,
	]);
}

for(var i = 0; i < 64; i++) {
	scribble_object[i] = undefined;
}
captured_spells = 0
for(var i = 0; i < array_length(global.main_stats.spells_captured); i++) {
	if global.main_stats.spells_captured[i][1] == 1 {
		captured_spells++;
	}
}