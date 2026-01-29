function scr_character_sprites(){
	//Use this function for setting the sprites and shoot sequences for the characters picked by the player.
	switch(global.player_stats[play_id].character) {
		case "CHAR_REIMU": 
			sprite_index = spr_reimu;
			turret_index = spr_reimu_turret;
			shoot_sequence = function() {
				if reload mod 9 == 0 {
					sound_ObjSound_Play(se_plst00);
					var nrmT = 5 - (action_focus * 2.5)
					var sm_nrmT = 2.5 - (action_focus * 1.25)
					var twistT = floor(global.player_stats[play_id].power_items / 25);
					var angleT = (90 + (twistT * sm_nrmT))
					repeat(1 + twistT) {
						playermain_CreatePlayerShotA1(x,y,4,angleT,5,1,spr_reimu_amulet_1,-1);
						angleT -= (nrmT)
					}
				}
				if global.player_stats[play_id].power_items >= 12 and reload mod 10 == 5 {
					var nrmT = 5 - (action_focus * 2.5)
					var sm_nrmT = 2.5 - (action_focus * 1.25)
					var twistT = floor(global.player_stats[play_id].power_items / 50);
					var angleT = (90 + (twistT * sm_nrmT))
					repeat(1 + twistT) {
						var inst = playermain_CreatePlayerShotA1(x + lengthdir_x(16,turret_pos),y + lengthdir_y(8,turret_pos),4,angleT,1,1,spr_reimu_amulet_2,-1)
						move_ObjMove_SetAngleAtTarget(inst,obj_enemy);
						inst = playermain_CreatePlayerShotA1(x + lengthdir_x(16,180 - turret_pos),y + lengthdir_y(8,180 - turret_pos),4,angleT,1,1,spr_reimu_amulet_2,-1)
						move_ObjMove_SetAngleAtTarget(inst,obj_enemy);
						angleT -= (nrmT)
					}
				}
				reload++;
			}
			bomb_sequence = function() {
				shot_CreateSpellCard("PLAYER",spr_reimu_portrait,0,"Spirit Sign \"Fantasy Seal\"");
				sound_ObjSound_Play(se_cat00);
				sound_ObjSound_Play(se_nep00);
				var inst = playermain_CreatePlayerShotA1(x,y,3,0,1,9999,spr_reimu_bomb_1,-1)
				prop_ObjShot_SetEraseShot(inst,true)
				prop_ObjShot_SetDeleteFrame(inst,300);
				with(inst) {
					set_function = function() {
						image_xscale -= 0.003;
						image_yscale -= 0.003;
					}
					var object_array = [obj_enemy,obj_enemy_bullet];
					for(var i = 0; i < array_length(object_array); i++) {
						if instance_exists(object_array[i]) {
							move_ObjMove_SetAngleAtTarget(inst,object_array[i]);
						}
					}
				}
			}
			break;
		case "CHAR_MARISA":
			sprite_index = spr_marisa;
			turret_index = spr_marisa_turret;
			shoot_sequence = function() {
				if reload mod 9 == 0 {
					sound_ObjSound_Play(se_plst00);
					var nrmT = 30 - (action_focus * 15)
					var sm_nrmT = 15 - (action_focus * 7.5)
					var twistT = floor(global.player_stats[play_id].power_items / 25);
					var angleT = (90 + (twistT * sm_nrmT))
					repeat(1 + twistT) {
						playermain_CreatePlayerShotA1(x + lengthdir_x(16,angleT),y + lengthdir_y(16,angleT),4,90,5,1,spr_marisa_amulet_1,-1)
						angleT -= (nrmT)
					}
				}
				if global.player_stats[play_id].power_items >= 12 and reload mod 240 == 0 {
					var inst = playermain_CreatePlayerShotA1(x + lengthdir_x(16,turret_pos),y + lengthdir_y(8,turret_pos),0,90,1,9999,spr_marisa_amulet_2,-1)
					prop_ObjShot_SetDeleteFrame(inst,120);
					//show_debug_message(inst.y_pos / inst.sprite_width);
					with(inst) {
						set_function = function() {
							with(obj_player) {
								if sprite_index == spr_marisa { other.tag_along = id }
							}
							//show_debug_message(y_pos / sprite_get_width(sprite_index));
							image_xscale = y_pos / sprite_get_width(sprite_index);
							x_pos = tag_along.x_pos + lengthdir_x(16,tag_along.turret_pos)
							y_pos = tag_along.y_pos + lengthdir_y(8,tag_along.turret_pos)
						}
					}
					inst = playermain_CreatePlayerShotA1(x + lengthdir_x(16,180 - turret_pos),y + lengthdir_y(8,180 - turret_pos),0,90,1,9999,spr_marisa_amulet_2,-1)
					prop_ObjShot_SetDeleteFrame(inst,120);
					//show_debug_message(inst.y_pos / inst.sprite_width);
					with(inst) {
						set_function = function() {
							with(obj_player) {
								if sprite_index == spr_marisa { other.tag_along = id }
							}
							//show_debug_message(y_pos / sprite_get_width(sprite_index));
							image_xscale = y_pos / sprite_get_width(sprite_index);
							x_pos = tag_along.x_pos + lengthdir_x(16,180 - tag_along.turret_pos)
							y_pos = tag_along.y_pos + lengthdir_y(8,180 - tag_along.turret_pos)
						}
					}
				}
				reload++;
			}
			bomb_sequence = function() {
				sound_ObjSound_Play(se_cat00);
				sound_ObjSound_Play(se_nep00);
				var inst = playermain_CreatePlayerShotA1(x,y,0,90,1,9999,spr_marisa_bomb_1,-1)
				prop_ObjShot_SetEraseShot(inst,true)
				prop_ObjShot_SetDeleteFrame(inst,300);
				with(inst) {
					set_function = function() {
						with(obj_player) {
							if sprite_index == spr_marisa { other.tag_along = id }
						}
						//show_debug_message(y_pos / sprite_get_width(sprite_index));
						image_xscale = y_pos / sprite_get_width(sprite_index);
						x_pos = tag_along.x_pos
						y_pos = tag_along.y_pos
					}
				}
			}
			break;
	}
}