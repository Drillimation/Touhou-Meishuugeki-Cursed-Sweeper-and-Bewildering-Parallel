if count == 600 {
	scr_change_bgm("bgm/ending.it");
	instance_create_layer(0,0,"Effects",obj_gameover_transition);
}
instance_destroy();