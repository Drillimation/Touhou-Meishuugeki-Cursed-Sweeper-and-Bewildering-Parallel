function scr_koakuma_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_KOAKUMA
	
	//Spell cards
	spell_card_koakuma_01 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_koakuma_portrait,0,_load_file.enemy_spell.SPELL_KOAKUMA_01,spr_koakuma_spell)
			global.main_stats.current_spell = "SPELL_KOAKUMA_01"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
		}
		
		if count >= 60 {
			if count < 260 {
				if count < 160 and count mod 10 == 0 {
					sound_ObjSound_Play(se_tan01)
					repeat(5 + global.main_stats.difficulty) {
						shot_CreateShotA1(x,y,1,sweep_dir,spr_danmaku_ball_l,5,11)
						sweep_dir += 360/(5 + global.main_stats.difficulty)
					}
					sweep_dir -= 10;
				}
				if count > 160 and count mod 10 == 0 {
					sound_ObjSound_Play(se_tan01)
					repeat(5 + global.main_stats.difficulty) {
						shot_CreateShotA1(x,y,1,sweep_dir,spr_danmaku_ball_l,5,11)
						sweep_dir += 360/(5 + global.main_stats.difficulty)
					}
					sweep_dir += 10;
				}
			}
			if count == 260 {
				move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
				sweep_dir = 0;
			}
			if count >= 260 and count < 300 {
				if count mod 5 == 0 {
					sound_ObjSound_Play(se_tan02)
					repeat(5 + global.main_stats.difficulty) {
						var inst = shot_CreateShotA1(x,y,random_range(0.5,1),irandom_range(0,360),spr_danmaku_kunai,5,10);
						with(inst) {
							set_function = function() {
								if count == 80 {
									dir = irandom_range(165,345);
									acceleration = 0.01;
									speedcap = true;
									maxspeed = random_range(1.5,2);
								}
							}
						}
					}
				}
			}
			if count == 360 {
				move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
				sweep_dir = 0;
			}
			if count >= 360 and count < 400 {
				sound_ObjSound_Play(se_tan01)
				if count mod 5 == 0 {
					repeat(5 + global.main_stats.difficulty) {
						shot_CreateShotA1(x,y,random_range(0.5,1),irandom_range(0,360),spr_danmaku_kunai,5,10);
					}
				}
			}
			if count == 430 {
				count = 30;
			}
		}
	}
	spell_card_koakuma_02 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_koakuma_portrait,0,_load_file.enemy_spell.SPELL_KOAKUMA_02,spr_koakuma_spell)
			global.main_stats.current_spell = "SPELL_KOAKUMA_02"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
			sweep_dir2 = 0;
		}
		
		if count >= 60 and count < 140 {
			if count mod 4 == 0 {
				sound_ObjSound_Play(se_tan01)
				for(var i = 1; i < 11; i++) {
					shot_CreateShotA1(x,y,0.5 + (i / 6),sweep_dir + sweep_dir2,spr_danmaku_ball_s1,5,0);
					shot_CreateShotA1(x,y,0.5 + (i / 6),sweep_dir - sweep_dir2,spr_danmaku_ball_s1,5,0);
					sweep_dir += 360/10
				}
				sweep_dir2 += 5;
			}
		}
		if count >= 180 and count < 360 {
			if count mod 90 == 0 {
				sound_ObjSound_Play(se_tan01)
				var angleT = 0;
				repeat(12 + (global.main_stats.difficulty * 2)) {
					var inst = shot_CreateShotA1(x,y,1,angleT,spr_danmaku_ball_m1,5,1);
					prop_ObjShot_SetAutoDelete(inst,true)
					with(inst) {
						set_function = function() {
							if count == 60 {
								sound_ObjSound_Play(se_kira02)
								spd = 0;
								dir += 180;
							}
							if count == 80 {
								sound_ObjSound_Play(se_kira00)
								prop_ObjShot_SetAutoDelete(self,false)
								spd = 1;
								angular_velocity = 0.5;
							}
						}
					}
					angleT += 360 / (12 + (global.main_stats.difficulty * 2));
				}
			}
		}
		if count == 220 and count == 300 {
			var angleT = 0;
			sound_ObjSound_Play(se_tan01)
			repeat(12 + (global.main_stats.difficulty * 2)) {
				var inst = shot_CreateShotA1(x,y,1,angleT,spr_danmaku_ball_m1,5,1);
				prop_ObjShot_SetAutoDelete(inst,true)
				with(inst) {
					if count == 60 {
						sound_ObjSound_Play(se_kira02)
						spd = 0;
						dir += 180;
					}
					if count == 80 {
						sound_ObjSound_Play(se_kira00)
						prop_ObjShot_SetAutoDelete(self,false)
						spd = 1;
						angular_velocity = -0.5;
					}
				}
				angleT += 360 / (12 + (global.main_stats.difficulty * 2));
			}
		}
		if count == 400 {
			count = 60;
		}
	}
	spell_card_koakuma_03 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_koakuma_portrait,0,_load_file.enemy_spell.SPELL_KOAKUMA_03,spr_koakuma_spell)
			global.main_stats.current_spell = "SPELL_KOAKUMA_03"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
		}
		
		if count mod 120 == 0 and count > 0 {
			sound_ObjSound_Play(se_tan01);
			var ez = 0;
			repeat(10 + (global.main_stats.difficulty * 2)) {
				for(var i = 0; i < 4; i++) {
					var inst = shot_CreateShotA1(8 + (i * 8),24 + ez,0,0,spr_danmaku_ball_s1,60,15);
					with(inst) {
						set_function = function() {
							if count == 120 {
								sound_ObjSound_Play(se_kira00);
								spd = 1;
							}
						}
					}
					inst = shot_CreateShotA1(240 - (i * 8),24 + ez,0,180,spr_danmaku_ball_s1,60,15);
					with(inst) {
						set_function = function() {
							if count == 120 {
								sound_ObjSound_Play(se_kira00);
								spd = 1;
							}
						}
					}
					inst = shot_CreateShotA1(8 + ez,24 + (i * 8),0,270,spr_danmaku_ball_s1,60,15);
					with(inst) {
						set_function = function() {
							if count == 120 {
								sound_ObjSound_Play(se_kira00);
								spd = 1;
							}
						}
					}
					inst = shot_CreateShotA1(8 + ez,264 - (i * 8),0,90,spr_danmaku_ball_s1,60,15);
					with(inst) {
						set_function = function() {
							if count == 120 {
								sound_ObjSound_Play(se_kira00);
								spd = 1;
							}
						}
					}
				}
				ez += 240 / (10 + (global.main_stats.difficulty * 2))
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(48,144),60);
		}
	}
	spell_card_koakuma_04 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_koakuma_portrait,0,_load_file.enemy_spell.SPELL_KOAKUMA_04,spr_koakuma_spell)
			global.main_stats.current_spell = "SPELL_KOAKUMA_04"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,144);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
			baseAngle1 = 0;
			baseAngle2 = 0;
		}
		
		if count >= 60 {
			if count mod 10 == 0 {
				sound_ObjSound_Play(se_tan01);
				var angleT = 0;
				repeat(3 + global.main_stats.difficulty) {
					shot_CreateShotA1(x,y,1.25,baseAngle1 + angleT,spr_danmaku_ball_s1,5,0);
					angleT += 360 / (3 + global.main_stats.difficulty);
				}
				baseAngle1 += 8;
			}
			if count mod 20 == 0 {
				sound_ObjSound_Play(se_lazer00);
				var angleT = 0;
				repeat(3 + global.main_stats.difficulty) {
					shot_CreateLooseLaserA1(x,y,1.75,baseAngle2 + angleT,1.6,1,spr_danmaku_laser,5,15)
					angleT += 360 / (3 + global.main_stats.difficulty);
				}
				baseAngle2 -= 16;
			}
		}
	}
}