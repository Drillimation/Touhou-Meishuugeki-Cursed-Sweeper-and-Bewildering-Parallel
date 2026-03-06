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
					inst.gravity = 0.005;
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
			speed = 0;
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
					inst.gravity = 0.005;
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
			speed = 0;
			x_pos = 128;
			y_pos = 96;
			move_mode = false;
			timer = 40;
		}
		if count mod 5 == 0 {
			sound_ObjSound_Play(se_tan02);
			repeat(6 - global.main_stats.difficulty) {
				var inst = shot_CreateShotA1(irandom_range(8,248),32,0,270,spr_danmaku_seed_s,5,choose(10,15))
				inst.gravity = 0.01;
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
			speed = 0;
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
			speed = 0;
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
						inst.gravity = 0.005;
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
	spell_card_helene_03 = function() {
		if count == 0 { 
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_helene_portrait,0,_load_file.enemy_spell.SPELL_HELENE_03,spr_helene_spell)
			speed = 0;
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
						inst.gravity = 0.005;
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
	spell_card_helene_05 = function() {
		if count == 0 { 
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_helene_portrait,0,_load_file.enemy_spell.SPELL_HELENE_05,spr_helene_spell)
			speed = 0;
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
	spell_card_helene_07 = function() {
		if count == 0 { 
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_helene_portrait,0,_load_file.enemy_spell.SPELL_HELENE_05,spr_helene_spell)
			speed = 0;
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
					inst.gravity = 0.005;
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
				inst.gravity = 0.01;
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