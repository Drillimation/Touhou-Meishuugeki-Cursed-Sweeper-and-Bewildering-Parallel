//These commands are for debug use only. Replace if you're making an actual game.
/*if keyboard_check_pressed(vk_f1) {
	item_CreateItemA1(choose(spr_power_item_s,spr_power_item_l,spr_point_item,spr_life_item,spr_bomb_item),irandom_range(4,252),irandom_range(20,80),0);
}
if keyboard_check_pressed(vk_f2) {
	item_CreateItemA1(spr_full_item,irandom_range(4,252),irandom_range(20,80),0);
}*/

if global.freeplaymode == false {
	for(var i = 0; array_length(global.player_stats); i++) {
		scr_get_input(i);
		if global.replay_mode == false and global.main_stats.continues_used == 0 {
			array_push(global.replay_input[i].replay_stage[global.main_stats.stage - 1],[rKey,lKey,dKey,uKey,action_shoot,action_focus,action_bomb])
		}
	}
}
replay_frame++;

for(var i = 0; i < array_length(global.player_stats); i++) {
	if global.player_stats[i].cur_score > highscore {
		highscore = global.player_stats[i].cur_score;
	}
	
	if global.player_stats[i].cur_score >= global.player_stats[i].bombscore {
		sound_ObjSound_Play(se_extend);
		global.player_stats[i].cur_lives++;
		global.player_stats[i].cur_bombs++;
		global.player_stats[i].received++;
		global.player_stats[i].bombscore += global.player_stats[i].received * 100000
	}
}