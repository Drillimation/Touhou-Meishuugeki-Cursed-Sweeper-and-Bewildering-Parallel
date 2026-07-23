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
		scr_enemy_remove_life();
	}
}
with(other) {
	penetration--;
}