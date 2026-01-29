xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
x_pos = x - xview;
y_pos = y - yview;

_sequence = layer_sequence_create("Instances",xview + 0,yview + 0,sequence_transition_in);