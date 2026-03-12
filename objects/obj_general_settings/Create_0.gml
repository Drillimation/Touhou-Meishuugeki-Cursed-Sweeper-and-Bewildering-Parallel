op_space = 16;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

var load_array = scr_json_load_file("menu_data/options" + string(global.suf) + ".json");

option = []
description = []

array_copy(option,0,load_array.adjust_select.adjust_name,0,array_length(load_array.adjust_select.adjust_name));
array_copy(description,0,load_array.adjust_select.adjust_description,0,array_length(load_array.adjust_select.adjust_description));

prompt = load_array.prompt.adjust_option;
prompt = scr_button_menu(prompt);
fullscreen_options = load_array.adjust_select.fullscreen_options;
brightness_options = load_array.adjust_select.brightness_options;
option_values = [
	global.game_options.bgm_volume,
	global.game_options.sfx_volume,
	global.game_options.fullscreen,
	global.game_options.border_brightness
]

op_length_y = array_length(option);
op_length_x = 1;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}
//shd = scribble_font_bake_shadow("font_ms_gothic","drp_shd",1,1,make_color_rgb(0,0,0),1,0,false);

scr_get_input_menu();