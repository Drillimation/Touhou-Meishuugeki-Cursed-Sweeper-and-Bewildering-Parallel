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

var first_active_stage_idx = 0;
for (var m = 0; m < 8; m++) {
    if (struct_names_count(selected_replay.replay_input[0].replay_score[m]) > 0) {
        first_active_stage_idx = m;
        break;
    }
}
var active_score_struct = selected_replay.replay_input[0].replay_score[first_active_stage_idx];
var character_text = "Unknown";
if (struct_exists(active_score_struct, "character")) {
    character_text = struct_get(load_array.characters, active_score_struct.character);
}
var rank_text = load_array.rank[selected_replay.main_stats.difficulty];
var stage_text = load_array.stage[selected_replay.main_stats.stage - 1];

description = [
    selected_replay.replay_info.player_name,
    selected_replay.replay_info.save_date,
    character_text,
    rank_text,
    stage_text
];

op_length_y = array_length(option);
op_length_x = 1;