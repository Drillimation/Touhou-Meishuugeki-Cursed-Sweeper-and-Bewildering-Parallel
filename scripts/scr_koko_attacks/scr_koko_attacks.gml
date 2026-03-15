function scr_koko_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_KOKO
	
	//Main attacks
	attack_koko_main_1 = function() {
		if count == 0 { 
			timer = 35; 
			x_pos = 128; 
			y_pos = 64; 
			speed = 0; 
			move_mode = false;
			angleS = 0;
			angleT = 0;
			obj_count = 0;
		}
		
		if count mod 5 == 0 {
			sound_ObjSound_Play(se_tan02);
			var angle_OSC = 0;
			repeat(6 + (global.main_stats.difficulty * 2)) {
				var ex = x + lengthdir_x(64,angle_OSC);
				var ey = y + lengthdir_y(32,angle_OSC);
				shot_CreateShotA1(ex,ey,1,angleS + angle_OSC,spr_danmaku_bullet,5,2);
				var ex2 = x + lengthdir_x(64,angle_OSC);
				var ey2 = y + lengthdir_y(32,angle_OSC);
				shot_CreateShotA1(ex2,ey2,1,angleT + angle_OSC,spr_danmaku_bullet,5,15);
				angle_OSC += 360 / (6 + (global.main_stats.difficulty * 2))
			}
			angleS += (obj_count * 0.01) * 120;
			angleT -= (obj_count * 0.01) * 120;
			obj_count++;
		}
		
		if count == 300 {
			sound_ObjSound_Play(se_kira00);
			var angleT2 = point_direction(x,y,obj_player.x,obj_player.y);
			repeat((global.main_stats.difficulty * 4) + 12) {
				var inst = shot_CreateShotA1(x,y,0.5,angleT2,spr_danmaku_amulet,5,0);
				inst_ObjRender_SetScaleX(inst,2)
				inst_ObjRender_SetScaleY(inst,2)
				move_ObjMove_SetAcceleration(inst,0.01);
				angleT2 += 360 / ((global.main_stats.difficulty * 4) + 12);
			}
			speed = 0;
			move_mode = false;
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
		
		if count == 360 {
			speed = 0;
			move_mode = false;
			count = 1;
		}
	}
	attack_koko_main_2 = function() {
		if count == 0 { 
			timer = 35; 
			x_pos = 16; 
			y_pos = 64; 
			speed = 0; 
			move_mode = false;
		}
		
		if count == 15 {
			if x_pos >= 128 { ex = 16 } else { ex = 240 }
			ey = irandom_range(32,144)
			move_ObjMove_SetDestAtSpeed(self,ex,ey,2);
		}
		
		if count >= 16 {
			if point_distance(x_pos,y_pos,ex,ey) > 4 {
				if count mod (6 - global.main_stats.difficulty) == 0 {
					sound_ObjSound_Play(se_tan02)
					var inst = shot_CreateShotA1(x,y,0,0,spr_danmaku_ball_s2,5,10);
					with(inst) {
						set_function = function() {
							if count == 120 {
								sound_ObjSound_Play(se_kira02);
								direction = point_direction(x,y,obj_player.x,obj_player.y) + random_range(-5,5);
								speed = 2;
							}
						}
					}
				}
			}
			else {
				move_mode = false;
				speed = 0;
				count = 10;
			}
		}
	}
	
	//Spell cards
	spell_card_koko_01 = function() {
		if count == 0 { 
			timer = 40;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_koko_portrait,0,_load_file.enemy_spell.SPELL_KOKO_01,spr_koko_spell)
			global.main_stats.current_spell = "SPELL_KOKO_01"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
			speed = 0;
			move_mode = false;
		}
		
		if count >= 60 {
			if count mod 20 == 0 {
				sound_ObjSound_Play(se_tan02)
				var angleT = 0;
				repeat(20 + (global.main_stats.difficulty * 4)) {
					var col_00
					if count mod 40 == 0 { col_00 = 15 } else { col_00 = 2 }
					var inst = shot_CreateShotA1(x,y,1.20,angleT,spr_danmaku_ball_s1,5,col_00);
					prop_ObjShot_SetAutoDelete(inst,false)
					with(inst) {
						set_function = function() {
							if count < 120 {
								speed -= 0.01;
							}
							if count == 120 {
								sound_ObjSound_Play(se_kira00)
								direction = point_direction(obj_koko.x,obj_koko.y,obj_player.x,obj_player.y);
								speed = 0.75;
								prop_ObjShot_SetAutoDelete(self,true)
							}
							if count >= 120 {
								if image_xscale != 0 and image_yscale != 0 {
									image_xscale -= 0.005
									image_yscale -= 0.005
								}
								else {
									instance_destroy();
								}
							}
						}
					}
					angleT += (360 / (20 + (global.main_stats.difficulty * 4)))
				}
			}
		}
		
		if count >= 240 and count <= 259 {
			if count mod 2 == 0 {
				sound_ObjSound_Play(se_msl)
				repeat(2 + global.main_stats.difficulty) {
					var angleT = point_direction(x,y,obj_player.x,obj_player.y)
					shot_CreateShotA1(x,y,1.5,angleT + random_range(-10,10),spr_danmaku_bullet,5,choose(2,15));
				}
			}
		}
		
		if count == 300 {
			speed = 0;
			move_mode = false;
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
		
		if count == 360 {
			speed = 0;
			move_mode = false;
			count = 59;
		}
	}
	spell_card_koko_03 = function() {
		if count == 0 { 
			timer = 40;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_koko_portrait,0,_load_file.enemy_spell.SPELL_KOKO_03,spr_koko_spell)
			global.main_stats.current_spell = "SPELL_KOKO_03"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
			speed = 0;
			move_mode = false;
		}
		
		if count >= 60 {
			if count mod 20 == 0 {
				repeat(20 + (global.main_stats.difficulty * 4)) {
					sound_ObjSound_Play(se_tan02)
					var col_00
					if count mod 40 == 0 { col_00 = 0 } else { col_00 = 2 }
					var inst = shot_CreateShotA1(x,y,1.20,angleT,spr_danmaku_amulet,5,col_00);
					with(inst) {
						if count mod 40 == 0 {
							set_function = function() {
								if count >= 0 and count <= 29 {
									direction += 3;
								}
								if count >= 30 and count <= 59 {
									direction -= 3;
								}
								if count == 60 {
									count = 0;
								}
							}
						}
						else {
							set_function = function() {
								if count >= 0 and count <= 29 {
									direction -= 2;
								}
								if count >= 30 and count <= 59 {
									direction += 2;
								}
								if count == 60 {
									count = 0;
								}
							}
						}
					}
					angleT += (360 / (20 + (global.main_stats.difficulty * 4)))
				}
			}
			
			if count == 300 {
				speed = 0;
				move_mode = false;
				move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
			}
		
			if count == 360 {
				speed = 0;
				move_mode = false;
				count = 59;
			}
		}
	}
	spell_card_koko_05 = function() {
		if count == 0 { 
			timer = 40;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_koko_portrait,0,_load_file.enemy_spell.SPELL_KOKO_05,spr_koko_spell)
			global.main_stats.current_spell = "SPELL_KOKO_05"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,144);
			speed = 0;
			move_mode = false;
		}
		
		if count >= 60 {
			if count mod 60 == 0 {
				repeat(5 + global.main_stats.difficulty) {
					sound_ObjSound_Play(se_tan02)
					var inst = shot_CreateShotA1(8,irandom_range(24,264),0,0,spr_danmaku_seed_s,5,0);
					with(inst) {
						set_function = function(){
							if count == 0 { angleT = 0 }
							if count <= 7 {
								if count mod 2 == 0 {
									shot_CreateShotA1(x,y + angleT,1.5,0,sprite_index,5,image_index)
									shot_CreateShotA1(x,y - angleT,1.5,0,sprite_index,5,image_index)
									angleT += 1;
								}
							}
							if count >= 8 {
								if count mod 2 == 0 {
									shot_CreateShotA1(x,y + angleT,1.5,0,sprite_index,5,image_index)
									shot_CreateShotA1(x,y - angleT,1.5,0,sprite_index,5,image_index)
									angleT -= 1;
								}
							}
							if count == 16 {
								instance_destroy();
							}
						}
					}
					inst = shot_CreateShotA1(248,irandom_range(24,264),0,180,spr_danmaku_seed_s,5,2);
					with(inst) {
						set_function = function(){
							if count == 0 { angleT = 0 }
							if count <= 7 {
								if count mod 2 == 0 {
									shot_CreateShotA1(x,y + angleT,1.5,180,sprite_index,5,image_index)
									shot_CreateShotA1(x,y - angleT,1.5,180,sprite_index,5,image_index)
									angleT += 1;
								}
							}
							if count >= 8 {
								if count mod 2 == 0 {
									shot_CreateShotA1(x,y + angleT,1.5,180,sprite_index,5,image_index)
									shot_CreateShotA1(x,y - angleT,1.5,180,sprite_index,5,image_index)
									angleT -= 1;
								}
							}
							if count == 16 {
								instance_destroy();
							}
						}
					}
				}
			}
		}
	}
}