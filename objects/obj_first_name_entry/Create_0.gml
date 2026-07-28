player_index = 0;
op_space = 16;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

var load_array = scr_json_load_file("main/final_results" + string(global.suf) + ".json");

option = [
	["A","B","C","D","E","F","G","H","I","J","K","L","M"],
	["N","O","P","Q","R","S","T","U","V","W","X","Y","Z"],
	["a","b","c","d","e","f","g","h","i","j","k","l","m"],
	["n","o","p","q","r","s","t","u","v","w","x","y","z"],
	["0","1","2","3","4","5","6","7","8","9",".","!"," "]
]

prompt = load_array.input_prompt;
prompt = scr_button_menu(prompt);

load_array = scr_json_load_file("menu_data/main_menu" + string(global.suf) + ".json");
welcome = load_array.welcome;
welcome = scr_button_menu(welcome);

op_length_y = array_length(option);
op_length_x = array_length(option[0]);

for(var i = 0; i < 32; i++) {
	for(var j = 0; j < 32; j++) {
		scribble_object[i][j] = undefined;
	}
}

player_name = ""