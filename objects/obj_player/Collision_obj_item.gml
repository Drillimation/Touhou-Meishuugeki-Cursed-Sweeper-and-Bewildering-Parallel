var item_val;
switch(other.sprite_index) {
	case spr_power_item_s:
		sound_ObjSound_Play(se_item00);
		if global.player_stats[play_id].power_items >= 100 {
			item_val = (global.main_stats.difficulty * 100) + 100
		}
		else {
			item_val = 10
		}
		scr_create_subscore_display(item_val);
		system_AddScore(item_val,play_id);
		player_SetPlayerPower(1,play_id,true);
		global.player_stats[play_id].power_collected += 1;
		break;
	case spr_power_item_l:
		sound_ObjSound_Play(se_item00);
		if global.player_stats[play_id].power_items >= 100 {
			item_val = (global.main_stats.difficulty * 100) + 100
		}
		else {
			item_val = 50
		}
		scr_create_subscore_display(item_val);
		system_AddScore(item_val,play_id);
		player_SetPlayerPower(5,play_id,true);
		global.player_stats[play_id].power_collected += 1;
		break;
	case spr_point_item:
		sound_ObjSound_Play(se_item00);
		if y_pos < itemcollectline {
			item_val = (global.main_stats.difficulty * 500) + 500
		}
		else {
			item_val = (abs(round((y_pos / 10) - 30)) * 10)
		}
		scr_create_subscore_display(item_val);
		system_AddScore(item_val,play_id);
		system_AddPoint(1,play_id);
		global.player_stats[play_id].point_collected += 1;
		break;
	case spr_full_item:
		sound_ObjSound_Play(se_item00);
		system_AddScore(1000,play_id);
		scr_create_subscore_display(1000);
		player_SetPlayerPower(100,play_id);
		global.player_stats[play_id].power_collected += 1;
		break;
	case spr_bomb_item:
		sound_ObjSound_Play(se_cardget);
		system_AddScore(1000,play_id);
		scr_create_subscore_display(1000);
		player_SetPlayerSpell(1,play_id,true);
		break;
	case spr_life_item:
		sound_ObjSound_Play(se_extend);
		player_SetPlayerHealth(global.main_stats.max_health,play_id);
		player_SetPlayerLife(1,play_id,true);
		break;
}
instance_destroy(other);