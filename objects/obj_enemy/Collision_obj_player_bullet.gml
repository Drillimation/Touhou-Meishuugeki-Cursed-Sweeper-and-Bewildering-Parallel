sound_ObjSound_Play(se_damage00);
hp -= other.actual_damage;
system_AddScore(10,other.play_id);
if hp <= 0 {
	sound_ObjSound_Play(se_enep00);
	instance_destroy();
	var drop = irandom(array_length(item_drop) - 1);
	if drop != 0 {
		//for(var i = 0; i < drop; i++) {
		item_CreateItemA2(item_drop[drop],x,y,x + irandom_range(-16,16),y + irandom_range(-16,16),0);
		//}
	}
}
with(other) {
	penetration--;
}