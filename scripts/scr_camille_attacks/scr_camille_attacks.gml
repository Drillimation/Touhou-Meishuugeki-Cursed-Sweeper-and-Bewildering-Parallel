function scr_camille_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_CAMILLE
	
	//Main attacks
	attack_camille_01 = function() {
		if count < 30 {
			if count mod 10 == 0 {
				sound_ObjSound_Play(se_tan01);
				var baseAngle = irandom_range(0,360);
				repeat(12 + (global.main_stats.difficulty * 4)) {
					var angleT = baseAngle;
					shot_CreateShotA1(x,y,1.25,angleT,spr_danmaku_dagger,10,0);
					angleT += 360 / (12 + (global.main_stats.difficulty * 4));
				}
			}
		}
		if count == 60 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
		if count == 145 {
			count = -5;
		}
	}
	attack_camille_02 = function() {
		if count mod 8 == 0 {
			sound_ObjSound_Play(se_tan01);
			for(var i = 0; i < 6; i++) {
				shot_CreateShotA1(8 + (40 * i),8,1.75,270,spr_danmaku_ball_m1,5,0);
			}
		}
		if count mod 12 == 0 {
			sound_ObjSound_Play(se_kira02);
			for(var i = -1 - global.main_stats.difficulty; i < 2 + global.main_stats.difficulty; i++) {
				var angleT = point_direction(x,y,obj_player.x,obj_player.y);
				shot_CreateShotA1(x,y,1,angleT,spr_danmaku_pellet,5,0);
			}
		}
	}
	attack_camille_03 = function() {
		if count mod 80 == 0 {
			sound_ObjSound_Play(se_kira00);
			repeat(4 + global.main_stats.difficulty) {
				shot_CreateShotA1(0,80,0.6,0 + irandom_range(-15,15),spr_danmaku_star_s,10,0)
				shot_CreateShotA1(0,208,0.6,0 + irandom_range(-15,15),spr_danmaku_star_s,10,0)
				shot_CreateShotA1(255,80,0.6,180 + irandom_range(-15,15),spr_danmaku_star_s,10,0)
				shot_CreateShotA1(255,208,0.6,180 + irandom_range(-15,15),spr_danmaku_star_s,10,0)
			}
		}
		if count mod 16 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y)
			var speedT = 2;
			repeat((global.main_stats.difficulty * 3) + 3) {
				shot_CreateShotA1(x,y,speedT,angleT + 8,spr_danmaku_arrowhead,5,0);
				shot_CreateShotA1(x,y,speedT,angleT - 8,spr_danmaku_arrowhead,5,0);
				speedT -= 0.1;
			}
		}
	}
	attack_camille_04 = function() {
		if count mod 16 == 0 {
			sound_ObjSound_Play(se_tan01);
			var speedT = 2.5
			var angleT = point_direction(x,y,obj_player.x,obj_player.y)
			repeat(2 * (global.main_stats.difficulty * 2)) {
				shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_amulet,5,0);
			}
		}
		if count mod 45 == 0 {
			sound_ObjSound_Play(se_kira01);
			repeat(8 + (global.main_stats.difficulty * 2)) {
				shot_CreateShotA1(0,random_range(16,272),0.75,0,spr_danmaku_dagger,10,10);
				shot_CreateShotA1(255,random_range(16,272),0.75,180,spr_danmaku_dagger,10,10);
			}
		}
	}
	attack_camille_05 = function() {
		if count mod 60 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = irandom_range(0,360);
			repeat(20 + (global.main_stats.difficulty * 4)) {
				var inst = shot_CreateShotA1(x,y,2,angleT,spr_danmaku_star_m,10,0);
				with(inst) {
					set_function = function() {
						if count == 45 {
							move_ObjMove_SetAcceleration(self,-0.05);
						}
						if count == 85 {
							move_ObjMove_SetAcceleration(self,0);
						}
						if count == 105 {
							sound_ObjSound_Play(se_kira00);
							direction = point_direction(x,y,obj_camille.x,obj_camille.y);
							move_ObjMove_SetAcceleration(self,0.05);
							move_ObjMove_SetMaxSpeed(self,2.5);
						}
					}
				}
				angleT += 360 / (20 + (global.main_stats.difficulty * 4))
			}
		}
	}
	attack_camille_06 = function() {
		if count == 0 {
			x_pos = 128;
			y_pos = 48;
		}
		if count mod 140 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = irandom_range(0,360);
			repeat(12 + (global.main_stats.difficulty * 2)) {
				var lasercolor = [14,2,8,5];
				var inst = shot_CreateShotA1(x,y,1.75,angleT,spr_danmaku_ball_s1,10,lasercolor[irandom_range(0,3)]);
				with(inst) {
					set_function = function() {
						if count > 50 {
							move_ObjMove_SetAngle(self,direction + (0.8 * direction));
						}
						if count == 50 {
							speed = 0;
						}
						if count == 70 {
							sound_ObjSound_Play(se_lazer00);
							var angleT = point_direction(x,y,obj_player.x,obj_player.y);
							shot_CreateStraightLaserA1(x,y,angleT,60,1,30,spr_danmaku_laser,60,image_index);
							instance_destroy(self)
						}
					}
				}
				inst = shot_CreateShotA1(x,y,1.75,angleT,spr_danmaku_ball_s1,10,lasercolor[irandom_range(0,3)]);
				with(inst) {
					set_function = function() {
						if count > 50 {
							move_ObjMove_SetAngle(self,direction + (0.8 * direction));
						}
						if count == 50 {
							speed = 0;
						}
						if count == 70 {
							sound_ObjSound_Play(se_lazer00);
							var angleT = point_direction(x,y,obj_player.x,obj_player.y);
							shot_CreateStraightLaserA1(x,y,angleT,60,1,30,spr_danmaku_laser,60,image_index);
							instance_destroy(self)
						}
					}
				}
				angleT += 360 / (12 + (global.main_stats.difficulty * 2));
			}
		}
	}
	attack_camille_07 = function() {
		if count == 0 {
			x_pos = 128;
			y_pos = 144;
			var angleT = 0;
			sound_ObjSound_Play(se_lazer00);
			repeat(4) {
				var inst = shot_CreateStraightLaserA1(x,y,angleT,30,1,9999,spr_danmaku_laser,30,0);
				with(inst) {
					set_function = function() {
						move_ObjMove_SetAngularVelocity(self,0.4);
					}
				}
				angleT += 360 / 4;
			}
			startAngle = choose(45,135);
		}
		if count mod 6 == 0 {
			sound_ObjSound_Play(se_tan01);
			repeat(5 + global.main_stats.difficulty) {
				for(var i = -2; i < 3; i++) {
					shot_CreateShotA1(x,y,1.6,startAngle + (i * 4),spr_danmaku_arrowhead,10,0)
				}
				startAngle += 360 / (5 + global.main_stats.difficulty);
			}
			startAngle += 22.5;
		}
	}
	attack_camille_08 = function() {
		if count == 0 {
			offset = [0,255]
			k = 0;
		}
		if count mod 40 == 0 {
			sound_ObjSound_Play(se_tan01);
			var yx = -48;
			repeat(4) {
				shot_CreateShotA1(offset[k],obj_player.y_pos + yx,1.75,k * 180,spr_danmaku_ball_m1,10,10);
			}
			if k == 0 { k = 1 }
			if k == 1 { k = 0 }
			yx += 32;
			
			
			repeat(12 + (global.main_stats.difficulty * 2)) {
				var centerAngle = 270;
				var spreadAngle = 60;
				var bulletCount = 12 + (global.main_stats.difficulty * 2);
				var i = 0;
				var angleT = (centerAngle - spreadAngle / 2) + (i * (spreadAngle / (bulletCount - 1)));
				
				shot_CreateShotA1(x,y,0.9 + random_range(-0.1,0.1),angleT,spr_danmaku_pellet,15,12)
				i++;
			}
		}
	}
	
	//Spell cards
	spell_card_camille_01 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_camille_portrait,0,_load_file.enemy_spell.SPELL_CAMILLE_01,spr_camille_spell)
			global.main_stats.current_spell = "SPELL_CAMILLE_01"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			speed = 0;
			move_mode = false;
			dir = 0;
		}
		
		if count mod 45 == 0 {
			sound_ObjSound_Play(se_tan01);
			repeat(20 + (global.main_stats.difficulty * 4)) {
				var angleT = dir;
				shot_CreateShotA1(x,y,1,angleT,spr_danmaku_dagger,10,0);
				angleT += 360 / (20 + (global.main_stats.difficulty * 4));
			}
		}
		if count > 0 and count mod 60 == 0 {
			sound_ObjSound_Play(se_kira01);
			var angleT = dir + 45;
			repeat(4) {
				var inst = shot_CreateShotA1(x,y,2,angleT,spr_danmaku_ball_m1,10,0);
				with(inst) {
					set_function = function() {
						if count < 30 {
							move_ObjMove_SetSpeed(self,speed * 0.92)
						}
						if count == 30 {
							instance_destroy();
							var angleT = irandom_range(0,360);
							repeat(8) {
								shot_CreateShotA1(x,y,0.6,angleT,spr_danmaku_ball_s1,5,0);
								angleT += 360 / 8;
							}
						}
					}
				}
				angleT += 360 / 4
			}
		}
		if count >= 60 {
			dir += 7.3;
		}
	}
	spell_card_camille_02 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_camille_portrait,0,_load_file.enemy_spell.SPELL_CAMILLE_02,spr_camille_spell)
			global.main_stats.current_spell = "SPELL_CAMILLE_02"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			speed = 0;
			move_mode = false;
			dir = 0;
		}
		
		if count == 60 {
			sound_ObjSound_Play(se_lazer00);
			for(var i = 0; i < 6; i++) {
				shot_CreateLooseLaserA1(8 + (40 * i),0,0,270,28.8,1,spr_danmaku_laser,30,0);
			}
		}
		if count > 60 {
			if count mod 16 - global.main_stats.difficulty == 0 {
				sound_ObjSound_Play(se_tan01);
				for(var i = 0; i < 6; i++) {
					shot_CreateShotA1((8 + (40 * i)) + irandom_range(-10,10),144,1.6,270,spr_danmaku_ball_s1,5,0);
				}
			}
			
			if count mod 75 == 0 {
				sound_ObjSound_Play(se_kira01);
				var angleT = irandom_range(0,360);
				repeat(12 + (global.main_stats.difficulty * 2)) {
					shot_CreateShotA1(x,y,0.75,angleT,spr_danmaku_pellet,10,12);
				}
			}
		}
	}
	spell_card_camille_03 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_camille_portrait,0,_load_file.enemy_spell.SPELL_CAMILLE_03,spr_camille_spell)
			global.main_stats.current_spell = "SPELL_CAMILLE_03"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			speed = 0;
			move_mode = false;
			dir = 0;
		}
		
		if count == 60 {
			sound_ObjSound_Play(se_lazer01);
			var ceilinglaser = shot_CreateLooseLaserA1(0,80,0,0,25.6,1,spr_danmaku_laser,40,0);
			var floorlaser = shot_CreateLooseLaserA1(0,208,0,0,25.6,1,spr_danmaku_laser,40,0);
			with(ceilinglaser) {
				dir = 0;
				set_function = function() {
					x = lengthdir_y(0,dir);
					y = lengthdir_y(40,dir);
					dir++;
				}
			}
			with(floorlaser) {
				dir = 0;
				set_function = function() {
					x = lengthdir_y(0,dir);
					y = lengthdir_y(40,dir);
					dir++;
				}
			}
		}
		if count mod 70 == 0 {
			sound_ObjSound_Play(se_kira00);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			for(var lay = 1; lay < 4; lay++) {
				var speedT = 0.65 * lay;
				repeat(4) {
					shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_star_m,10,12);
					for(var step = 1; step < 4; step++) {
						var wallAngle = angleT + (step * (90 / 4))
						shot_CreateShotA1(x,y,speedT * 0.95,wallAngle,spr_danmaku_pellet,10,12);
					}
					angleT += 360 / 4;
				}
			}
		}
	}
	spell_card_camille_04 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_camille_portrait,0,_load_file.enemy_spell.SPELL_CAMILLE_04,spr_camille_spell)
			global.main_stats.current_spell = "SPELL_CAMILLE_04"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			speed = 0;
			move_mode = false;
			dir = 0;
			streamAngle = 270;
			angleDirection = 1;
		}
		
		if count mod 160 == 0 {
			var spacing = 12;
			repeat(4) {
				shot_CreateStraightLaserA1(obj_player.x_pos + spacing,0,0,75,38.4,100,spr_danmaku_laser,60,10);
				shot_CreateStraightLaserA1(obj_player.x_pos + spacing,0,0,75,38.4,100,spr_danmaku_laser,60,10);
				spacing += 24;
			}
		}
		if count >= 60 {
			if count mod 8 == 0 {
				sound_ObjSound_Play(se_tan01);
				for(var i = -2; i < 3; i++) {
					var offsetAngle = streamAngle + (i * 14);
					shot_CreateShotA1(x,y,1.6,offsetAngle,spr_danmaku_amulet,5,0);
				}
			
				streamAngle += 1.8 * angleDirection;
				if streamAngle > 300 { angleDirection = -1; }
				if streamAngle < 240 { angleDirection = 1; }
			}
		}
	}
	spell_card_camille_05 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_camille_portrait,0,_load_file.enemy_spell.SPELL_CAMILLE_05,spr_camille_spell)
			global.main_stats.current_spell = "SPELL_CAMILLE_05"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			speed = 0;
			move_mode = false;
			dir = 0;
		}
		if count mod 240 == 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
		if count mod 50 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = irandom_range(0,360);
			repeat(20 + (global.main_stats.difficulty * 4)) {
				var inst = shot_CreateShotA1(x,y,2,angleT,spr_danmaku_star_m,10,0);
				with(inst) {
					set_function = function() {
						if count == 45 {
							move_ObjMove_SetAcceleration(self,-0.05);
						}
						if count == 85 {
							move_ObjMove_SetAcceleration(self,0);
						}
						if count == 105 {
							sound_ObjSound_Play(se_kira00);
							direction = point_direction(x,y,obj_camille.x,obj_camille.y);
							move_ObjMove_SetAcceleration(self,0.05);
							move_ObjMove_SetMaxSpeed(self,2.5);
						}
					}
				}
				angleT += 360 / (20 + (global.main_stats.difficulty * 4))
			}
		}
	}
	spell_card_camille_06 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_camille_portrait,0,_load_file.enemy_spell.SPELL_CAMILLE_06,spr_camille_spell)
			global.main_stats.current_spell = "SPELL_CAMILLE_06"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			speed = 0;
			move_mode = false;
			dir = 0;
		}
		
		if count mod 140 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = irandom_range(0,360);
			repeat(14 + (global.main_stats.difficulty * 2)) {
				var lasercolor = [14,2,8,5];
				var inst = shot_CreateShotA1(x,y,1.25,angleT,spr_danmaku_ball_s1,10,lasercolor[irandom_range(0,3)]);
				move_ObjMove_SetAngularVelocity(inst,0.6);
				with(inst) {
					set_function = function() {
						if count == 75 {
							speed = 0;
							move_ObjMove_SetAngularVelocity(self,0);
						}
						if count == 115 {
							sound_ObjSound_Play(se_lazer00);
							var angleT = point_direction(x,y,obj_player.x,obj_player.y);
							var laser = shot_CreateLooseLaserA1(x,y,1,angleT,1,1,spr_danmaku_laser,25,image_index);
							with(laser) {
								set_function = function() {
									if count < 10 {
										image_xscale += 0.5;
									}
								}
							}
						}
					}
				}
				inst = shot_CreateShotA1(x,y,1.25,angleT,spr_danmaku_ball_s1,10,lasercolor[irandom_range(0,3)]);
				move_ObjMove_SetAngularVelocity(inst,-0.6);
				with(inst) {
					set_function = function() {
						if count == 75 {
							speed = 0;
							move_ObjMove_SetAngularVelocity(self,0);
						}
						if count == 115 {
							var angleT = point_direction(x,y,obj_player.x,obj_player.y);
							var laser = shot_CreateLooseLaserA1(x,y,1,angleT,1,1,spr_danmaku_laser,25,image_index);
							with(laser) {
								set_function = function() {
									if count < 10 {
										image_xscale += 0.5;
									}
								}
							}
						}
					}
				}
				angleT = 360 / (14 + (global.main_stats.difficulty * 2))
			}
		}
	}
	spell_card_camille_07 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_camille_portrait,0,_load_file.enemy_spell.SPELL_CAMILLE_07,spr_camille_spell)
			global.main_stats.current_spell = "SPELL_CAMILLE_07"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			speed = 0;
			move_mode = false;
			dir = 0;
		}
		if count == 60 {
			sound_ObjSound_Play(se_lazer00);
			x_pos = 128;
			y_pos = 144;
			var angleT = 0;
			repeat(4) {
				var inst = shot_CreateStraightLaserA1(x,y,angleT,30,1,9999,spr_danmaku_laser,30,0);
				with(inst) {
					set_function = function() {
						move_ObjMove_SetAngularVelocity(self,-0.4);
					}
				}
				angleT += 360 / 4;
			}
			startAngle = choose(45,135);
		}
		if count >= 60 {
			if count mod 12 == 0 {
				sound_ObjSound_Play(se_tan01);
				repeat(6 + (global.main_stats.difficulty * 2)) {
					shot_CreateShotA1(irandom_range(16,240),16,random_range(0.75,1.25),270 + irandom_range(-5,5),spr_danmaku_ball_l,15,0)
				}
			}
		}
	}
	spell_card_camille_08 = function() {
		if count == 0 {
			timer = 45;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_camille_portrait,0,_load_file.enemy_spell.SPELL_CAMILLE_08,spr_camille_spell)
			global.main_stats.current_spell = "SPELL_CAMILLE_08"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 144;
			invultime = 7200;
		}
		if count < 100 {
			image_alpha -= 0.01;
			image_alpha = clamp(image_alpha,0,1);
		}
		
		if count >= 60 {
			if count mod 15 == 0 {
				sound_ObjSound_Play(se_tan01);
				var startAngle = 240;
				var sweepRange = 120;
				var total_pulses = (5 + global.main_stats.difficulty)
				for(var p = 0; p < total_pulses; p++) {
					var pulseAngle = startAngle + (1 * (p * sweepRange / (total_pulses - 1)));
					for (var i = -1; i < 2; i++) {
						var finalAngle = pulseAngle + (i * 5);
						shot_CreateShotA1(x,y,2.1,finalAngle,spr_danmaku_arrowhead,10,0);
					}
				}
			}
			
			if count mod 45 == 0 {
				sound_ObjSound_Play(se_kira00);
				var startAngle = 240;
				var sweepRange = 120;
				var total_pulses = (5 + global.main_stats.difficulty)
				for(var p = 0; p < total_pulses; p++) {
					var pulseAngle = startAngle + (-1 * (p * sweepRange / (total_pulses - 1)));
					for (var i = -1; i < 2; i++) {
						var finalAngle = pulseAngle + (i * 5);
						shot_CreateShotA1(x,y,2.1,finalAngle,spr_danmaku_arrowhead,10,0);
					}
				}
			}
		}
		
		if timer == 1 {
			hp = 0;
			scr_enemy_remove_life();
		}
	}
	spell_card_camille_09 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_camille_portrait,0,_load_file.enemy_spell.SPELL_CAMILLE_09,spr_camille_spell)
			global.main_stats.current_spell = "SPELL_CAMILLE_09"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,96);
			speed = 0;
			move_mode = false;
			waveCounter = 0;
			matrixSpeed = 0;
		}
		waveCounter++;
		matrixSpeed += 0.0012;
		if count mod 16 == 0 {
			sound_ObjSound_Play(se_tan01);
			var baseAngle = 270;
			var spreadAngle = 80;
			for(var i = 0; i < 12 + global.main_stats.difficulty; i++) {
				var angleT = ((baseAngle - spreadAngle) / 2) + (i * spreadAngle / (waveCounter - 1));
			
				var inst = shot_CreateShotA1(x,y,matrixSpeed,angleT,spr_danmaku_pellet,10,choose(0,12));
				move_ObjMove_SetAcceleration(inst,0.01);
			}
		}
	}
}