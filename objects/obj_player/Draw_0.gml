if global.player_stats[play_id].power_items >= 12 {
	draw_sprite(turret_index,-1,x + lengthdir_x(16,turret_pos),y + lengthdir_y(8,turret_pos))
	draw_sprite(turret_index,-1,x + lengthdir_x(16,180 - turret_pos),y + lengthdir_y(8,180 - turret_pos))
}
draw_self();