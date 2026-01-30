if count == 600 {
	var inst = instance_create_depth(0,0,0,obj_fade_out);
	inst.target = asset_get_index(room_intro);
}
count++;