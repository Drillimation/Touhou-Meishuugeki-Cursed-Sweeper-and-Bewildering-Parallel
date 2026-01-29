//These commands are for debug use only. Replace if you're making an actual game.
/*if keyboard_check_pressed(vk_f1) {
	item_CreateItemA1(choose(spr_power_item_s,spr_power_item_l,spr_point_item,spr_life_item,spr_bomb_item),irandom_range(4,252),irandom_range(20,80),0);
}
if keyboard_check_pressed(vk_f2) {
	item_CreateItemA1(spr_full_item,irandom_range(4,252),irandom_range(20,80),0);
}*/

for(var i = 0; i < array_length(global.player_stats); i++) {
	if global.player_stats[i].cur_score > highscore {
		highscore = global.player_stats[i].cur_score;
	}
}