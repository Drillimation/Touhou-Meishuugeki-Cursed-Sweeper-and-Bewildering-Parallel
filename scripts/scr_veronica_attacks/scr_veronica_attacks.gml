function scr_veronica_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_VERONICA
	
	//Main attacks
	attack_veronica_main_01 = function() {
		if count == 0 { timer = 60 }
		if count mod 45 == 0 {
			sound_ObjSound_Play(se_tan01)
			var baseAngle = point_direction(x,y,obj_player.x,obj_player.y);
			var speedT = 1.75;
			repeat(global.main_stats.difficulty + 1) {
				for(var i = -2; i < 3; i++) {
					shot_CreateShotA1(x,y,speedT,baseAngle + (16 * i),spr_danmaku_bullet,10,15)
				}
				speedT -= 0.25;
			}
		}
		if count mod 60 == 0 {
			sound_ObjSound_Play(se_kira00)
			var baseAngle = irandom_range(0,360);
			repeat(18) {
				shot_CreateShotA1(x,y,0.75,baseAngle,spr_danmaku_ball_s1,20,0)
				baseAngle += 360 / 18
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(24,232),irandom_range(80,140),60);
		}
	}
	attack_veronica_main_02 = function() {
		if count == 0 {
			timer = 60;
			dir = 1;
			x_pos = 24;
			y_pos = 48;
			spd = 0;
			move_mode = false;
			self_timer = 0;
			spd = 0.025; // Adjust this to change the speed of the loop
			x_radius = 0; // Width of the infinity loop
			y_radius = 72; // Height of the infinity loop
		}
		if count > 0 {
			// Increment the timer
			self_timer += spd;

			// Calculate Figure-8 (Lemniscate) using trigonometry
			//x_pos = 128 + (x_radius * cos(self_timer));
			//y_pos = 96 + (y_radius * sin(self_timer * 2)) / 2;
		}
		if count mod 180 == 0 and count > 0 {
			if x_pos < 128 {
				move_ObjMove_SetDestAtFrame(self,232,irandom_range(48,96),60);
			}
			else {
				move_ObjMove_SetDestAtFrame(self,24,irandom_range(48,96),60);
			}
		}
		if count mod (6 - global.main_stats.difficulty) == 0 and spd > 0.5 {
			sound_ObjSound_Play(se_tan01)
			var fireangle = point_direction(x,y,obj_player.x,obj_player.y);
			shot_CreateShotA1(x_pos + (x_radius * cos(self_timer)),y_pos + (y_radius * sin(self_timer * 2)) / 2,1.25,fireangle + irandom_range(-15,15),spr_danmaku_dagger,5,0)
			shot_CreateShotA1(x_pos + (x_radius * cos(self_timer)),y_pos + (y_radius * sin(self_timer * 2)) / 2,1.5,fireangle + irandom_range(-10,10),spr_danmaku_arrowhead,5,0)
		}
		if count mod 20 == 0 {
			sound_ObjSound_Play(se_kira01)
			repeat(2 + (global.main_stats.difficulty * 2)) {
				var rainX = irandom_range(16,240);
				shot_CreateShotA1(rainX,8,0.9,270,spr_danmaku_bullet,15,15);
			}
		}
	}
	attack_veronica_main_03 = function() {
		if count == 0 {
			baseAngle = 0;
			timer = 60;
		}
		if count mod 10 == 0 {
			sound_ObjSound_Play(se_tan01)
			var leftWallX = irandom_range(8,40);
			var rightWallX = irandom_range(216,248);
			repeat(5) {
				shot_CreateShotA1(leftWallX,8,1,275 + irandom_range(-10,10),spr_danmaku_bullet,10,15);
				shot_CreateShotA1(rightWallX,8,1,265 + irandom_range(-10,10),spr_danmaku_bullet,10,15);
			}
		}
		if count mod 25 == 0 {
			sound_ObjSound_Play(se_kira01)
			var angleT = 0;
			repeat(18 + (global.main_stats.difficulty * 2)) {
				var inst = shot_CreateShotA1(x,y,0.5,baseAngle + angleT,spr_danmaku_star_s,15,0)
				with(inst) {
					set_function = function() {
						if count == 75 {
							spd = 1.75;
							sprite_index = spr_danmaku_arrowhead;
						}
					}
				}
				angleT += 360 / (18 + (global.main_stats.difficulty * 2))
			}
			baseAngle += 13;
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(24,232),irandom_range(80,140),60);
		}
	}
	attack_veronica_main_04 = function() {
		if count == 0 { 
			timer = 60 
			baseAngle = 0;
		}
		if count mod 6 == 0 {
			sound_ObjSound_Play(se_tan01)
			var angleT = 0;
			repeat(3 + global.main_stats.difficulty) {
				if count mod 12 == 0 {
					shot_CreateShotA1(x,y,1.4,baseAngle + angleT,spr_danmaku_arrowhead,10,0);
				}
				else {
					shot_CreateShotA1(x,y,1.4,(baseAngle + angleT) + 45,spr_danmaku_bullet,10,15);
				}
				angleT += 360 / (3 + global.main_stats.difficulty)
			}
			baseAngle += 7.5;
		}
		if count mod 60 == 0 {
			sound_ObjSound_Play(se_kira00)
			shot_CreateShotA1(16,8,0.6,270,spr_danmaku_ball_m1,20,0);
			shot_CreateShotA1(240,8,0.6,270,spr_danmaku_ball_m1,20,0);
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(24,232),irandom_range(80,140),60);
		}
	}
	attack_veronica_main_05 = function() {
		if count == 0 { timer = 60 }
		if count mod 240 == 0 {
			var Xstart = 8;
			var Ystart = 24;
			
			repeat(5) {
				shot_CreateStraightLaserA1(Xstart,0,270,36,1,180,spr_danmaku_laser,120,0);
				shot_CreateStraightLaserA1(0,Ystart,270,36,1,180,spr_danmaku_laser,120,0);
				Xstart += 56;
				Ystart += 56;
			}
		}
		if count mod 40 == 0 {
			sound_ObjSound_Play(se_tan01)
			var speedT = 2.25;
			var baseAngle = point_direction(x,y,obj_player.x,obj_player.y);
			repeat(global.main_stats.difficulty + 1) {
				for(var i = -1; i < 2; i++) {
					shot_CreateShotA1(x,y,speedT,baseAngle + (i * 12),spr_danmaku_bullet,8,15);
				}
				speedT -= 0.25;
			}
		}
		if count mod 80 == 0 {
			sound_ObjSound_Play(se_kira00)
			var baseAngle = irandom_range(0,360);
			repeat(20 + (global.main_stats.difficulty * 4)) {
				shot_CreateShotA1(x,y,0.75,baseAngle,spr_danmaku_ball_s1,15,0)
				baseAngle += 360 / (20 + (global.main_stats.difficulty * 4))
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(24,232),irandom_range(80,140),60);
		}
	}
	attack_veronica_main_06 = function() {
		if count == 0 { timer = 60 }
		if count mod 60 == 0 and count > 0 {
			sound_ObjSound_Play(se_option);
			var baseAngle = irandom_range(0,360);
			var i = 0;
			repeat(20 + (global.main_stats.difficulty * 4)) {
				var altspeed;
				if i mod 2 == 0 { altspeed = 0.7 } else { altspeed = 1.1 }
				shot_CreateShotA1(x,y,altspeed,baseAngle,spr_danmaku_arrowhead,10,0)
				baseAngle += 360 / (20 + (global.main_stats.difficulty * 4))
				i++
			}
			if count mod 120 == 0 {
				x_pos = irandom_range(32,224);
				y_pos = irandom_range(48,144);
			}
		}
		if count mod 30 == 0 {
			sound_ObjSound_Play(se_tan01)
			repeat(1 + global.main_stats.difficulty) {
				shot_CreateShotA1(8,irandom_range(16,272),1.25,315,spr_danmaku_bullet,5,15);
				shot_CreateShotA1(248,irandom_range(16,272),1.25,235,spr_danmaku_bullet,5,15);
			}
		}
	}
	
	//Spell cards
	spell_card_veronica_01 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_VERONICA_01,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_VERONICA_01"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		
		if count mod 90 == 0 and count > 0 {
			sound_ObjSound_Play(se_tan01)
			var k = 0;
			repeat(2 + (global.main_stats.difficulty * 2)) {
				var spinrapier;
				if k mod 2 == 0 { spinrapier = 32 } else { spinrapier = -32 }
				var inst = shot_CreateShotA1(x_pos + spinrapier,y_pos + 8,0.75,irandom_range(0,360),spr_danmaku_ball_s1,0,15)
				with(inst) {
					set_function = function() {
						if count == 0 { baseAngle = irandom_range(0,360) }
						if count mod 16 == 0 {
							var trailColor;
							if count mod 32 == 0 {
								trailColor = 0;
							}
							else {
								trailColor = 2;
							}
							var inst = shot_CreateShotA1(x,y,0,0,spr_danmaku_star_s,10,trailColor);
							with(inst) {
								set_function = function() {
									 if count == 45 {
										sound_ObjSound_Play(se_kira00)
										spd = 0.5;
										dir = irandom_range(0,360);
									 }
								}
							}
						}
						if count == 120 {
							repeat(12) {
								shot_CreateShotA1(x,y,0.9,baseAngle,spr_danmaku_ball_s1,10,0)
								baseAngle += 360 / 12
							}
							instance_destroy();
						}
					}
				}
				k++;
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(24,232),irandom_range(80,140),60);
		}
	}
	spell_card_veronica_02 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_VERONICA_02,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_VERONICA_02"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		if count mod 75 == 0 and count > 0 {
			sound_ObjSound_Play(se_lazer01)
			var baseAngle = irandom_range(0,360);
			repeat(6 + (global.main_stats.difficulty * 2)) {
				var inst = shot_CreateLooseLaserA1(x,y,1.2,baseAngle,1,1,spr_danmaku_laser,10,10)
				with(inst) {
					set_function = function() {
						image_xscale += 0.1;
						image_xscale = clamp(image_xscale,1,10);
					}
				}
				baseAngle += 360 / (6 + (global.main_stats.difficulty * 2))
			}
			if count mod 150 == 0 {
				move_ObjMove_SetDestAtFrame(self,irandom_range(24,232),irandom_range(32,96),60);
			}
		}
		if count mod 6 == 0 {
			sound_ObjSound_Play(se_tan01)
			var featherColor;
			if count mod 12 == 0 { featherColor = 10 } else { featherColor = 15 }
			var inst = shot_CreateShotA1(x,y,0,270,spr_danmaku_ball_s1,10,featherColor)
			with(inst) {
				set_function = function() {
					if count == 0 {
						swayX = x_pos;
						swayY = y_pos;
						swayDir = 90;
						rt = choose(-5,5);
					}
					x_pos = swayX + lengthdir_x(32,swayDir)
					y_pos = swayY + lengthdir_y(0,swayDir)
					swayY += 0.4;
					swayDir += rt;
				}
			}
		}
	}
	spell_card_veronica_03 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_VERONICA_03,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_VERONICA_03"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		if count mod 80 == 0 and count > 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(24,232),irandom_range(80,140),60);
		}
		if count mod 6 == 0 and spd > 1 {
			sound_ObjSound_Play(se_tan01)
			for(var i = -1 - global.main_stats.difficulty; i < 2 + global.main_stats.difficulty; i++) {
				shot_CreateShotA1(x,y,0.5,(dir + 180) + ((i * 15) + irandom_range(-10,10)),spr_danmaku_bullet,5,15);
			}
		}
		if count mod 50 == 0 {
			sound_ObjSound_Play(se_kira00)
			repeat(4) {
				var inst = shot_CreateLooseLaserA1(irandom_range(8,248),0,2,270,1,1,spr_danmaku_laser,10,0);
				with(inst) {
					set_function = function() {
						image_xscale += 0.05;
						image_xscale = clamp(image_xscale,1,25);
						if y_pos > 256 {
							instance_destroy();
							var baseAngle = irandom_range(0,360);
							repeat(2 + (global.main_stats.difficulty * 2)) {
								var inst = shot_CreateShotA1(x,y,random_range(1.25,2),baseAngle,spr_danmaku_arrowhead,5,0)
								with(inst) {
									set_function = function() {
										if count == 0 { bounceCount = 2 }
										if bounceCount >= 1 {
											if y_pos < 24 or y_pos > 264 {
												vspd *= -1;
											}
											if x_pos < 8 or x_pos > 248 {
												hspd *= -1;
											}
											bounceCount--;
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	spell_card_veronica_04 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_VERONICA_04,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_VERONICA_04"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		if count >= 60 {
			if count mod 12 == 0 {
				repeat(1 + global.main_stats.difficulty) {
					sound_ObjSound_Play(se_tan01)
					var baseAngle = irandom_range(0,360)
					var offset = sin(count * 8) * 35;
				
					var inst = shot_CreateShotA1(x,y,1,baseAngle + offset,spr_danmaku_amulet,10,12);
					with(inst) {
						spawnFrame = other.count;
						set_function = function() {
							if count == 45 {
								sound_ObjSound_Play(se_kira00)
								if spawnFrame mod 24 == 0 {
									spd = 0.6;
								}
								else {
									spd = 2.4;
								}
							}
							dir += irandom_range(-8,8);
						}
					}
					inst = shot_CreateShotA1(x,y,1.5,baseAngle + offset + 15,spr_danmaku_amulet,10,12);
					with(inst) {
						spawnFrame = other.count;
						set_function = function() {
							if count == 45 {
								sound_ObjSound_Play(se_kira00)
								if spawnFrame mod 24 == 0 {
									spd = 0.6;
								}
								else {
									spd = 2.4;
								}
							}
							dir += irandom_range(-8,8);
						}
					}
				}
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(24,232),irandom_range(48,96),60);
		}
	}
	spell_card_veronica_05 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_VERONICA_05,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_VERONICA_05"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 144;
			baseAngle = 0;
		}
		if count >= 60 {
			if count mod 8 == 0 {
				sound_ObjSound_Play(se_tan01)
				var angleT = 0;
				repeat(3 + global.main_stats.difficulty) {
					var graphic;
					if count mod 16 == 0 { graphic = 12; } else { graphic = 0; }
					var inst = shot_CreateShotA1(x,y,0.7,angleT,spr_danmaku_ball_m1,10,graphic);
					with(inst) {
						set_function = function() {
							dir += 0.3;
							if count == 50 {
								var sx = x_pos
								var sy = y_pos
								
								if sx > 8 and sx < 248 and sy > 8 and sy < 280 {
									sound_ObjSound_Play(se_kira02)
									var sporeAngle = point_direction(x,y,obj_player.x,obj_player.y)
									shot_CreateShotA1(sx,sy,2,sporeAngle,spr_danmaku_bullet,5,12);
								}
								instance_destroy();
							}
						}
					}
					angleT += 360 / (3 + global.main_stats.difficulty)
				}
				baseAngle += 4.5;
			}
		}
	}
	spell_card_veronica_06 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_VERONICA_06,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_VERONICA_06"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		if count mod 70 == 0 and count > 0 {
			sound_ObjSound_Play(se_kira01)
			for(var i = -1; i < 2; i++) {
				var inst = shot_CreateLooseLaserA1(x,y,0,(270 + 35) + (i * 20),25.6,1,spr_danmaku_laser,0,5);
				with(inst) {
					set_function = function() {
						if count == 40 {
							var inst = shot_CreateShotA1(x,y,2,direction,spr_danmaku_ball_m1,10,0);
							with(inst) {
								if count mod 25 == 0 {
									sound_ObjSound_Play(se_tan01)
									var baseAngle = irandom_range(0,360)
									repeat(18 + (global.main_stats.difficulty * 6)) {
										shot_CreateShotA1(x,y,1.6,baseAngle,spr_danmaku_bullet,5,14);
										baseAngle += 360 / (18 + (global.main_stats.difficulty * 6));
									}
								}
							}
						}
						if count == 100 {
							instance_destroy();
						}
					}
				}
				inst = shot_CreateLooseLaserA1(x,y,0,(270 - 35) + (i * 20),25.6,1,spr_danmaku_laser,0,5);
				with(inst) {
					set_function = function() {
						if count == 40 {
							var inst = shot_CreateShotA1(x,y,2,direction,spr_danmaku_ball_m1,10,0);
							with(inst) {
								if count mod 25 == 0 {
									sound_ObjSound_Play(se_tan01)
									var baseAngle = irandom_range(0,360)
									repeat(18 + (global.main_stats.difficulty * 6)) {
										shot_CreateShotA1(x,y,1.6,baseAngle,spr_danmaku_bullet,5,14);
										baseAngle += 360 / (18 + (global.main_stats.difficulty * 6));
									}
								}
							}
						}
						if count == 100 {
							instance_destroy();
						}
					}
				}
			}
		}
	}
	spell_card_veronica_07 = function() {
		if count == 0 {
			timer = 70;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_VERONICA_07,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_VERONICA_07"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		if count == 60 {
			sound_ObjSound_Play(se_lazer01)
			laserL = shot_CreateLooseLaserA1(8,8,0,270,24,1,spr_danmaku_laser,0,15);
			prop_ObjShot_SetSpellResist(laserL,true);
			laserR = shot_CreateLooseLaserA1(248,8,0,270,24,1,spr_danmaku_laser,0,15);
			prop_ObjShot_SetSpellResist(laserR,true);
			laserT = shot_CreateLooseLaserA1(8,24,0,0,24,1,spr_danmaku_laser,0,15);
			prop_ObjShot_SetSpellResist(laserT,true);
			laserB = shot_CreateLooseLaserA1(8,264,0,0,24,1,spr_danmaku_laser,0,15);
			prop_ObjShot_SetSpellResist(laserB,true);
		}
		if count >= 60 {
			if count mod 3 == 0 {
				laserL.x_pos += 0.25;
				laserR.x_pos -= 0.25;
				laserT.y_pos += 0.25;
				laserB.y_pos -= 0.25;
			}
			if laserL.x_pos > 64 {
				laserL.x_pos = 8;
				laserR.x_pos = 248;
				laserT.y_pos = 24;
				laserB.y_pos = 264;
			}
			if count mod 12 == 0 {
				sound_ObjSound_Play(se_tan01)
				var clusterSize = 3 + global.main_stats.difficulty;
				repeat(clusterSize) {
					var inst = shot_CreateShotA1(irandom_range(8,248),8,random_range(0.9,1.75),270 + irandom_range(-15,15),spr_danmaku_ball_m1,10,0)
					with(inst) {
						set_function = function() {
							if count == 0 { gravityDelay = irandom_range(40,80) }
							if count == gravityDelay {
								spd *= 1.5;
							}
						}
					}
				}
			}
		}
	}
}