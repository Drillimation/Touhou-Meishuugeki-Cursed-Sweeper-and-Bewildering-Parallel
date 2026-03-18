if invultime <= 0 {
	sound_ObjSound_Play(se_damage00);
	hp -= other.actual_damage;
	system_AddScore(10,other.play_id);
	ch = other.play_id
	with(obj_player) {
		if action_focus == 0 and play_id == other.ch {
			global.main_stats.time_orbs += 1;
		}
	}
	if hp <= 0 {
		sound_ObjSound_Play(se_enep00);
		system_AddScore(50,other.play_id);
		instance_destroy();
		instance_create_depth(x,y,-1000,obj_enemy_explosion);
		//var drop = irandom(array_length(item_drop) - 1);
		//if drop != 0 {
		//for(var i = 0; i < drop; i++) {
		if irandom(1) == 1 {
			var inst = item_CreateItemA1(item_drop[0],x,y,0,2);
			move_ObjMove_SetDestAtSpeed(inst,x_pos + irandom_range(-16,16),y_pos + irandom_range(-16,16),2);
			//item_CreateItemA2(item_drop[0],x,y,x_pos + irandom_range(-16,16),y_pos + irandom_range(-16,16),0,2);
		}
		//}
		//}
	}
}
with(other) {
	penetration--;
}