op_space = 40;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

var load_array = scr_json_load_file("main/stage_names" + string(global.suf) + ".json");

switch(global.main_stats.time_of_day) {
	case "DAY":
		option = [
			load_array.stage_start_number.STAGE_01_DAY,
			load_array.stage_start_number.STAGE_02_DAY,
			load_array.stage_start_number.STAGE_03_DAY,
			load_array.stage_start_number.STAGE_04_DAY,
			load_array.stage_start_number.STAGE_05_DAY,
			load_array.stage_start_number.STAGE_06_DAY
		]
		description = [
			load_array.stage_names.STAGE_01_DAY,
			load_array.stage_names.STAGE_02_DAY,
			load_array.stage_names.STAGE_03_DAY,
			load_array.stage_names.STAGE_04_DAY,
			load_array.stage_names.STAGE_05_DAY,
			load_array.stage_names.STAGE_06_DAY
		]
		img = [
			spr_kotori_portrait,
			spr_koko_portrait,
			spr_helene_portrait,
			spr_saika_portrait,
			spr_fusana_portrait,
			spr_berenice_portrait
		]
		break;
	case "NIGHT":
		option = [
			load_array.stage_start_number.STAGE_01_NIGHT,
			load_array.stage_start_number.STAGE_02_NIGHT,
			load_array.stage_start_number.STAGE_03_NIGHT,
			load_array.stage_start_number.STAGE_04_NIGHT,
			load_array.stage_start_number.STAGE_05_NIGHT,
			load_array.stage_start_number.STAGE_06_NIGHT
		]
		description = [
			load_array.stage_names.STAGE_01_NIGHT,
			load_array.stage_names.STAGE_02_NIGHT,
			load_array.stage_names.STAGE_03_NIGHT,
			load_array.stage_names.STAGE_04_NIGHT,
			load_array.stage_names.STAGE_05_NIGHT,
			load_array.stage_names.STAGE_06_NIGHT
		]
		img = [
			spr_kotori_portrait,
			spr_ritsuu_portrait,
			spr_helene_portrait,
			spr_ryuuko_portrait,
			spr_fusana_night_portrait,
			spr_veronica_portrait
		]
		break;
}

//array_copy(option,0,load_array.difficulty_select.menu_options,0,array_length(load_array.difficulty_select.menu_options));
//array_copy(description,0,load_array.difficulty_select.menu_description,0,array_length(load_array.difficulty_select.menu_description));

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);

op_length_y = array_length(option);
op_length_x = 1;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

scr_get_input_menu();

count = 0;