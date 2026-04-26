function scr_fusana_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_FUSANA
	
	//Main attacks
	attack_fusana_main_01 = function() {
		if count == 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,128),60);
		}
		
		if count == 60 {
			angleT = point_direction(x,y,obj_player.x,obj_player.y);
			for(var i = 0; i < 20; i++) {
				shot_CreateShotA1(x,y,1,angleT + (i * 18),spr_danmaku_ball_s1,10,15);
			}
		}
		if count >= 60 and count <= 120 {
			if count mod 15 == 0 {
				angleX = irandom_range(0,360)
				for(var j = -2 - (global.main_stats.difficulty); j < 3 + (global.main_stats.difficulty); j++) {
					repeat(5) {
						shot_CreateShotA1(x,y,1.5,angleX + (j * 10),spr_danmaku_star_s,5,2)
					}
				}
			}
		}
		if count == 200 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,128),60);
			count = 0;
		}
	
	}
	attack_fusana_main_02 = function() {
		if count mod 60 == 0 {
			for(var i = 0; i < 4; i++) {
				var inst = shot_CreateShotA1((32 + (128 * i)) + irandom_range(-16,16),16,0.75,270,spr_danmaku_ball_l,20,15);
				with(inst) {
					if count == 0 {
						explode_point = irandom_range(60,120);
					}
					if count == explode_point {
						var angleT = irandom_range(0,360);
						for(var j = 0; j < 6 + (global.main_stats.difficulty * 2); j++) {
							shot_CreateShotA1(x,y,2.5,angleT + (j * 30),spr_danmaku_bullet,5,15);
						}
						instance_destroy();
					}
				}
			}
		}
		
		if count mod 180 == 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,128),60);
		}
	}
	attack_fusana_main_03 = function() {
		if count == 0 {
			baseAngle = 0;
		}
		if count mod 30 == 0 {
			for(var i = 0; i < 10 + (global.main_stats.difficulty * 2); i++) {
				shot_CreateShotA1(x,y,1,baseAngle + (i * (360/(10 + (global.main_stats.difficulty * 2)))),spr_danmaku_seed_s,10,12)
				shot_CreateShotA1(x,y,1,baseAngle - (i * (360/(10 + (global.main_stats.difficulty * 2)))),spr_danmaku_seed_s,10,10)
			}
			baseAngle += 15;
		}
		if baseAngle mod 60 == 0 {
			var angleT = point_direction(x,y,obj_player.x,obj_player.y)
			for(var i = -1; i < 2; i++) {
				shot_CreateShotA1(x,y,2,angleT + (15 * i),spr_danmaku_star_m,5,2)
			}
		}
	}
	
	//Spell cards
	spell_card_fusana_01 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_fusana_portrait,0,_load_file.enemy_spell.SPELL_FUSANA_01,spr_fusana_spell)
			global.main_stats.current_spell = "SPELL_FUSANA_01"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
			
			angleT = 90;
			dir = 1;
		}
		
		if count >= 60 {
			if count mod 3 == 0 {
				for(var i = -2 - global.main_stats.difficulty; i <= 2 + global.main_stats.difficulty; i++) {
					shot_CreateShotA1(x + (i * 16),8,1,angle + (i * 2),spr_danmaku_ball_s1,10,15);
				}
				
				angleT += 5 * dir;
				
				if angleT > 135 or angle < 45 {
					dir *= -1;
				}
			}
		}
		
		if count mod 180 == 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,128),60);
		}
	}
	spell_card_fusana_03 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_fusana_portrait,0,_load_file.enemy_spell.SPELL_FUSANA_03,spr_fusana_spell)
			global.main_stats.current_spell = "SPELL_FUSANA_03"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
			
			radius = 150;
			angleT = 0;
		}
		
		if count >= 60 {
			if count mod 60 == 0 {
				for(var i = 0; i < 12 + (global.main_stats.difficulty * 4); i++) {
					var angle = angleT + (i * (360 / (12 + (global.main_stats.difficulty * 4))))
					var shotX = x + (radius * cos(angle))
					var shotY = y + (radius * sin(angle))
					
					var inst = shot_CreateShotA1(shotX,shotY,0.25,angle + 180,spr_danmaku_ball_m1,20,12);
				}
				
				radius -= 5;
				if radius < 40 { radius = 150; }
				
				angleT += 15;
			}
			
			if count >= 80 and count <= 100 {
				if count mod 5 == 0 {
					var angle = point_direction(x,y,obj_player.x,obj_player.y);
					shot_CreateShotA1(x,y,2,angle + irandom_range(-10,10),spr_danmaku_bullet,5,12);
				}
			}
			if count == 180 {
				move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,128),60);
				count = 60;
			}
		}
	}
	spell_card_fusana_05 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_fusana_portrait,0,_load_file.enemy_spell.SPELL_FUSANA_05,spr_fusana_spell)
			global.main_stats.current_spell = "SPELL_FUSANA_05"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
			
			angleT = 0;
		}
		
		if count >= 60 {
			if count mod 120 == 0 {
				for(var i = 0; i < 6 + (global.main_stats.difficulty * 2); i++) {
					var shotAngle = angleT + (i * (360 / (6 + (global.main_stats.difficulty * 2))))
					var inst = shot_CreateShotA1(x,y,1,shot_angle,spr_danmaku_ball_l,20,2)
					with(inst) {
						if count <= 50 {
							if count mod 5 == 0 {
								shot_CreateShotA1(x,y,random_range(0.5,1.5),direction + irandom_range(-5,5),spr_danmaku_star_s,10,2)
							}
						}
					}
				}
				angleT += 15;
			}
			
			if count mod 200 == 0 {
				for(var i = 0; i < 8; i++) {
					var inst = shot_CreateShotA1(0,16 + (i * 32),0.25,0,spr_danmaku_ball_l,30,1);
					with(inst) {
						if count == 100 {
							prop_ObjShot_FadeDelete(self,-0.02);
						}
					}
					inst = shot_CreateShotA1(255,16 + (i * 32),0.25,0,spr_danmaku_ball_l,30,1);
					with(inst) {
						if count == 100 {
							prop_ObjShot_FadeDelete(self,-0.02);
						}
					}
				}
			}
		}
	}
	spell_card_fusana_07 = function() {
		if count == 0 { 
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_fusana_portrait,0,_load_file.enemy_spell.SPELL_FUSANA_07,spr_fusana_spell)
			global.main_stats.current_spell = "SPELL_FUSANA_07"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 96;
			
			time_of_day = "DAY";
			count2 = 0;
		}
		if count >= 60 {
			if time_of_day == "DAY" {
				if count mod 30 == 0 {
					for(var i = 0; i < 10 + (global.main_stats.difficulty * 2); i++) {
						shot_CreateShotA1(x,y,1,i * (360 / (10 + (global.main_stats.difficulty * 2))),spr_danmaku_ball_s1,10,15);
					}
				}
				if count2 == 300 {
					sprite_index = spr_fusana_night;
					time_of_day = "NIGHT"
					count2 = 0;
				}
			}
			else {
				if count mod (6 - global.main_stats.difficulty) == 0 {
					shot_CreateShotA1(x,y,2.5,irandom_range(0,360),spr_danmaku_bullet,5,12);
				}
				if count2 == 300 {
					sprite_index = spr_fusana_day;
					time_of_day = "DAY"
					count2 = 0;
				}
			}
		}
	}
}