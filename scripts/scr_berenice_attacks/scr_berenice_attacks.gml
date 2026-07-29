function scr_berenice_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_BERENICE
	
	//Main attacks
	attack_berenice_main_01 = function() {
		if count == 0 {
			timer = 60;
			spd = 0;
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
			spd = 0;
			move_mode = false;
		}
		x_pos = (64 * dcos(count * 1)) + 128
		y_pos = (32 * dsin(count * 1 * 2)) + 96
		
		if count mod 6 - global.main_stats.difficulty == 0 {
			sound_ObjSound_Play(se_tan01);
			repeat(2) {
				var inst = shot_CreateShotA1(x,y,random_range(0.5,1),270 + irandom_range(-20,20),spr_danmaku_seed_s,20,0);
				move_ObjMove_SetAngularVelocity(inst,random_range(-0.5,0.5))
			}
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
			spd = 0;
			move_mode = false;
		}
		if count mod 90 == 0 {
			sound_ObjSound_Play(se_tan01)
			var angleT = irandom_range(0,360);
			repeat(12 + (global.main_stats.difficulty * 3)) {
				var inst = shot_CreateShotA1(x,y,2,angleT,spr_danmaku_ball_m2,10,15);
				//inst_ObjRender_SetScaleX(inst,2);
				with(inst) {
					set_function = function() {
						if count == 40 {
							sound_ObjSound_Play(se_kira02)
							move_ObjMove_SetSpeed(self,0);
						}
						if count == 70 {
							sound_ObjSound_Play(se_kira00)
							move_ObjMove_SetAngle(self,point_direction(x,y,obj_player.x,obj_player.y))
							move_ObjMove_SetSpeed(self,1.5)
						}
					}
				}
				angleT += 360 / (12 + (global.main_stats.difficulty * 3));
			}
		}
		if count mod 8 == 0 {
			sound_ObjSound_Play(se_tan02)
			repeat(1 + global.main_stats.difficulty) {
				shot_CreateShotA1(irandom_range(0,256),0,random_range(0.5,1.25),270,spr_danmaku_pellet,0,15);
			}
		}
		if count mod 240 == 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,128),60);
		}
	}
	attack_berenice_main_04 = function() {
		if count == 0 {
			timer = 60;
			spd = 0;
			move_mode = false;
			angleT = 0;
			angleX = 1;
		}
		if count mod 20 == 0 {
			sound_ObjSound_Play(se_tan02)
			repeat(20 + (global.main_stats.difficulty * 4)) {
				shot_CreateShotA1(x,y,1,angleT + angleX,spr_danmaku_ball_s1,10,15);
				angleT += 360 / (20 + (global.main_stats.difficulty * 4))
			}
			angleT = (angleX * 0.01) * 120;
			angleX++;
		}
	}
	attack_berenice_main_05 = function() {
		if count == 0 {
			timer = 60;
			spd = 0;
			move_mode = false;
		}
		if count mod (8 - global.main_stats.difficulty) == 0 {
			sound_ObjSound_Play(se_tan02)
			var baseAngle = point_direction(x,y,obj_player.x,obj_player.y)
			repeat(3) {
				shot_CreateShotA1(x,y,random_range(0.75,1.5),baseAngle + irandom_range(-60,60),spr_danmaku_shard,5,12)
				shot_CreateShotA1(irandom_range(8,248),0,1,270,spr_danmaku_bullet,20,12);
			}
		}
	}
	attack_berenice_main_06 = function() {
		if count == 0 {
			timer = 60;
			spd = 0;
			move_mode = false;
			angleT = 0;
		}
		if count mod 8 == 0 {
			sound_ObjSound_Play(se_tan02)
			repeat(4 + global.main_stats.difficulty) {
				shot_CreateShotA1(x,y,0.6,angleT,spr_danmaku_butterfly,20,0);
				angleT += 360 / (4 + global.main_stats.difficulty);
			}
			angleT += 7.5;
		}
		if count mod 60 == 0 {
			sound_ObjSound_Play(se_kira00)
			var baseAngle = point_direction(x,y,obj_player.x,obj_player.y);
			var speedT = 2;
			repeat(4) {
				for(var i = -1 - global.main_stats.difficulty; i < 2 + global.main_stats.difficulty; i++) {
					shot_CreateShotA1(x,y,speedT,baseAngle + (i * 10),spr_danmaku_dagger,0,12)
				}
				speedT -= 0.25;
			}
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
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
			
			countT = 0;
		}
		
		if count >= 60 {
			if count mod 120 == 0 {
				sound_ObjSound_Play(se_kira01)
				for(var i = 0; i < 4; i++) {
					var bloomX = x_pos + 75 * cos((i * 120) + (countT * 20))
					var bloomY = y_pos + 50 * sin((i * 120) + (countT * 20))
					var angleBase = irandom_range(0,360)
					
					for(var j = 0; j < 5; j++) {
						for(var k = 0; k < 3 + (3 * global.main_stats.difficulty); k++) {
							var angleT = angleBase + ((k * (360 / (3 + (3 * global.main_stats.difficulty)))) + (j * 5))
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
				sound_ObjSound_Play(se_tan01)
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
			spd = 0;
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
								move_ObjMove_SetAngle(self,dir + random_range(-10,10))
							}
						}
					}
				}
			}
			if count mod 6 - global.main_stats.difficulty == 0 {
				sound_ObjSound_Play(se_tan02)
				shot_CreateShotA1(irandom_range(0,255),8,random_range(0.5,1.5),270 + irandom_range(-10,10),spr_danmaku_pellet,0,15);
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
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		
		if count > 60 {
			if count mod 30 == 0 {
				sound_ObjSound_Play(se_tan01);
				for(var i = 0; i < (20 + global.main_stats.difficulty); i++) {
					var angleT = i * ((8 * (360/(20 + global.main_stats.difficulty))) + (count / 2));
					shot_CreateShotA1(x,y,1,angleT,spr_danmaku_ball_l,10,15);
				}
			}
			if count mod 120 == 0 {
				var baseAngle = irandom_range(0,360);
				for(var i = 0; i < 8; i++) {
					var angleT = baseAngle + (i * 45);
					var inst = shot_CreateStraightLaserA1(x,y,angleT,32,1,60,spr_danmaku_laser,20,12);
					with(inst) {
						angular_velocity = 30 / 60;
					}
				}
			}
		}
	}
	spell_card_berenice_04 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_BERENICE_04,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_BERENICE_04"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		
		if count >= 60 {
			if count mod 10 == 0 {
				sound_ObjSound_Play(se_tan02)
				repeat(global.main_stats.difficulty + 1) {
					var startX = irandom_range(0,255);
					var speedT = random_range(1.5,3);
					shot_CreateShotA1(startX,0,speedT,270,spr_danmaku_arrowhead,10,10);
				}
			}
			if count mod 60 == 0 {
				sound_ObjSound_Play(se_tan01)
				var way = 12 + (global.main_stats.difficulty * 24);
				var baseAngle = 90 + (20 * sin(count * 0.5))
				repeat(way) {
					shot_CreateShotA1(x,y,1,baseAngle,spr_danmaku_ball_m1,20,10);
					baseAngle += 360 / way;
				}
			}
		}
	}
	spell_card_berenice_05 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_BERENICE_05,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_BERENICE_05"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		if count >= 60 {
			if count mod 45 == 0 {
				sound_ObjSound_Play(se_tan02)
				var baseAngle = count * 0.7;
				repeat(8 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(x,y,2,baseAngle,spr_danmaku_ball_l,10,15);
					with(inst) {
						set_function = function() {
							if count == 30 {
								move_ObjMove_SetSpeed(self,0);
							}
							if count == 50 {
								sound_ObjSound_Play(se_kira00)
								var bloomAngle = irandom_range(0,360);
								repeat(12) {
									shot_CreateShotA1(x,y,0.75,bloomAngle,spr_danmaku_shard,5,12);
									bloomAngle += 360 / 12;
								}
								instance_destroy();
							}
						}
					}
					baseAngle += 360 / (8 + global.main_stats.difficulty);
				}
			}
		}
	}
	spell_card_berenice_06 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_BERENICE_06,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_BERENICE_06"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		
		if count >= 60 {
			if count mod 10 == 0 {
				sound_ObjSound_Play(se_tan02)
				var way = 12;
				var baseAngle = count * 0.5;
				sound_ObjSound_Play(se_tan02)
				repeat(way) {
					var inst = shot_CreateShotA1(x,y,1,baseAngle,spr_danmaku_ball_m2,15,12);
					with(inst) {
						set_function = function() {
							if count == 60 {
								sound_ObjSound_Play(se_kira02)
								move_ObjMove_SetAcceleration(self,0.025);
								move_ObjMove_SetMaxSpeed(self,2.5);
								
								var drift = 0.8 * sin(dir * 2);
								move_ObjMove_SetAngularVelocity(self,drift);
								prop_ObjShot_SetGraphic(self,spr_danmaku_ball_m2,0)
							}
						}
					}
					baseAngle += 360 / way;
				}
			}
		}
	}
	spell_card_berenice_07 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_BERENICE_07,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_BERENICE_07"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		if count >= 60 {
			if count mod 4 == 0 {
				var way = 5;
				var baseAngle = count * 1.5;
				repeat(way) {
					shot_CreateShotA1(x,y,1,baseAngle,spr_danmaku_butterfly,10,0);
					shot_CreateShotA1(x,y,0.75,baseAngle + 180,spr_danmaku_butterfly,10,12);
					baseAngle += 360 / way;
				}
			}
			
			if count >= 120 and count < 220 {
				if count mod 5 == 0 {
					var angleT = point_direction(x,y,obj_player.x,obj_player.y);
					var inst = shot_CreateShotA1(x,y,0,angleT + irandom_range(-30,30),spr_danmaku_bullet,5,15);
					with(inst) {
						set_function = function() {
							if count == 30 {
								move_ObjMove_SetSpeed(self,2.5);
								move_ObjMove_SetAcceleration(self,0.005);
							}
						}
					}
				}
			}
			if count == 240 {
				count = 60;
			}
		}
	}
}