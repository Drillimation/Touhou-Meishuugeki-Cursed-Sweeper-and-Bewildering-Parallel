sound_ObjSound_Play(se_damage00);
hp -= other.actual_damage;
system_AddScore(10,other.play_id);
if hp <= 0 {
	scr_enemy_remove_life();
}
with(other) {
	penetration--;
}