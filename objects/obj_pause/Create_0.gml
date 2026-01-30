x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;
_id = 0;

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

scr_get_input_menu(_id);

instance_deactivate_all(true);
instance_activate_object(obj_fullscreen);
instance_activate_object(obj_border);
fmod_channel_control_set_paused(global.bgm_channel, true);

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

sound_ObjSound_Play(se_pause);