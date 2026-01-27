var load_array = scr_json_load_file("menu_data/tutorial" + string(global.suf) + ".json");

description = []

array_copy(description,0,load_array.tutorial_controls,0,array_length(load_array.tutorial_controls));

for(var i = 0; i < array_length(description); i++) {
	description[i] = scr_button_menu(description[i]);
}

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);
header = load_array.tutorial_header;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

scr_get_input_menu();

count = 0;