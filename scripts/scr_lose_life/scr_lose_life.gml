function scr_lose_life(){
	instance_destroy(obj_player_bullet);
	with(obj_enemy_bullet) {
		if item_resist == false {
			instance_destroy();
		}
	}
	sound_ObjSound_Play(se_pldead00);
	player_SetPlayerLife(-1,play_id,true);
	player_SetPlayerInvincibilityFrame(300,play_id);
	player_SetPlayerDeathbombFrame(15,play_id);
	global.main_stats.time_orbs -= 500;
	global.main_stats.time_orbs = clamp(global.main_stats.time_orbs,0,99999);
	global.player_stats[play_id].deaths += 1;
	if global.player_stats[play_id].cur_lives >= 1 {
		//Respawn the player if any lives are remaining
		if global.player_stats[play_id].power_items >= 12 {
			var inst;
			repeat(4) {
				inst = item_CreateItemA1(spr_power_item_s,x,y,0,4);
				move_ObjMove_SetDestAtSpeed(inst,irandom_range(8,248),irandom_range(24,120),4);
				//item_CreateItemA2(spr_power_item_s,x_pos,y_pos,irandom_range(8,248),irandom_range(24,120),10,4)
			}
			inst = item_CreateItemA1(spr_power_item_l,x,y,0,4);
			move_ObjMove_SetDestAtSpeed(inst,irandom_range(8,248),irandom_range(24,120),4);
			//item_CreateItemA2(spr_power_item_l,x_pos,y_pos,irandom_range(8,248),irandom_range(24,120),50,4)
		}
		player_SetPlayerPower(-12,play_id,true);
		player_SetPlayerHealth(global.main_stats.max_health,play_id,false);
		x_pos = global.player_stats[play_id].start_x;
		y_pos = global.player_stats[play_id].start_y;
	}
	else {
		//End the game if not
		instance_deactivate_object(self);
		instance_deactivate_object(obj_enemy);
		instance_deactivate_object(obj_camera);
		instance_destroy(obj_player_bullet);
		instance_destroy(obj_enemy_bullet);
		instance_destroy(obj_item);
		instance_create_layer(0,0,"Instances",obj_game_over)
	}
}