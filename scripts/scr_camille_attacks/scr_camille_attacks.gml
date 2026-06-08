function scr_camille_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_CAMILLE
	
	//Main attacks
	attack_camille_01 = function() {
		if count < 30 {
			if count mod 10 == 0 {
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
			for(var i = 0; i < 6; i++) {
				shot_CreateShotA1(8 + (40 * i),8,1.75,270,spr_danmaku_ball_m1,5,0);
			}
		}
		if count mod 12 == 0 {
			for(var i = -1 - global.main_stats.difficulty; i < 2 + global.main_stats.difficulty; i++) {
				var angleT = point_direction(x,y,obj_player.x,obj_player.y);
				shot_CreateShotA1(x,y,1,angleT,spr_danmaku_pellet,5,0);
			}
		}
	}
	attack_camille_03 = function() {
		if count mod 80 == 0 {
			repeat(4 + global.main_stats.difficulty) {
				shot_CreateShotA1(0,80,0.6,0 + irandom_range(-15,15),spr_danmaku_star_s,10,0)
				shot_CreateShotA1(0,208,0.6,0 + irandom_range(-15,15),spr_danmaku_star_s,10,0)
				shot_CreateShotA1(255,80,0.6,180 + irandom_range(-15,15),spr_danmaku_star_s,10,0)
				shot_CreateShotA1(255,208,0.6,180 + irandom_range(-15,15),spr_danmaku_star_s,10,0)
			}
		}
		if count mod 16 == 0 {
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
			var speedT = 2.5
			var angleT = point_direction(x,y,obj_player.x,obj_player.y)
			repeat(2 * (global.main_stats.difficulty * 2)) {
				shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_amulet,5,0);
			}
		}
		if count mod 45 == 0 {
			repeat(8 + (global.main_stats.difficulty * 2)) {
				shot_CreateShotA1(0,random_range(16,272),0.75,0,spr_danmaku_dagger,10,10);
				shot_CreateShotA1(255,random_range(16,272),0.75,180,spr_danmaku_dagger,10,10);
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
			repeat(20 + (global.main_stats.difficulty * 4)) {
				var angleT = dir;
				shot_CreateShotA1(x,y,1,angleT,spr_danmaku_dagger,10,0);
				angleT += 360 / (20 + (global.main_stats.difficulty * 4));
			}
		}
		if count > 0 and count mod 60 == 0 {
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
			for(var i = 0; i < 6; i++) {
				shot_CreateLooseLaserA1(8 + (40 * i),0,0,270,28.8,1,spr_danmaku_laser,30,0);
			}
		}
		if count > 60 {
			if count mod 16 - global.main_stats.difficulty == 0 {
				for(var i = 0; i < 6; i++) {
					shot_CreateShotA1((8 + (40 * i)) + irandom_range(-10,10),144,1.6,270,spr_danmaku_ball_s1,5,0);
				}
			}
			
			if count mod 75 == 0 {
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
}