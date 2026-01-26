op_space = 16;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

var load_array = scr_json_load_file("menu_data/language_select.json");

option = []
description = []

array_copy(option,0,load_array.menu_options,0,array_length(load_array.menu_options));
array_copy(description,0,load_array.menu_description,0,array_length(load_array.menu_description));


op_length_y = array_length(option);
op_length_x = 1;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}
shd = scribble_font_bake_shadow("font_ms_gothic","drp_shd",1,1,make_color_rgb(0,0,0),1,0,false);

scr_get_input_menu();