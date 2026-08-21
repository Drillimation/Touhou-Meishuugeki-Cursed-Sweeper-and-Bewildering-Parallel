function scr_doromi_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_DOROMI
	
	//Main attacks
	attack_doromi_01 = function() {
		if count == 0 {
			dawnAngle = 0;
			timer = 60;
		}
		if count mod 30 == 0 and count > 0 {
			sound_ObjSound_Play(se_tan01)
			var i = 0;
			var angleT = 0;
			repeat(12 + (global.main_stats.difficulty * 4)) {
				var shotType;
				if i mod 2 == 0 {
					shotType = 1;
				}
				else {
					shotType = 2;
				}
				shot_CreateShotA1(x,y,1,angleT + dawnAngle,spr_danmaku_ball_s1,10,shotType);
				angleT += 360 / (12 + (global.main_stats.difficulty * 4))
				i++
			}
			dawnAngle += 13.5;
		}
		if count mod 60 == 45 {
			sound_ObjSound_Play(se_kira01)
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			for(var i = -2 - global.main_stats.difficulty; i < 3 + global.main_stats.difficulty; i++) {
				shot_CreateShotA1(x,y,1.25,angleT + (i * 12),spr_danmaku_dagger,15,12);
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	attack_doromi_02 = function() {
		if count == 0 {
			spd = 0;
			move_mode = false;
			timer = 60; 
		}
		if count mod 80 == 0 {
			sound_ObjSound_Play(se_kira01);
			var baseAngle = irandom_range(0,360);
			repeat(12 + (global.main_stats.difficulty * 4)) {
				shot_CreateShotA1(x,y,0.3,baseAngle,spr_danmaku_arrowhead,20,12);
				baseAngle += 360 / (12 + (global.main_stats.difficulty * 4))
			}
		}
		if count mod 20 == 0 and count mod 80 < 60 {
			sound_ObjSound_Play(se_tan01);
			var speedT = 1.6;
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			var shotColor;
			if count mod 40 == 0 {
				shotColor = 0;
			}
			else {
				shotColor = 1;
			}
			repeat(1 + global.main_stats.difficulty) {
				for(var i = -1; i < 2; i++) {
					shot_CreateShotA1(x,y,speedT,angleT + (8 * i),spr_danmaku_arrowhead,5,shotColor)
				}
				speedT -= 0.1;
			}
		}
		if count mod 240 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	attack_doromi_03 = function() {
		if count == 0 {
			swingAngle = 0;
			timer = 60;
			spd = 0;
			move_mode = false;
		}
		if count mod 6 == 0 {
			sound_ObjSound_Play(se_kira01);
			var angleL = 225 + (sin(swingAngle) * 45);
			shot_CreateShotA1(x,y,0.9,angleL,spr_danmaku_butterfly,12,12);
			var angleR = 315 - (sin(swingAngle) * 45);
			shot_CreateShotA1(x,y,0.9,angleR,spr_danmaku_butterfly,12,12);
			swingAngle += 15;
			
		}
		if count mod 12 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			var speedT = 2.25;
			repeat(1 + global.main_stats.difficulty) {
				shot_CreateShotA1(x,y,speedT,angleT - 15,spr_danmaku_arrowhead,4,1);
				shot_CreateShotA1(x,y,speedT,angleT + 15,spr_danmaku_arrowhead,4,2);
				speedT -= 0.125;
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	attack_doromi_04 = function() {
		if count == 0 {
			x_pos = 128;
			y_pos = 48;
			spiralAngle1 = 0;
			spiralAngle2 = 180;
			timer = 60;
			spd = 0;
			move_mode = false;
		}
		if count mod 6 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = 0;
			repeat(1 + global.main_stats.difficulty) {
				shot_CreateShotA1(x,y,1.1,spiralAngle1 + angleT,spr_danmaku_ball_s1,5,15);
				angleT += 360 / (1 + global.main_stats.difficulty)
			}
			shot_CreateShotA1(x,y,0.9,spiralAngle2,spr_danmaku_ball_s1,5,2);
			if global.main_stats.difficulty >= 2 {
				shot_CreateShotA1(x,y,0.8,spiralAngle2,spr_danmaku_ball_s1,5,2);
			}
			spiralAngle1 += 10;
			spiralAngle2 -= 10;
		}
		if count mod (70 - (global.main_stats.difficulty * 5)) == 0 {
			sound_ObjSound_Play(se_kira01);
			repeat(1) {
				var inst = shot_CreateShotA1(128 + (irandom_range(-120,120)),y,0.6,270,spr_danmaku_ball_l,20,0);
				with(inst) {
					set_function = function() {
						if y_pos >= 144 {
							sound_ObjSound_Play(se_focusfix);
							var angleT = irandom_range(0,360);
							repeat(24) {
								shot_CreateShotA1(x,y,1.5,angleT,spr_danmaku_dagger,10,12);
								angleT += 360 / 24
							}
							instance_destroy();
						}
					}
				}
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	attack_doromi_05 = function() {
		if count == 0 { 
			timer = 60; 
			spd = 0;
			move_mode = false;
		}
		if count mod 80 == 0 {
			sound_ObjSound_Play(se_kira01);
			var baseAngle = irandom_range(0,360);
			repeat(20 + (global.main_stats.difficulty * 4)) {
				var inst = shot_CreateShotA1(x,y,1.75,baseAngle,spr_danmaku_ball_m1,15,14);
				with(inst) {
					set_function = function() {
						if count == 45 {
							sound_ObjSound_Play(se_kira01);
							move_ObjMove_SetAcceleration(self,-0.075);
						}
						if count == 85 {
							sound_ObjSound_Play(se_kira00);
							move_ObjMove_SetAcceleration(self,0);
							dir = 270 + irandom_range(-15,15);
							spd = 0.9;
						}
					}
				}
				baseAngle += 360 / (20 + (global.main_stats.difficulty * 4))
			}
		}
		if count mod 35 == 0 {
			sound_ObjSound_Play(se_tan01);
			var sidePos, targetAngle;
			var h = 0;
			if count mod 70 == 0 {
				sidePos = 248;
			}
			else {
				sidePos = 0;
			}
			if sidePos == 0 {
				targetAngle = 0;
			}
			else {
				targetAngle = 180;
			}
			repeat(6 + (global.main_stats.difficulty * 2)) {
				shot_CreateShotA1(sidePos,48 + h,1.25,targetAngle + irandom_range(-5,5),spr_danmaku_dagger,8,12);
				h += 192 / (6 + (global.main_stats.difficulty * 2))
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	attack_doromi_06 = function() {
		if count == 0 {
			lightAngle = 315;
			timer = 60;
			spd = 0;
			move_mode = false;
			with(obj_warning_line) { instance_destroy() }
		}
		if count mod 6 == 0 {
			sound_ObjSound_Play(se_tan01)
			var baseOffset = 0;
			repeat(1 + global.main_stats.difficulty) {
				shot_CreateShotA1(x_pos - 16,y,2.1,lightAngle + baseOffset,spr_danmaku_dagger,10,2)
				baseOffset += 15;
			}
			lightAngle -= 8.5;
			if lightAngle < 225 { lightAngle = 315; }
		}
		if count mod 55 == 0 {
			sound_ObjSound_Play(se_kira00)
			repeat(1 + global.main_stats.difficulty) {
				var inst = shot_CreateShotA1(choose((x_pos - 16) - irandom_range(4,48),(x_pos + 16) + irandom_range(4,48)),y,1,270 + irandom_range(-10,10),spr_danmaku_ball_l,20,12);
				with(inst) {
					set_function = function() {
						if count mod 48 == 0 and y_pos < 144 {
							sound_ObjSound_Play(se_tan02);
							var bleedAngle = irandom_range(0,360);
							shot_CreateShotA1(x,y,0.4,bleedAngle,spr_danmaku_ball_s1,5,10);
							shot_CreateShotA1(x,y,0.3,bleedAngle + 180,spr_danmaku_ball_s1,5,10);
						}
					}
				}
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	attack_doromi_07 = function() {
		if count == 0 {
			ringAngle = 0;
			timer = 60;
			spd = 0;
			move_mode = false;
		}
		if count mod 14 == 0 {
			sound_ObjSound_Play(se_kira01)
			var angleT = ringAngle;
			repeat(12 + (global.main_stats.difficulty * 4)) {
				var inst = shot_CreateShotA1(x,y,1.9,angleT,spr_danmaku_ball_s1,10,0);
				with(inst) {
					set_function = function() {
						if count >= 40 {
							if spd > 0.6 {
								spd -= 0.05;
							}
						}
					}
				}
				angleT += 360 / (12 + (global.main_stats.difficulty * 4))
			}
			ringAngle += 15;
		}
		if count mod 8 == 0 {
			sound_ObjSound_Play(se_tan02);
			shot_CreateShotA1(irandom_range(8,248),8,2.5,270 + irandom_range(-5,5),spr_danmaku_arrowhead,5,1);
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	attack_doromi_08 = function() {
		if count == 0 {
			timer = 60;
			ashAngle = 315;
			spd = 0;
			move_mode = false;
		}
		if count mod 90 == 0 {
			sound_ObjSound_Play(se_kira00)
			var spacing = 8;
			repeat(4 + global.main_stats.difficulty) {
				var inst = shot_CreateShotA1(spacing,8,0.75,270,spr_danmaku_ball_l,15,0)
				with(inst) {
					set_function = function() {
						if count >= 80 {
							if spd > 0.2 {
								spd -= 0.025;
							}
						}
					}
				}
				spacing += 240 / (4 + global.main_stats.difficulty)
			}
		}
		if count mod (7 - global.main_stats.difficulty) == 0 {
			sound_ObjSound_Play(se_tan02);
			shot_CreateShotA1(x,y,1.6,ashAngle,spr_danmaku_dagger,5,15);
			shot_CreateShotA1(x,y,1.6,ashAngle + 180,spr_danmaku_dagger,5,15);
			ashAngle += 7.3;
			
			if ashAngle < 225 { ashAngle = 315 }
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	
	//Spell cards
	spell_card_doromi_01 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_doromi_portrait,0,_load_file.enemy_spell.SPELL_DOROMI_01,spr_doromi_spell)
			global.main_stats.current_spell = "SPELL_DOROMI_01"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
		}
		
		if count >= 60 {
			if count mod 20 == 0 {
				sound_ObjSound_Play(se_tan01)
				repeat(5 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(irandom_range(8,248),8,random_range(1,2),270 + irandom_range(-10,10),choose(spr_danmaku_ball_m1,spr_danmaku_ball_m2,spr_danmaku_ball_l),10,2);
					with(inst) {
						set_function = function() {
							if count mod 5 == 0 {
								if image_index < 12 {
									image_index++;
								}
							}
						}
					}
				}
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	spell_card_doromi_02 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_doromi_portrait,0,_load_file.enemy_spell.SPELL_DOROMI_02,spr_doromi_spell)
			global.main_stats.current_spell = "SPELL_DOROMI_02"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
			sweepRange = 45;
			baseAngle = 270;
		}
		if count >= 60 {
			if count mod 20 == 0 {
				sound_ObjSound_Play(se_lazer00);
				var currentSweepAngle = baseAngle + sweepRange * sin(count * 2);
				var graphic;
				if count mod 40 == 0 { graphic = 14; } else { graphic = 2; }
				for(var i = -2 - global.main_stats.difficulty; i < 3 + global.main_stats.difficulty; i++) {
					var inst = shot_CreateLooseLaserA1(x,y,1,currentSweepAngle + (i * 35),5,1,spr_danmaku_laser,10,graphic);
					with(inst) { 
						move_ObjMove_SetAngularVelocity(self,0.4 * sin(dir)) 
						set_function = function() {
							if count == 300 {
								prop_ObjShot_FadeDelete(self,0.1);
							}
						}
					}
				}
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	spell_card_doromi_03 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_doromi_portrait,0,_load_file.enemy_spell.SPELL_DOROMI_03,spr_doromi_spell)
			global.main_stats.current_spell = "SPELL_DOROMI_03"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
		}
		if count >= 60 {
			if count mod 60 == 0 {
				sound_ObjSound_Play(se_tan01)
				repeat(3 + global.main_stats.difficulty) {
					inst = shot_CreateShotA1(irandom_range(24,232),24,random_range(1,1.5),270 + irandom_range(-10,10),spr_danmaku_ball_m1,5,0);
					var baseAngle = irandom_range(0,360)
					var ex = inst.x_pos + lengthdir_x(16,baseAngle)
					var ey = inst.y_pos + lengthdir_y(16,baseAngle)
					for(var i = 0; i < 12; i++) {
						var inst2 = shot_CreateShotA1(ex,ey,0,baseAngle,spr_danmaku_ball_s1,5,0)
						inst2.parent_object = inst;
						with(inst2) {
							set_function = function() {
								if !instance_exists(parent_object) {
									instance_destroy();
								}
								else {
									x_pos = parent_object.x_pos + lengthdir_x(16,dir);
									y_pos = parent_object.y_pos + lengthdir_y(16,dir);
									dir++;
								}
							}
						}
						baseAngle += 180 / 12;
					}
					with(inst) {
						set_function = function() {
							if count mod 24 == 0 {
								var inst = shot_CreateShotA1(x,y,0.1,irandom_range(0,360),spr_danmaku_pellet,5,15);
								prop_ObjShot_FadeDelete(inst,-0.01);
							}
						}
					}
				}
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	spell_card_doromi_04 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_doromi_portrait,0,_load_file.enemy_spell.SPELL_DOROMI_04,spr_doromi_spell)
			global.main_stats.current_spell = "SPELL_DOROMI_04"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
		}
		if count >= 60 {
			if count mod 50 == 0 {
				sound_ObjSound_Play(se_tan01);
				var graphic;
				if count mod 100 == 0 { graphic = 14; } else { graphic = 15; }
				var inst = shot_CreateShotA1(irandom_range(8,248),8,random_range(1,2),270 + irandom_range(-10,10),spr_danmaku_ball_m1,5,graphic);
				with(inst) {
					set_function = function() {
						if count == 0 { execute = irandom_range(30,90) }
						if count == execute {
							sound_ObjSound_Play(se_kira00)
							var baseAngle = irandom_range(0,360)
							repeat(3 + global.main_stats.difficulty) {
								for(var i = 0; i < 12; i++) {
									if i != 0 {
										shot_CreateShotA1(x,y,1.2 - (0.05 * i),baseAngle + 5 + (i * 5),spr_danmaku_bullet,5,image_index);
										shot_CreateShotA1(x,y,1.2 - (0.05 * i),baseAngle - 5 - (i * 5),spr_danmaku_bullet,5,image_index);
									}
								}
								baseAngle += 360 / (3 + global.main_stats.difficulty)
							}
							instance_destroy();
						}
					}
				}
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	spell_card_doromi_05 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_doromi_portrait,0,_load_file.enemy_spell.SPELL_DOROMI_05,spr_doromi_spell)
			global.main_stats.current_spell = "SPELL_DOROMI_05"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
		}
		if count mod 120 == 0 and count > 0 {
			var ez = 0;
			repeat(10 + (global.main_stats.difficulty * 2)) {
				shot_CreateStraightLaserA1(0,(24 + ez) + irandom_range(-8,8),0,32,1,60,spr_danmaku_laser,60,0);
				ez += 240 / (10 + (global.main_stats.difficulty * 2));
			}
			ez = 0;
			repeat(10 + (global.main_stats.difficulty * 2)) {
				shot_CreateStraightLaserA1((8 + ez) + irandom_range(-8,8),0,270,36,1,60,spr_danmaku_laser,60,0);
				ez += 240 / (10 + (global.main_stats.difficulty * 2));
			}
		}
		if count mod 180 == 0 and count > 0 {
			sound_ObjSound_Play(se_option)
			repeat(64) {
				shot_CreateShotA1(x,y,random_range(0.5,1.5),irandom_range(0,360),spr_danmaku_ball_s1,5,0);
			}
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	spell_card_doromi_06 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_doromi_portrait,0,_load_file.enemy_spell.SPELL_DOROMI_06,spr_doromi_spell)
			global.main_stats.current_spell = "SPELL_DOROMI_06"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
		}
		
		if count >= 60 {
			if count mod 30 == 0 {
				sound_ObjSound_Play(se_tan01);
				repeat(1 + global.main_stats.difficulty) {
					var spawnX;
					if count mod 60 == 0 {
						spawnX = 128 + irandom_range(0,120);
					}
					else {
						spawnX = 128 - irandom_range(0,120);
					}
					var spawnY = irandom_range(16,144);
					var angleBase = irandom_range(0,360)
					for(var i = 0; i < 16; i++) {
						shot_CreateShotA1(spawnX,spawnY,1.25,angleBase,spr_danmaku_star_s,5,2);
						angleBase += 360 / 16;
					}
				}
			}
			if count mod 40 == 0 {
				sound_ObjSound_Play(se_tan02);
				repeat(1 + global.main_stats.difficulty) {
					var spawnX;
					if count mod 80 == 0 {
						spawnX = 128 + irandom_range(0,120);
					}
					else {
						spawnX = 128 - irandom_range(0,120);
					}
					var spawnY = irandom_range(16,144);
					var speedT = 1;
					var angleBase = point_direction(x,y,obj_player.x,obj_player.y);
					for(var i = 0; i < 1 + global.main_stats.difficulty; i++) {
						shot_CreateShotA1(spawnX,spawnY,speedT,angleBase,spr_danmaku_seed_m,5,12);
						speedT -= 0.1;
					}
				}
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	spell_card_doromi_07 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_doromi_portrait,0,_load_file.enemy_spell.SPELL_DOROMI_07,spr_doromi_spell)
			global.main_stats.current_spell = "SPELL_DOROMI_07"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
		}
		
		if count >= 60 {
			if count mod 40 == 0 {
				sound_ObjSound_Play(se_tan01);
				repeat(3 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(8,24 + irandom_range(0,240),0.75,0 + irandom_range(-10,10),spr_danmaku_ball_l,5,0);
					with(inst) {
						set_function = function() {
							if x_pos > 128 {
								image_index = 10;
							}
							else {
								image_index = 0;
							}
						}
					inst = shot_CreateShotA1(248,24 + irandom_range(0,240),0.75,180 + irandom_range(-10,10),spr_danmaku_ball_l,5,10);
					with(inst) {
						set_function = function() {
							if x_pos > 128 {
								image_index = 0;
							}
							else {
								image_index = 10;
							}
						}
					}
				}
			}
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
	}
	spell_card_doromi_08 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_doromi_portrait,0,_load_file.enemy_spell.SPELL_DOROMI_08,spr_doromi_spell)
			global.main_stats.current_spell = "SPELL_DOROMI_08"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
		}
		if count >= 60 {
			if count mod 25 - (global.main_stats.difficulty * 5) == 0 {
				sound_ObjSound_Play(se_tan01)
				repeat(3 + global.main_stats.difficulty) {
					inst = shot_CreateShotA1(irandom_range(24,232),24,random_range(1,1.5),270 + irandom_range(-10,10),spr_danmaku_ball_m1,5,12);
					var ex = inst.x_pos + lengthdir_x(16,0)
					var ey = inst.y_pos + lengthdir_y(16,0)
					var inst2 = shot_CreateShotA1(ex,ey,0,0,spr_danmaku_ball_s1,5,0)
					inst2.parent_object = inst;
					with(inst2) {
						set_function = function() {
							if !instance_exists(parent_object) {
								instance_destroy();
							}
							else {
								x_pos = parent_object.x_pos + lengthdir_x(16,dir);
								y_pos = parent_object.y_pos + lengthdir_y(16,dir);
								dir++;
							}
						}
					}
					ex = x_pos + lengthdir_x(16,180)
					ey = y_pos + lengthdir_y(16,180)
					inst2 = shot_CreateShotA1(ex,ey,0,180,spr_danmaku_ball_s1,5,15)
					inst2.parent_object = inst;
					with(inst2) {
						set_function = function() {
							if !instance_exists(parent_object) {
								instance_destroy();
							}
							else {
								x_pos = parent_object.x_pos + lengthdir_x(16,dir);
								y_pos = parent_object.y_pos + lengthdir_y(16,dir);
								dir++;
							}
						}
					}
					inst = shot_CreateShotA1(irandom_range(24,232),264,random_range(1,1.5),270 + irandom_range(-10,10),spr_danmaku_ball_m1,5,12);
					ex = inst.x_pos + lengthdir_x(16,0)
					ey = inst.y_pos + lengthdir_y(16,0)
					inst2 = shot_CreateShotA1(ex,ey,0,0,spr_danmaku_ball_s1,5,0)
					inst2.parent_object = inst;
					with(inst2) {
						set_function = function() {
							if !instance_exists(parent_object) {
								instance_destroy();
							}
							else {
								x_pos = parent_object.x_pos + lengthdir_x(16,dir);
								y_pos = parent_object.y_pos + lengthdir_y(16,dir);
								dir++;
							}
						}
					}
					ex = x_pos + lengthdir_x(16,180)
					ey = y_pos + lengthdir_y(16,180)
					inst2 = shot_CreateShotA1(ex,ey,0,180,spr_danmaku_ball_s1,5,15)
					inst2.parent_object = inst;
					with(inst2) {
						set_function = function() {
							if !instance_exists(parent_object) {
								instance_destroy();
							}
							else {
								x_pos = parent_object.x_pos + lengthdir_x(16,dir);
								y_pos = parent_object.y_pos + lengthdir_y(16,dir);
								dir++;
							}
						}
					}
				}
			}
		}
	}
	spell_card_doromi_09 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_doromi_portrait,0,_load_file.enemy_spell.SPELL_DOROMI_09,spr_doromi_spell)
			global.main_stats.current_spell = "SPELL_DOROMI_09"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,144);
			spd = 0;
			move_mode = false;
			sweep_dir = 0;
			invultime = 7200;
		}
		
		if count < 100 {
			image_alpha -= 0.01;
			image_alpha = clamp(image_alpha,0,1);
		}
		if count mod 300 == 0 {
			var graphic;
			if count mod 600 == 0 { graphic = 2; } else { graphic = 12; }
			var baseAngle = irandom_range(0,360)
			repeat(18 + (global.main_stats.difficulty * 2)) {
				var inst = shot_CreateStraightLaserA1(x,y,baseAngle,38.4,1,240,spr_danmaku_laser,60,graphic)
				baseAngle += 360 / (18 + (global.main_stats.difficulty * 2))
			}
		}
		if count mod 50 == 0 {
			var baseAngle = irandom_range(0,360)
			repeat(18 + (global.main_stats.difficulty * 2)) {
				shot_CreateShotA1(x,y,1,baseAngle,spr_danmaku_ball_m2,5,15);
				baseAngle += 360 / (18 + (global.main_stats.difficulty * 2))
			}
		}
		if timer == 1 {
			hp = 0;
			scr_enemy_remove_life();
		}
	}
}