option = []
description = []

for(var i = 0; i < 8; i++) {
	var check_score;
	if struct_exists(selected_replay.replay_input[0].replay_score[i],"cur_score") {
		check_score = selected_replay.replay_input[0].replay_score[i].cur_score
	}
	else {
		check_score = "-------";
	}
	option[i] = [
		i + 1,
		check_score
	]
}
option[6][0] = "EX"
option[7][0] = "PH"

var character_text = struct_get(load_array.characters,selected_replay.replay_input[0].replay_score[0].character)
var rank_text = load_array.rank[selected_replay.main_stats.difficulty]
var stage_text = load_array.stage[selected_replay.main_stats.stage - 1]
description = [
	selected_replay.replay_info.player_name,
	selected_replay.replay_info.save_date,
	character_text,
	rank_text,
	stage_text
];

op_length_y = array_length(option);
op_length_x = 1;