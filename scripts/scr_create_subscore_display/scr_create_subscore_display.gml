function scr_create_subscore_display(_score){
	var inst = instance_create_depth(x,y,0,obj_sub_score_display);
	inst.display_score = _score;
}