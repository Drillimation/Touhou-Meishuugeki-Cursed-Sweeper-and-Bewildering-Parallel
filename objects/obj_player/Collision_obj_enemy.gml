if other.hurt_on_collide = true {
	xview = camera_get_view_x(view_camera[0]);
	yview = camera_get_view_y(view_camera[0]);

	if invultime <= 0 {
		sound_ObjSound_Play(se_damage01);
		instance_destroy(other);
		player_SetPlayerHealth(-5,play_id,true);
		if global.player_stats[play_id].cur_health <= 0 {
			scr_lose_life();
		}
	}
}