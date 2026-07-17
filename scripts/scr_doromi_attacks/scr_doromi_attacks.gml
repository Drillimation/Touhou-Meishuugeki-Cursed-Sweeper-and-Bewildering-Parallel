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
		if count == 0 { timer = 60; }
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
		}
		if count mod 12 == 0 {
			sound_ObjSound_Play(se_kira01);
			var angleL = 180 + (sin(swingAngle) * 45);
			shot_CreateShotA1(x,y,0.9,angleL,spr_danmaku_butterfly,12,12);
			var angleR = 180 - (sin(swingAngle) * 45);
			shot_CreateShotA1(x,y,0.9,angleR,spr_danmaku_butterfly,12,12);
			swingAngle += 15;
			
		}
		if count mod 6 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			var speedT = 2.25;
			repeat(1 + global.main_stats.difficulty) {
				shot_CreateShotA1(x,y,speedT,angleT - 5,spr_danmaku_arrowhead,4,1);
				shot_CreateShotA1(x,y,speedT,angleT + 5,spr_danmaku_arrowhead,4,2);
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
			sprialAngle1 = 0;
			spiralAngle2 = 180;
			timer = 60;
		}
		if count mod 3 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = 0;
			repeat(1 + global.main_stats.difficulty) {
				shot_CreateShotA1(x,y,1.1,spiralAngle1 + angleT,spr_danmaku_ball_s1,5,15);
				angleT += 360 / (1 + global.main_stats.difficulty)
			}
			shot_CreateShotA1(x,y,0.9,spiralAngle2,spr_danmaku_ball_s1,5,2);
			if global.main_stats.difficulty >= 2 {
				shot_CreateShotA1(x,y,0.9,spiralAngle2,spr_danmaku_ball_s1,5,2);
			}
		}
		if count mod 70 == 0 {
			sound_ObjSound_Play(se_kira01);
			repeat(3 + global.main_stats.difficulty) {
				var inst = shot_CreateShotA1(128 + (irandom_range(-120,120)),y,0.6,270,spr_danmaku_ball_l,20,0);
				with(inst) {
					set_function = function() {
						if y_pos >= 144 {
							sound_ObjSound_Play(se_focusfix);
							var angleT = irandom_range(0,360);
							repeat(24) {
								shot_CreateShotA1(x,y,1.75,angleT,spr_danmaku_dagger,10,12);
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
		if count == 0 { timer = 60; }
		if count mod 80 == 0 {
			sound_ObjSound_Play(se_kira01);
			var baseAngle = irandom_range(0,360);
			repeat(20 + (global.main_stats.difficulty * 4)) {
				var inst = shot_CreateShotA1(x,y,1.75,baseAngle,15,14);
				with(inst) {
					set_function = function() {
						if count == 45 {
							sound_ObjSound_Play(se_kira01);
							move_ObjMove_SetAcceleration(self,-0.075);
						}
						if count == 85 {
							sound_ObjSound_Play(se_kira00);
							move_ObjMove_SetAcceleration(self,0);
							direction = 270 + irandom_range(-15,15);
							speed = 0.9;
						}
					}
				}
				baseAngle += 360 / (20 + (global.main_stats.difficulty * 4))
			}
		}
		if count mod 35 == 0 {
			sound_ObjSound_Play(se_tan01);
			var sidePos, targetAngle, h;
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
				var inst = shot_CreateShotA1((x_pos + 16) + irandom_range(4,48),y,0.5,270 + irandom_range(-10,10),spr_danmaku_ball_l,20,12);
				with(inst) {
					set_function = function() {
						if count mod 8 == 0 and y_pos < 240 {
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
		}
		if count mod 14 == 0 {
			sound_ObjSound_Play(se_kira01)
			var angleT = ringAngle;
			repeat(12 + (global.main_stats.difficulty * 4)) {
				var inst = shot_CreateShotA1(x,y,1.9,angleT,spr_danmaku_ball_s1,10,0);
				with(inst) {
					set_function = function() {
						if count >= 40 {
							if speed > 0.6 {
								speed -= 0.05;
							}
						}
					}
				}
				angleT += 360 / (12 + (global.main_stats.difficulty * 4))
			}
			ringAngle += 11.5;
		}
		if count mod 4 == 0 {
			sound_ObjSound_Play(se_tan02);
			shot_CreateShotA1(irandom_range(8,248),8,2.5,270 + irandom_range(-5,5),spr_danmaku_arrowhead,5,1);
		}
	}
	attack_doromi_08 = function() {
		if count == 0 {
			timer = 60;
			ashAngle = 315;
		}
		if count mod 90 == 0 {
			sound_ObjSound_Play(se_kira00)
			var spacing = 8;
			repeat(4 + global.main_stats.difficulty) {
				var inst = shot_CreateShotA1(spacing,8,0.75,270,spr_danmaku_ball_l,15,0)
				with(inst) {
					set_function = function() {
						if count >= 80 {
							if speed > 0.2 {
								speed -= 0.025;
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
	}
	
	//Spell cards
	spell_card_doromi_01 = function() {
	
	}
	spell_card_doromi_02 = function() {
	
	}
	spell_card_doromi_03 = function() {
	
	}
	spell_card_doromi_04 = function() {
	
	}
	spell_card_doromi_05 = function() {
	
	}
	spell_card_doromi_06 = function() {
	
	}
	spell_card_doromi_07 = function() {
	
	}
	spell_card_doromi_08 = function() {
	
	}
	spell_card_doromi_09 = function() {
	
	}
}