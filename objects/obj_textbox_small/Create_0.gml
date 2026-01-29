xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

txt = "You should not be seeing this. If you are, you probably found a bug.";
speaker = " ";

typist = scribble_typist()
	.in(0.1, 0)
	.sound([snd_text_blip_n],0,1,1.1);
	
for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

//shd = scribble_font_bake_shadow("font_ms_gothic","drp_shd",1,1,make_color_rgb(0,0,0),1,0,false);

count = 0;