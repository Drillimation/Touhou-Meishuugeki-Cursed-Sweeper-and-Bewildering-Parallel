option = []
description = []

for(var i = 0; i < 8; i++) {
	var check_score;
	if struct_exists(selected_replay.replay_input[0].replay_score[i],"cur_score") {
		check_score = selected_replay.replay_input[0].replay_score[i].cur_score
	}
	else {
		check_score = 0;
	}
	option[i] = [
		i + 1,
		check_score
	]
}

op_length_y = array_length(option);
op_length_x = 1;