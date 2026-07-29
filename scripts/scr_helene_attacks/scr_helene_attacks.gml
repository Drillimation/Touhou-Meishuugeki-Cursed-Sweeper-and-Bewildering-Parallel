function scr_helene_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_HELENE
	
	//Main attacks
	attack_helene_mid = function() {
		if count == 0 { timer = 40; }
		if count <= 80 {
			if count mod 10 == 0 {
				sound_ObjSound_Play(se_tan02);
				repeat(7 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(x,y,random_range(0.5,1),random_range(180,360),choose(spr_danmaku_seed_s,spr_danmaku_seed_m),5,irandom_range(0,2))
					move_ObjMove_SetAngularVelocity(inst,random_range(-1,1));
					inst.grav = 0.005;
				}
			}
		}
		if count == 80 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		if count == 140 {
			count = 1;
		}
	}
	attack_helene_main_1 = function() {
		if count == 0 {
			spd = 0;
			x_pos = 128;
			y_pos = 96;
			move_mode = false;
			timer = 40;
		}
		if count <= 80 {
			if count mod 8 == 0 {
				sound_ObjSound_Play(se_tan02);
				repeat(7 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(x,32,random_range(0.5,1),random_range(180,360),choose(spr_danmaku_seed_s,spr_danmaku_seed_m),5,5)
					move_ObjMove_SetAngularVelocity(inst,random_range(-1,1));
					inst.grav = 0.005;
					with(inst) {
						set_function = function() {
							if count mod 15 == 0 {
								image_index -= 1;
								image_index = clamp(image_index,0,5);
							}
						}
					}
				}
			}
		}
		if count == 80 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		if count == 140 {
			count = 1;
		}
	}
	attack_helene_main_2 = function() {
		if count == 0 {
			spd = 0;
			x_pos = 128;
			y_pos = 96;
			move_mode = false;
			timer = 40;
		}
		if count mod 5 == 0 {
			sound_ObjSound_Play(se_tan02);
			repeat(6 - global.main_stats.difficulty) {
				var inst = shot_CreateShotA1(irandom_range(8,248),32,0,270,spr_danmaku_seed_s,5,choose(10,15))
				inst.grav = 0.01;
			}
		}
		
		if count == 80 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		if count == 140 {
			count = 1;
		}
	}
	attack_helene_main_3 = function() {
		if count == 0 {
			spd = 0;
			x_pos = 128;
			y_pos = 96;
			move_mode = false;
			timer = 40;
		}
		if count <= 80 {
			if count mod 8 == 0 {
				sound_ObjSound_Play(se_tan02);
				repeat(7 + global.main_stats.difficulty) {
					shot_CreateShotA1(x,y,random_range(0.5,1),random_range(180,360),choose(spr_danmaku_seed_s,spr_danmaku_seed_m,spr_danmaku_ball_l),5,2)
				}
			}
		}
		if count == 80 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		if count == 140 {
			count = 0;
		}
	}
	
	//Spell cards
	spell_card_helene_01 = function() {
		if count == 0 { 
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_helene_portrait,0,_load_file.enemy_spell.SPELL_HELENE_01,spr_helene_spell)
			global.main_stats.current_spell = "SPELL_HELENE_01"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
		}
		
		if count <= 80 {
			if count mod 8 == 0 {
				sound_ObjSound_Play(se_tan02);
				var ex = 16;
				repeat(7) {
					for(var i = 0; i < global.main_stats.difficulty + 1; i++) {
						var inst = shot_CreateShotA1(ex,32,random_range(0.5,1),random_range(180,360),spr_danmaku_seed_s,5,5)
						move_ObjMove_SetAngularVelocity(inst,random_range(-1,1));
						inst.grav = 0.005;
						with(inst) {
							set_function = function() {
								if count mod 30 == 0 {
									image_index -= 1;
									image_index = clamp(image_index,0,5);
								}
							}
						}
						ex += 32;
					}
				}
			}
		}
		if count == 80 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		if count == 140 {
			count = 1;
		}
	}
	spell_card_helene_02 = function() {
		if count == 0 { 
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_helene_portrait,0,_load_file.enemy_spell.SPELL_HELENE_02,spr_helene_spell)
			global.main_stats.current_spell = "SPELL_HELENE_02"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
		}
		if count >= 60 {
			if count mod 160 == 0 {
				sound_ObjSound_Play(se_kira00);
				var gapPositions = 45
				repeat(4) {
					var baseAngle = irandom_range(0,360);
					for(var i = 0; i < 18 + (global.main_stats.difficulty * 6); i++) {
						var ex = x_pos + lengthdir_x(24,gapPositions);
						var ey = y_pos + lengthdir_y(24,gapPositions);
						shot_CreateShotA1(ex,ey,1,baseAngle + ((360 / (18 + (global.main_stats.difficulty * 6))) * i),spr_danmaku_ball_s1,10,10)
					}
					gapPositions += 90;
				}
			}
			if count mod 25 == 0 {
				sound_ObjSound_Play(se_tan01);
				repeat(6 + (global.main_stats.difficulty * 2)) {
					shot_CreateShotA1(x_pos + irandom_range(-48,48),y_pos + irandom_range(-8,8),random_range(0.75,2),irandom_range(235,315),spr_danmaku_arrowhead,5,15);
				}
			}
			if count mod 80 == 0 {
				move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),30);
			}
		}
	}
	spell_card_helene_03 = function() {
		if count == 0 { 
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_helene_portrait,0,_load_file.enemy_spell.SPELL_HELENE_03,spr_helene_spell)
			global.main_stats.current_spell = "SPELL_HELENE_03"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
		}
		
		if count <= 80 {
			if count mod 8 == 0 {
				sound_ObjSound_Play(se_tan02);
				var ex = 16;
				repeat(7) {
					for(var i = 0; i < global.main_stats.difficulty + 1; i++) {
						var inst = shot_CreateShotA1(ex,32,random_range(0.5,1),random_range(180,360),spr_danmaku_seed_m,5,5)
						move_ObjMove_SetAngularVelocity(inst,random_range(-1,1));
						inst.grav = 0.005;
						with(inst) {
							set_function = function() {
								if count mod 30 == 0 {
									image_index -= 1;
									image_index = clamp(image_index,0,5);
								}
							}
						}
						ex += 32;
					}
				}
			}
		}
		if count == 80 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		if count == 140 {
			count = 1;
		}
	}
	spell_card_helene_04 = function() {
		if count == 0 { 
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_helene_portrait,0,_load_file.enemy_spell.SPELL_HELENE_04,spr_helene_spell)
			global.main_stats.current_spell = "SPELL_HELENE_04"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
		}
		
		if count >= 45 {
			if count mod 45 == 0 {
				sound_ObjSound_Play(se_tan01);
				var offsetX = 8;
				repeat(15) {
					for(var i = 0; i < 4; i++) {
						var inst = shot_CreateShotA1(offsetX + irandom_range(-4,4),8,irandom_range(0.6,1.1),270 + irandom_range(-5,5),choose(spr_danmaku_seed_s,spr_danmaku_seed_m),10,0)
						with(inst) {
							set_function = function() {
								var t = irandom_range(0,360);							
								move_ObjMove_SetAngle(self,dir + (sin(t) * 0.8))
								t += 4;
							}
						}
					}
					offsetX += 16;
				}
			}
			if count mod 90 == 0 {
				move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
			}
		}
	}
	spell_card_helene_05 = function() {
		if count == 0 { 
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_helene_portrait,0,_load_file.enemy_spell.SPELL_HELENE_05,spr_helene_spell)
			global.main_stats.current_spell = "SPELL_HELENE_05"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
		}
		
		if count == 60 {
			for(var i = 0; i < 8; i++) {
				for(var j = 0; j < 4; j++) {
					var inst = shot_CreateShotA1(16 + (i * 32),32 + (j * 32),0,0,spr_danmaku_ball_l,5,2);
					prop_ObjShot_SetSpellResist(inst,true);
				}
			}
		}
		if count >= 60 and count <= 140 {
			if count mod 8 == 0 {
				sound_ObjSound_Play(se_tan02);
				repeat(7 + global.main_stats.difficulty) {
					shot_CreateShotA1(x,y,random_range(0.5,1),random_range(180,360),choose(spr_danmaku_seed_s,spr_danmaku_seed_m,spr_danmaku_ball_l),5,2)
				}
			}
		}
		if count == 140 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		if count == 200 {
			count = 61;
		}
	}
	spell_card_helene_06 = function() {
		if count == 0 { 
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_helene_portrait,0,_load_file.enemy_spell.SPELL_HELENE_06,spr_helene_spell)
			global.main_stats.current_spell = "SPELL_HELENE_06"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 144;
			angleT = 0;
		}
		
		if count >= 60 {
			if count mod 16 == 0 {
				sound_ObjSound_Play(se_tan02);
				repeat(3 + global.main_stats.difficulty) {
					var speedT = random_range(0.4,0.9)
					var targetAngle = angleT + irandom_range(-10,10)
					shot_CreateShotA1(x,y,speedT,targetAngle,spr_danmaku_ball_m2,20,2)
					shot_CreateShotA1(x,y,speedT * 0.7,targetAngle + 180,spr_danmaku_star_m,20,2)
					angleT += 360 / (3 + global.main_stats.difficulty)
				}
				angleT += 2.3;
			}
		}
		//if count == 240 { angleToPlayer = arctan2(obj_player.y - y,obj_player.x - x); }
		if count >= 240 and count < 270 {
			if count mod 12 == 0 {
				angleToPlayer = point_direction(x,y,obj_player.x,obj_player.y)
				sound_ObjSound_Play(se_kira00);
				for(var i = -40; i <= 40; i+=10) {
					shot_CreateShotA1(x,y,2.25,angleToPlayer + i,spr_danmaku_bullet,5,1);
				}
			}
		}
		if count == 280 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,144),60);
			count = 60;
		}
	}
	spell_card_helene_07 = function() {
		if count == 0 { 
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_helene_portrait,0,_load_file.enemy_spell.SPELL_HELENE_05,spr_helene_spell)
			global.main_stats.current_spell = "SPELL_HELENE_07"
			spd = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
		}
		
		if count >= 60 and count <= 140 {
			if count mod 8 == 0 {
				sound_ObjSound_Play(se_tan02);
				repeat(7 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(x,32,random_range(0.5,1),random_range(180,360),choose(spr_danmaku_seed_s,spr_danmaku_seed_m),5,5)
					move_ObjMove_SetAngularVelocity(inst,random_range(-1,1));
					inst.grav = 0.005;
					with(inst) {
						set_function = function() {
							if count mod 15 == 0 {
								image_index -= 1;
								image_index = clamp(image_index,0,5);
							}
						}
					}
				}
			}
		}
		if count == 140 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		
		if count >= 200 and count <= 280 and count mod 5 == 0 {
			sound_ObjSound_Play(se_tan02);
			repeat(6 - global.main_stats.difficulty) {
				var inst = shot_CreateShotA1(irandom_range(8,248),32,0,270,spr_danmaku_seed_s,5,choose(10,15))
				inst.grav = 0.01;
			}
		}
		
		if count == 280 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		
		if count >= 340 and count <= 420 {
			if count mod 8 == 0 {
				sound_ObjSound_Play(se_tan02);
				repeat(7 + global.main_stats.difficulty) {
					shot_CreateShotA1(x,y,random_range(0.5,1),random_range(180,360),choose(spr_danmaku_seed_s,spr_danmaku_seed_m,spr_danmaku_ball_l),5,2)
				}
			}
		}
		if count == 420 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		if count == 480 {
			count = 60;
		}
	}
}