if count == 600 {
	instance_destroy();
	instance_create_depth(0,0,0,obj_true_gameover);
}
count++;