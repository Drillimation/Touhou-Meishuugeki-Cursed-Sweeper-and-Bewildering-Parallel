op_space = 40;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

var load_array = scr_json_load_file("menu_data/main_menu" + string(global.suf) + ".json");

option = [load_array.character_select.menu_options[0],load_array.character_select.menu_options[1]]
description = [load_array.character_select.menu_description[0],load_array.character_select.menu_description[1]]
img = [
	spr_reimu_portrait,
	spr_marisa_portrait
]

//array_copy(option,0,load_array.character_select.menu_options,0,array_length(load_array.character_select.menu_options));
//array_copy(description,0,load_array.character_select.menu_description,0,array_length(load_array.character_select.menu_description));

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);

op_length_y = array_length(option);
op_length_x = 1;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

scr_get_input_menu();

count = 0;