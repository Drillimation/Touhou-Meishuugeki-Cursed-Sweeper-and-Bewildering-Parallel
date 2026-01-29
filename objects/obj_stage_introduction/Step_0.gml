if count == 60 {
	scr_change_bgm(stage_bgm);
	typist[0].unpause();
	typist[1].unpause();
}
if count == 240 {
	instance_destroy();
}
count++;