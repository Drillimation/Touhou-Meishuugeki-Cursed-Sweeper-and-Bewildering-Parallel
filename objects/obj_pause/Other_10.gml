var load_array = scr_json_load_file("main/pause" + string(global.suf) + ".json");

option = [];
description = []

title_bar = load_array.pause_text;
pause_desc = load_array.gui_who_paused[_id];

var ss = struct_get(load_array,"menu_options_p" + string(_id + 1))
var tt = struct_get(load_array,"menu_description_p" + string(_id + 1))

array_copy(option,0,ss,0,array_length(ss));
array_copy(description,0,tt,0,array_length(tt));

op_length_y = array_length(option);
op_length_x = 1;