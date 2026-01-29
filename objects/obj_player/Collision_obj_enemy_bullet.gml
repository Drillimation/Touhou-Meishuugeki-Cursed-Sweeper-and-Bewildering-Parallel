xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

if invultime <= 0 and other.damage_delay <= 0 {
	player_SetPlayerHealth(-other.actual_damage,play_id,true);
	sound_ObjSound_Play(se_damage01);
	instance_destroy(other);
	with(obj_spell_card_enemy) { captured = false; }
	if global.player_stats[play_id].cur_health <= 0 {
		scr_lose_life();
	}
}