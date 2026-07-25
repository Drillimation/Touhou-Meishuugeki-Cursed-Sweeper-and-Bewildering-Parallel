op_space = 40;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
escaped = false;

var load_array = scr_json_load_file("menu_data/music_room.json");

bgm_list = []
array_copy(bgm_list,0,load_array.bgm_list,0,array_length(load_array.bgm_list))

load_array = scr_json_load_file("menu_data/music_room_main" + string(global.suf) + ".json");

option = []
//description = []

array_copy(option,0,load_array.bgm_list,0,array_length(load_array.bgm_list));
//array_copy(description,0,load_array.menu_description,0,array_length(load_array.menu_description));

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);

op_length_y = array_length(option);
op_length_x = 1;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

scr_get_input_menu();