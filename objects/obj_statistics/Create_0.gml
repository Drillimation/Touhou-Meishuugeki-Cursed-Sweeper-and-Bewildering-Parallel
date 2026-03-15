op_space = 32;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

load_array = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json");
var load_order = scr_json_load_file("main/spell_card_order.json");

option = []
description = []

for(var i = 0; i < array_length(load_order.spell_card_order); i++) {
	option[i] = struct_get(load_array.enemy_spell,load_order.spell_card_order[i]);
	description[i] = struct_get(global.spellcard_statistics,load_order.spell_card_order[i]);
}

//array_copy(option,0,load_array.spell_card_order,0,array_length(load_array.spell_card_order));
//array_copy(description,0,load_array.option_select.option_description,0,array_length(load_array.option_select.option_description));

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);

op_length_y = array_length(option);
op_length_x = 1;

for(var i = 0; i < 64; i++) {
	scribble_object[i] = undefined;
}

scr_get_input_menu();

count = 0;
inventory_scroll = [0,8];
scroll_clamp = 0;
list_max_entries = 8;
_ss = 0;