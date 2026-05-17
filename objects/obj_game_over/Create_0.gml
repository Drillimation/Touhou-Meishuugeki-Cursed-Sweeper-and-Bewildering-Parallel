x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;
_id = 0;

//This block is intended to be for customizing the game over sequence.
xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

str = "GAME OVER"

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}
count = 0;

var _load_file = scr_json_load_file("menu_data/game_over" + string(global.suf) + ".json");
option = []
array_copy(option,0,_load_file.menu_options,0,array_length(_load_file.menu_options));

op_length_y = array_length(option);
op_length_x = 1;

scr_get_input_menu(_id);