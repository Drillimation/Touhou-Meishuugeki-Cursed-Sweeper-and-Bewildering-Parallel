xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

stage_start_number = "";
stage_name = "";
stage_bgm = "";

typist[0] = scribble_typist()
	.in(0.5,2)
	.ease(SCRIBBLE_EASE.LINEAR,0,48,1,0,0,1)
	
typist[1] = scribble_typist()
	.in(0.5,2)
	.ease(SCRIBBLE_EASE.LINEAR,0,-16,1,0,0,1)

typist[0].pause();
typist[1].pause();
for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

count = 0;