op_space = 16;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

selected_replay = undefined;

load_array = scr_json_load_file("menu_data/replay_menu" + string(global.suf) + ".json");

option = [
	["1",undefined],
	["2",undefined],
	["3",undefined],
	["4",undefined],
	["5",undefined],
	["6",undefined],
	["EX",undefined],
	["PH",undefined]
]
description = [undefined,undefined,undefined,undefined,undefined]

op_length_y = array_length(option);
op_length_x = 1;

//array_copy(option,0,load_array.menu_options,0,array_length(load_array.menu_options));
//array_copy(description,0,load_array.menu_description,0,array_length(load_array.menu_description));

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);

for(var i = 0; i < 32; i++) {
	scribble_object[i] = undefined;
}
//shd = scribble_font_bake_shadow("font_ms_gothic","drp_shd",1,1,make_color_rgb(0,0,0),1,0,false);

scr_get_input_menu();