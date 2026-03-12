op_space = 40;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

var load_array = scr_json_load_file("menu_data/options" + string(global.suf) + ".json");

option = []
description = []

array_copy(option,0,load_array.option_select.option_name,0,array_length(load_array.option_select.option_name));
array_copy(description,0,load_array.option_select.option_description,0,array_length(load_array.option_select.option_description));

prompt = load_array.prompt.main_menu;
prompt = scr_button_menu(prompt);

op_length_y = array_length(option);
op_length_x = 1;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

scr_get_input_menu();

count = 0;