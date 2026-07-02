function scr_ritsuu_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_RITSUU
	
	//Main attacks
	attack_ritsuu_main_01 = function() {
		if count mod 60 == 0 {
			sound_ObjSound_Play(se_tan01)
			var baseAngle = irandom_range(0,360)
			for(var i = 0; i < 12 + (global.main_stats.difficulty * 4); i++) {
				var graphic;
				if i mod 2 == 0 { graphic = 5 } else { graphic = 2 }
				
				var inst = shot_CreateShotA1(x,y,1,(360 / (12 + (global.main_stats.difficulty * 4))) * i,spr_danmaku_seed_s,10,graphic);
				with(inst) {
					set_function = function() {
						if count == 40 {
							if image_index == 5 {
								direction = point_direction(x,y,obj_player.x,obj_player.y);
								speed = 2.25;
							}
							else {
								direction += 45;
								speed = 0.6;
							}
						}
					}
				}
			}
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(48,96),30);
		}
	}
	attack_ritsuu_main_02 = function() {
		if count == 0 { image_alpha = 1; }
		if count mod 45 == 0 {
			repeat(12 + (global.main_stats.difficulty * 4)) {
				var leftAngle = 225 + irandom_range(10,50);
				var rightAngle = 315 - irandom_range(10,50);
				
				var inst = shot_CreateShotA1(x_pos - 20,y,random_range(0.75,1.25),leftAngle,spr_danmaku_ball_s1,10,0)
				with(inst) {
					set_function = function() {
						if count == 30 {
							if image_index == 0 { image_index = 12; }
							else if image_index == 12 { image_index = 10; }
							else if image_index == 10 { image_index = 0; }
						}
					}
				}
				inst = shot_CreateShotA1(x_pos + 20,y,random_range(0.75,1.25),rightAngle,spr_danmaku_ball_s1,10,0)
				with(inst) {
					set_function = function() {
						if count == 30 {
							if image_index == 0 { image_index = 12; }
							else if image_index == 12 { image_index = 10; }
							else if image_index == 10 { image_index = 0; }
						}
					}
				}
			}
		}
		if count mod 90 == 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(48,96),60);
		}
	}
	
	//Spell cards
	spell_card_ritsuu_01 = function() {
		if count == 0 { 
			timer = 40;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ritsuu_portrait,0,_load_file.enemy_spell.SPELL_RITSUU_01,spr_ritsuu_spell)
			global.main_stats.current_spell = "SPELL_RITSUU_01"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
			speed = 0;
			move_mode = false;
		}
		
		if count >= 60 {
			if count mod (7 - global.main_stats.difficulty) == 0 {
				sound_ObjSound_Play(se_tan02);
				var inst;
				inst = shot_CreateShotA1(x + 16,y,1,irandom_range(0,360),spr_danmaku_seed_s,5,1);
				move_ObjMove_SetAngularVelocity(inst,random_range(-1,1));
				inst = shot_CreateShotA1(x - 16,y,1,irandom_range(0,360),spr_danmaku_seed_s,5,5);
				move_ObjMove_SetAngularVelocity(inst,random_range(-1,1));
			}
		}
		if count == 180 {
			sound_ObjSound_Play(se_boon01);
			move_ObjMove_SetX(self,32);
			move_ObjMove_SetY(self,144);
		}
		if count == 360 {
			sound_ObjSound_Play(se_boon01);
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,240);
		}
		if count == 540 {
			sound_ObjSound_Play(se_boon01);
			move_ObjMove_SetX(self,224);
			move_ObjMove_SetY(self,144);
		}
		if count == 720 {
			sound_ObjSound_Play(se_boon01);
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
		}
		if count == 900 {
			sound_ObjSound_Play(se_boon01);
			move_ObjMove_SetX(self,32);
			move_ObjMove_SetY(self,144);
			count = 180;
		}
	}
	spell_card_ritsuu_02 = function() {
		if count == 0 { 
			timer = 40;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ritsuu_portrait,0,_load_file.enemy_spell.SPELL_RITSUU_02,spr_ritsuu_spell)
			global.main_stats.current_spell = "SPELL_RITSUU_02"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
			speed = 0;
			move_mode = false;
			image_alpha = 0.5;
		}
		
		if count >= 60 {
			if count mod 6 == 0 {
				repeat(global.main_stats.difficulty + 1) {
					var inst = shot_CreateShotA1(random_range(8,248),8,random_range(0.5,1),270 + irandom_range(-15,15),spr_danmaku_ball_m1,10,choose(10,12,15))
					inst_Obj_SetVisible(inst,0.5);
					with(inst) {
						set_function = function() {
							if count mod 20 == 0 {
								direction += sin(count) * 10;
							}
						}
					}
				}
			}
		}
	}
	spell_card_ritsuu_03 = function() {
		if count == 0 { 
			timer = 40;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ritsuu_portrait,0,_load_file.enemy_spell.SPELL_RITSUU_03,spr_ritsuu_spell)
			global.main_stats.current_spell = "SPELL_RITSUU_03"
			speed = 0;
			move_mode = false;
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
		}
		
		if count >= 60 {
			if count mod (7 - global.main_stats.difficulty) == 0 {
				sound_ObjSound_Play(se_tan02);
				shot_CreateShotA1(8,irandom_range(24,264),random_range(0.5,1.25),irandom_range(-5,5),spr_danmaku_seed_s,5,0);
				shot_CreateShotA1(248,irandom_range(24,264),random_range(0.5,1.25),irandom_range(175,185),spr_danmaku_seed_s,5,1);
			}
			
			if count mod 120 == 0 {
				speed = 0;
				move_mode = false;
				move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
			}
		}
	}
	spell_card_ritsuu_04 = function() {
		if count == 0 { 
			timer = 40;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ritsuu_portrait,0,_load_file.enemy_spell.SPELL_RITSUU_04,spr_ritsuu_spell)
			global.main_stats.current_spell = "SPELL_RITSUU_04"
			speed = 0;
			move_mode = false;
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
			baseAngle = 0;
		}
		
		if count mod 25 == 0 {
			var angleT = 0;
			var i = 0;
			repeat(18 + (global.main_stats.difficulty * 6)) {
				var inst = shot_CreateShotA1(x,y,0.5 + (i * 0.2),baseAngle + angleT,spr_danmaku_ball_s1,10,0);
				with(inst) {
					set_function = function() {
						if count == 30 {
							if image_index == 0 { image_index = 12; }
							else if image_index == 12 { image_index = 10; }
							else if image_index == 10 { image_index = 0; }
						}
					}
				}
				i++;
				angleT += 360 / (18 + (global.main_stats.difficulty * 6))
				baseAngle += 13.7;
			}
		}
		if count mod 100 = 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(48,96),60);
		}
	}
	spell_card_ritsuu_05() = function() {
		if count == 0 { 
			timer = 40;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ritsuu_portrait,0,_load_file.enemy_spell.SPELL_RITSUU_05,spr_ritsuu_spell)
			global.main_stats.current_spell = "SPELL_RITSUU_05"
			speed = 0;
			move_mode = false;
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
			baseAngle = 270;
		}
		if count mod 30 == 0 {
			repeat(6 + (global.main_stats.difficulty * 2)) {
				var inst = shot_CreateShotA1(x,y,random_range(1,1.75),baseAngle + irandom_range(-45,45),spr_danmaku_ball_m1,10,choose(8,15))
				prop_ObjShot_SetAutoDelete(inst,false)
				with(inst) {
					maxWraps = 3;
					didWrap = false;
					set_function = function() {
						 if x_pos < 8 {
							x_pos = 248;
							didWrap = true;
						 }
						 else if x_pos > 248 {
							x_pos = 8;
							didWrap = true;
						 }
						 if y_pos < 8 {
							y_pos = 280;
							didWrap = true;
						 }
						 else if y_pos > 280 {
							y_pos = 8;
							didWrap = true;
						 }
						 if didWrap == true {
							maxWraps--;
							if maxWraps == 0 { instance_destroy() }
							else { didWrap = false; }
						 }
					}
				}
			}
			baseAngle += sin(timer * 10) * 15;
		}
	}
}