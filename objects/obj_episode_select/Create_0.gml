op_space = 40;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

var load_array = scr_json_load_file("menu_data/main_menu" + string(global.suf) + ".json");

option = [
	load_array.episode_select.menu_options[0],
	load_array.episode_select.menu_options[1],
	load_array.episode_select.menu_options[2],
	load_array.episode_select.menu_options[3]
]
description = [
	load_array.episode_select.menu_description[0],
	load_array.episode_select.menu_description[1],
	load_array.episode_select.menu_description[2],
	load_array.episode_select.menu_description[3]
]
img = [
	spr_fusana_portrait,
	spr_camille_portrait,
	spr_veronica_portrait,
	spr_doromi_portrait
]

//array_copy(option,0,load_array.episode_select.menu_options,0,array_length(load_array.episode_select.menu_options));
//array_copy(description,0,load_array.episode_select.menu_description,0,array_length(load_array.episode_select.menu_description));

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);

op_length_y = array_length(option);
op_length_x = 1;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

scr_get_input_menu();

count = 0;