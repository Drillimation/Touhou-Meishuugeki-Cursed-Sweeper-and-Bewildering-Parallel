xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

x = xview + x_pos;
y = yview + y_pos;

layer_sequence_x(_sequence,x);
layer_sequence_y(_sequence,y);

if layer_sequence_is_finished(_sequence) != 0 {
	layer_sequence_destroy(_sequence);
	instance_destroy();
	switch(global.main_stats.stage) {
		case 1: room_goto(room_transition_1); break;
		case 2: room_goto(room_transition_2); break;
		case 3: room_goto(room_transition_3); break;
		case 4: room_goto(room_transition_4); break;
		case 5: room_goto(room_transition_5); break;
		case 6: room_goto(room_transition_6); break;
		case 7: room_goto(room_transition_7); break;
		case 8: room_goto(room_transition_8); break;
	}
}