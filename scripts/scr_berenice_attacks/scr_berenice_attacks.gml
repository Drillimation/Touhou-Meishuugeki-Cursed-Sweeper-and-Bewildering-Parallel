function scr_berenice_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_BERENICE
	
	//Main attacks
	attack_berenice_main_01 = function() {
		if count == 0 {
			timer = 60;
			speed = 0;
			move_mode = false;
		}
		if count mod 60 == 0 {
			sound_ObjSound_Play(se_tan01)
			var angleT = irandom_range(0,360);
			repeat (12 + (global.main_stats.difficulty * 4)) {
				shot_CreateShotA1(x,y,1,angleT,spr_danmaku_ball_m1,10,15)
				angleT += 360 / (12 + (global.main_stats.difficulty * 4))
			}
		}
		if count mod 20 == 0 {
			sound_ObjSound_Play(se_tan02)
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			repeat(3 + global.main_stats.difficulty) {
				shot_CreateShotA1(x,y,1.75,angleT + irandom_range(-5,5),spr_danmaku_bullet,5,12);
			}
		}
		if count mod 240 == 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,128),60);
		}
	}
	attack_berenice_main_02 = function() {
		if count == 0 {
			timer = 60;
			speed = 0;
			move_mode = false;
		}
		move_ObjMove_SetX(self,128 + 40 * cos(count * 2))
		move_ObjMove_SetY(self,96 - 60 + 20 * sin(count * 4))
		
		if count mod 7 - global.main_stats.difficulty == 0 {
			sound_ObjSound_Play(se_tan01);
			var inst = shot_CreateShotA1(x,y,random_range(0.5,1),choose(90,270) + irandom_range(-20,20),spr_danmaku_seed_s,20,0);
			move_ObjMove_SetAngularVelocity(inst,random_range(-0.5,0.5))
		}
		
		if count mod 120 == 0 {
			sound_ObjSound_Play(se_kira01)
			for(var i = 0; i < 20 + (global.main_stats.difficulty * 4); i++) {
				shot_CreateShotA1(x,y,1.25,i * (360/(20 + (global.main_stats.difficulty * 4))),spr_danmaku_star_m,10,10);
			}
		}
	}
	attack_berenice_main_03 = function() {
		if count == 0 {
			timer = 60;
			speed = 0;
			move_mode = false;
		}
		if count mod 45 == 0 {
			sound_ObjSound_Play(se_tan01)
			var angleT = irandom_range(0,360);
			repeat(12 + (global.main_stats.difficulty * 3)) {
				var inst = shot_CreateShotA1(x,y,2,angleT,spr_danmaku_ball_m2,10,15);
				inst_ObjRender_SetScaleX(inst,2);
				with(inst) {
					set_function = function() {
						if count == 40 {
							sound_ObjSound_Play(se_kira02)
							move_ObjMove_SetSpeed(self,0);
						}
						if count == 70 {
							sound_ObjSound_Play(se_kira00)
							move_ObjMove_SetAngle(self,point_direction(x,y,obj_player.x,obj_player.y))
							move_ObjMove_SetSpeed(self,3)
						}
					}
				}
				angleT += 360 / (12 + (global.main_stats.difficulty * 3));
			}
		}
		if count mod 5 == 0 {
			sound_ObjSound_Play(se_tan02)
			repeat(2 + global.main_stats.difficulty) {
				shot_CreateShotA1(irandom_range(0,256),0,random_range(1,2.5),270,spr_danmaku_pellet,0,15);
			}
		}
		if count mod 240 == 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,128),60);
		}
	}
	
	//Spell cards
	spell_card_berenice_01 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_BERENICE_01,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_BERENICE_01"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
			
			countT = 0;
		}
		
		if count >= 60 {
			if count mod 120 == 0 {
				for(var i = 0; i < 3; i++) {
					var bloomX = x_pos + 75 * cos((i * 120) + (countT * 20))
					var bloomY = y_pos + 50 * sin((i * 120) + (countT * 20))
					var angleBase = irandom_range(0,360)
					
					for(var j = 0; j < 5; j++) {
						for(var k = 0; k < 12; k++) {
							var angleT = angleBase + ((k * (360 / 12)) + (j * 5))
							var speedT = 0.75 + (j * 0.2);
							var inst = shot_CreateShotA1(bloomX,bloomY,speedT,angleT,spr_danmaku_seed_s,20,0);
							if k mod 2 == 0 {
								move_ObjMove_SetAngularVelocity(inst,0.1 * 1)
							}
							else {
								move_ObjMove_SetAngularVelocity(inst,0.1 * -1)
							}
						}
					}
				}
				countT++;
			}
			if count mod 10 - (global.main_stats.difficulty * 2) == 0 {
				var angleT = 270 + (15 * sin(count * 5))
				shot_CreateShotA1(x,y,1.5,angleT,spr_danmaku_bullet,10,12);
			}
		}
	}
	spell_card_berenice_02 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_BERENICE_02,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_BERENICE_02"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		if count >= 60 {
			if count mod 80 < 40 and count mod 4 == 0 {
				sound_ObjSound_Play(se_tan01)
				var baseAngle = point_direction(x,y,obj_player.x,obj_player.y);
				for(var i = -2; i < 3; i++) {
					shot_CreateShotA1(x,y,2.5,baseAngle + (i * 15),spr_danmaku_pellet,5,0);
				}
			}
			if count mod 120 == 0 {
				sound_ObjSound_Play(se_kira00);
				for(var i = 0; i < 20 + global.main_stats.difficulty; i++) {
					var angleT = i * (360 / (20 + global.main_stats.difficulty));
					var inst = shot_CreateShotA1(x,y,0.75,angleT,spr_danmaku_ball_m1,20,15);
					with(inst) {
						set_function = function() {
							if count mod 30 == 0 {
								sound_ObjSound_Play(se_kira02)
								move_ObjMove_SetSpeed(self,speed + random_range(-0.25,0.75))
								move_ObjMove_SetAngle(self,direction + random_range(-10,10))
							}
						}
					}
				}
			}
			if count mod 15 - global.main_stats.difficulty == 0 {
				sound_ObjSound_Play(se_tan02)
				shot_CreateShotA1(irandom_range(0,255),0,random_range(0.5,1.5),270 + irandom_range(-10,10),spr_danmaku_pellet,0,15);
			}
		}
	}
	spell_card_berenice_03 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_BERENICE_03,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_BERENICE_03"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		
		if count > 60 {
			if count mod 60 == 0 {
				sound_ObjSound_Play(se_tan01);
				for(var i = 0; i < (20 + global.main_stats.difficulty); i++) {
					var angleT = (8 * (360/(20 + global.main_stats.difficulty))) + (count / 2);
					shot_CreateShotA1(x,y,1,angleT,spr_danmaku_ball_l,10,15);
				}
			}
			if count mod 120 == 0 {
				var baseAngle = irandom_range(0,360);
				for(var i = 0; i < 4; i++) {
					var angleT = baseAngle + (i * 90);
					var inst = shot_CreateStraightLaserA1(x,y,angleT,18,1,60,spr_danmaku_laser,20,12);
					with(inst) {
						angular_velocity = 30 / 60;
					}
				}
			}
		}
	}
}