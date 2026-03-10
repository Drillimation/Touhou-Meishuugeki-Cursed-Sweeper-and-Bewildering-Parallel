op_space = 40;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

var load_array = scr_json_load_file("main/stage_names" + string(global.suf) + ".json");

option = [
	load_array.stage_start_number.STAGE_01_DAY,
	load_array.stage_start_number.STAGE_02_DAY,
	load_array.stage_start_number.STAGE_03_DAY
]
description = [
	load_array.stage_names.STAGE_01_DAY,
	load_array.stage_names.STAGE_02_DAY,
	load_array.stage_names.STAGE_03_DAY
]
img = [
	spr_kotori_portrait,
	spr_koko_portrait,
	spr_helene_portrait,
]

//array_copy(option,0,load_array.difficulty_select.menu_options,0,array_length(load_array.difficulty_select.menu_options));
//array_copy(description,0,load_array.difficulty_select.menu_description,0,array_length(load_array.difficulty_select.menu_description));

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);

op_length_y = array_length(option);
op_length_x = 1;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

scr_get_input_menu();

count = 0;