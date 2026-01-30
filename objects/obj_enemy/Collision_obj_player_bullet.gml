sound_ObjSound_Play(se_damage00);
hp -= other.actual_damage;
system_AddScore(10,other.play_id);
if hp <= 0 {
	sound_ObjSound_Play(se_enep00);
	system_AddScore(50,other.play_id);
	instance_destroy();
	instance_create_depth(x,y,-1000,obj_enemy_explosion);
	//var drop = irandom(array_length(item_drop) - 1);
	//if drop != 0 {
	//for(var i = 0; i < drop; i++) {
	if irandom(1) == 1 {
		item_CreateItemA2(item_drop[0],x,y,x + irandom_range(-16,16),y + irandom_range(-16,16),0);
	}
	//}
	//}
}
with(other) {
	penetration--;
}