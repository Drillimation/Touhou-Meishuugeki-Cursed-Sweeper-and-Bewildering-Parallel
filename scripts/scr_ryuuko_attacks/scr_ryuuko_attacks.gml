function scr_ryuuko_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_RYUUKO
	
	//Main attacks
	attack_ryuuko_mid = function() {
		if count mod 20 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = irandom_range(0,360);
			repeat(12 + (global.main_stats.difficulty * 2)) {
				var inst = shot_CreateShotA1(x,y,2,angleT,spr_danmaku_amulet,5,8);
				move_ObjMove_SetAcceleration(inst,-0.05)
				with(inst) {
					set_function = function() {
						if count <= 299 {
							spd = clamp(spd,0.25,2);
						}
						if count == 300 {
							sound_ObjSound_Play(se_kira00);
							move_ObjMove_SetAcceleration(self,0.01);
							move_ObjMove_SetMaxSpeed(self,2);
						}
					}
				}
				angleT += 7.5
			}
		}
		
		if count mod 120 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(32,144),1);
		}
	}
	attack_ryuuko_01 = function() {
		if count mod 20 == 0 {
			sound_ObjSound_Play(se_tan01);
			var baseAngle = irandom_range(0,360);
			var i = 0;
			repeat(20 + (global.main_stats.difficulty * 4)) {
				var shotGraphic;
				if i mod 2 == 0 {
					shotGraphic = 10;
				}
				else {
					shotGraphic = 12;
				}
				shot_CreateShotA1(x,y,1.25,baseAngle,spr_danmaku_seed_s,10,shotGraphic)
				baseAngle += 360 / (20 + (global.main_stats.difficulty * 4))
				i++;
			}
		}
		if count mod 80 == 40 {
			sound_ObjSound_Play(se_kira00);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			var speedT = 1.75;
			repeat(global.main_stats.difficulty + 3) {
				for(var i = -1; i < 2; i++) {
					shot_CreateShotA1(x,y,speedT,angleT + (i * 15),spr_danmaku_ball_s1,5,10)
				}
				speedT -= 0.125;
			}
		}
		if count mod 150 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(32,144),1);
		}
	}
	attack_ryuuko_02 = function() {
		if count == 0 { timer = 40; }
		if count mod 15 == 0 {
			sound_ObjSound_Play(se_tan01);
			var baseAngle = 270;
			for(var i = -1 - global.main_stats.difficulty; i < 2 + global.main_stats.difficulty; i++) {
				if i != 0 {
					shot_CreateShotA1(x,y,0.9,baseAngle + (i * 20),spr_danmaku_shard,15,12);
				}
			}
		}
		if count mod 60 == 0 {
			sound_ObjSound_Play(se_kira01);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			var speedT = 1.9;
			repeat(3 + (global.main_stats.difficulty * 2)) {
				shot_CreateShotA1(x_pos - 32,y_pos + 8,speedT,angleT,spr_danmaku_ball_s1,5,10);
				speedT -= 0.15;
			}
		}
		if count mod 60 == 30 {
			sound_ObjSound_Play(se_kira01);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			var speedT = 1.9;
			repeat(3 + (global.main_stats.difficulty * 2)) {
				shot_CreateShotA1(x_pos + 32,y_pos + 8,speedT,angleT,spr_danmaku_ball_s1,5,10);
				speedT -= 0.15;
			}
		}
		if count mod 180 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(32,144),1);
		}
	}
	attack_ryuuko_03 = function() {
		if count == 0 { timer = 40; }
		if count == 1 {
			spinAngle = 0;
		}
		
		if count mod 8 == 0 and count > 0 {
			sound_ObjSound_Play(se_tan02);
			var speedT = 1.4;
			repeat(1 + global.main_stats.difficulty) {
				shot_CreateShotA1(x_pos - 40,y_pos + 16,speedT,45 + spinAngle,spr_danmaku_ball_s1,10,10);
				shot_CreateShotA1(x_pos + 40,y_pos + 16,speedT,135 - spinAngle,spr_danmaku_ball_s1,10,10);
				speedT -= 0.125;
			}
			spinAngle += 11.5;
		}
		if count mod 50 == 0 {
			sound_ObjSound_Play(se_kira01);
			var baseAngle = irandom_range(0,360);
			repeat(20 + (global.main_stats.difficulty * 4)) {
				shot_CreateShotA1(x,y,2,baseAngle,spr_danmaku_shard,10,12);
				baseAngle += 360 / (20 + (global.main_stats.difficulty * 4));
			}
		}
		if count mod 150 == 0 and count > 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(32,96),1);
		}
	}
	
	//Spell cards
	spellcard_ryuuko_01 = function() {
		if count == 0 {
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ryuuko_portrait,0,_load_file.enemy_spell.SPELL_RYUUKO_01,spr_tatsumaru_spell)
			global.main_stats.current_spell = "SPELL_RYUUKO_01"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 144;
			self_timer = 0;
			spd = 0.05; // Adjust this to change the speed of the loop
			x_radius = 72; // Width of the infinity loop
			y_radius = 48; // Height of the infinity loop
		}
		if count > 0 {
			// Increment the timer
			self_timer += spd;

			// Calculate Figure-8 (Lemniscate) using trigonometry
			x_pos = 128 + (x_radius * cos(self_timer));
			y_pos = 96 + (y_radius * sin(self_timer * 2)) / 2;
		}
		if count >= 60 {
			if count mod 6 == 0 {
				sound_ObjSound_Play(se_tan02);
				var inst = shot_CreateShotA1(x,y,0,irandom_range(0,360),spr_danmaku_ball_m2,20,10);
				with(inst) {
					set_function = function() {
						if count == 90 {
							dir = point_direction(x,y,obj_player.x,obj_player.y) + irandom_range(-10,10);
							move_ObjMove_SetAcceleration(self,0.05);
							move_ObjMove_SetMaxSpeed(self,1.5);
						}
					}
				}
			}
			if count mod 90 == 0 {
				sound_ObjSound_Play(se_kira01);
				var baseAngle = irandom_range(0,360);
				repeat(20 + (global.main_stats.difficulty * 4)) {
					shot_CreateShotA1(x,y,1.1,baseAngle,spr_danmaku_bullet,10,12);
					baseAngle += 360 / (20 + (global.main_stats.difficulty * 4));
				}
			}
		}
	}
	spellcard_ryuuko_02 = function() {
		if count == 0 {
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ryuuko_portrait,0,_load_file.enemy_spell.SPELL_RYUUKO_02,spr_tatsumaru_spell)
			global.main_stats.current_spell = "SPELL_RYUUKO_02"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 144;
		}
		if count >= 60 {
			if count mod 30 == 0 {
				sound_ObjSound_Play(se_tan01);
				var baseAngle = count * 0.7;
				repeat(12 + (global.main_stats.difficulty * 2)) {
					var inst = shot_CreateShotA1(x,y,1.5,baseAngle,spr_danmaku_ball_m2,15,12);
					with(inst) {
						set_function = function() {
							if count < 90 {
								spd -= 0.0125;
							}
							if count > 60 {
								image_alpha -= 0.04;
							}
							if image_alpha <= 0 { instance_destroy(); }
						}
					}
					baseAngle += 360 / (12 + (global.main_stats.difficulty * 2))
				}
			}
			if count mod 12 == 0 {
				sound_ObjSound_Play(se_kira01);
				var playerAngle = irandom_range(0,360);
				var speedT = 1.5;
				repeat(4) {
					for(var i = -2; i < 3; i++) {
						shot_CreateShotA1(x,y,speedT,playerAngle + (i * 10),spr_danmaku_bullet,0,12);
					}
					speedT -= 0.125;
				}
			}
		}
	}
	spellcard_ryuuko_03 = function() {
		if count == 0 {
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ryuuko_portrait,0,_load_file.enemy_spell.SPELL_RYUUKO_03,spr_tatsumaru_spell)
			global.main_stats.current_spell = "SPELL_RYUUKO_03"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
			t = 0;
			waveAngle = 0;
			self_timer = 0;
			spd = 0.025; // Adjust this to change the speed of the loop
			x_radius = 72; // Width of the infinity loop
			y_radius = 0; // Height of the infinity loop
		}
		if count > 0 {
			// Increment the timer
			self_timer += spd;

			// Calculate Figure-8 (Lemniscate) using trigonometry
			x_pos = 128 + (x_radius * cos(self_timer));
			y_pos = 96 + (y_radius * sin(self_timer * 2)) / 2;
		}
		if count >= 60 {
			if count mod 20 == 0 {
				sound_ObjSound_Play(se_tan02);
				var leftAngle = 270 + (sin(waveAngle) * 35);
				shot_CreateShotA1(x_pos - 20,y,1,leftAngle,spr_danmaku_shard,8,12);
				var rightAngle = 270 - (sin(waveAngle) * 35);
				shot_CreateShotA1(x_pos + 20,y,1,rightAngle,spr_danmaku_shard,8,12);
				waveAngle += 8;
			}
			if count mod 120 == 0 {
				sound_ObjSound_Play(se_kira01);
				repeat(1 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(8,irandom_range(24,264),0,0,spr_danmaku_ball_l,10,10);
					with(inst) {
						set_function = function() {
							if count == 45 {
								sound_ObjSound_Play(se_kira01);
								//var baseAngle = point_direction(x,y,obj_player.x,obj_player.y);
								var baseAngle = 0;
								for(var i = -2; i < 3; i++) {
									for(var j = 0; j < 3; j++) {
										shot_CreateShotA1(x,y,1.2 - (j * 0.2),baseAngle + (i * 12),spr_danmaku_ball_s1,5,10)
									}
								}
								instance_destroy();
							}
						}
					}
					inst = shot_CreateShotA1(248,irandom_range(24,264),0,0,spr_danmaku_ball_l,10,10);
					with(inst) {
						set_function = function() {
							if count == 45 {
								sound_ObjSound_Play(se_kira01);
								//var baseAngle = point_direction(x,y,obj_player.x,obj_player.y);
								var baseAngle = 180;
								for(var i = -2; i < 3; i++) {
									for(var j = 0; j < 3; j++) {
										shot_CreateShotA1(x,y,1.2 - (j * 0.2),baseAngle + (i * 12),spr_danmaku_ball_s1,5,10)
									}
								}
								instance_destroy();
							}
						}
					}
				}
			}
		}
	}
	spellcard_ryuuko_04 = function() {
		if count == 0 {
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ryuuko_portrait,0,_load_file.enemy_spell.SPELL_RYUUKO_04,spr_tatsumaru_spell)
			global.main_stats.current_spell = "SPELL_RYUUKO_04"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
			clockAngle = 0;
		}
		if count >= 60 {
			if count mod 6 == 0 {
				sound_ObjSound_Play(se_tan02);
				var angleT = 0;
				repeat(3 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(x,y,1,clockAngle + angleT,spr_danmaku_ball_s1,10,10);
					with(inst) {
						set_function = function() {
							if count == 0 { isFrozen = 0; }
							if isFrozen == 1 {
								spd = 0;
								image_index = 12;
							}
							if isFrozen == 2 {
								spd = 2.25;
								image_index = 10;
								move_ObjMove_SetAcceleration(self,-0.04);
								isFrozen = 0;
								
							}
						}
					}
					angleT += 360 / (3 + global.main_stats.difficulty)
				}
				clockAngle += 4.5;
			}
			if count mod 240 == 180 {
				sound_ObjSound_Play(se_tan01);
				with(obj_enemy_bullet) {
					isFrozen = 1;
				}
				var playerAngle = point_direction(x,y,obj_player.x,obj_player.y);
				for(var i = -1 - global.main_stats.difficulty; i < 2 + global.main_stats.difficulty; i++) {
					shot_CreateShotA1(x,y,2.25,playerAngle + (i * 10),spr_danmaku_bullet,0,12);
				}
			}
			if count mod 240 == 200 {
				sound_ObjSound_Play(se_tan01);
				var playerAngle = point_direction(x,y,obj_player.x,obj_player.y);
				for(var i = -1 - global.main_stats.difficulty; i < 2 + global.main_stats.difficulty; i++) {
					shot_CreateShotA1(x,y,2.25,playerAngle + (i * 10),spr_danmaku_bullet,0,12);
				}
			}
			if count mod 240 == 220 {
				sound_ObjSound_Play(se_tan01);
				var playerAngle = point_direction(x,y,obj_player.x,obj_player.y);
				for(var i = -1 - global.main_stats.difficulty; i < 2 + global.main_stats.difficulty; i++) {
					shot_CreateShotA1(x,y,2.25,playerAngle + (i * 10),spr_danmaku_bullet,0,12);
				}
			}
			if count mod 240 == 235 {
				sound_ObjSound_Play(se_kira01);
				with(obj_enemy_bullet) {
					isFrozen = 2;
				}
			}
		}
	}
}