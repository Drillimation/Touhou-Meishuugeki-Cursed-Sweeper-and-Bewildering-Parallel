function scr_saika_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_SAIKA
	
	//Main attacks
	attack_saika_01 = function() {
	
	}
	attack_saika_02 = function() {
	
	}
	attack_saika_03 = function() {
	
	}
	
	//Spell cards
	spellcard_saika_01 = function() {
		if count == 0 {
			baseAngle = 0;
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_saika_portrait,0,_load_file.enemy_spell.SPELL_SAIKA_01,spr_tatsumaru_spell)
			global.main_stats.current_spell = "SPELL_SAIKA_01"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 144;
		}
		if count >= 60 {
			if count mod (10 - (global.main_stats.difficulty)) == 0 {
				sound_ObjSound_Play(se_tan01);
				shot_CreateShotA1(irandom_range(8,248),8,random_range(0.75,1.5),270,spr_danmaku_ball_s1,20,choose(0,1))
			}
			
			if count mod 15 == 0 {
				sound_ObjSound_Play(se_kira00);
				var angleT = 0;
				repeat(4 + global.main_stats.difficulty) {
					for(var i = 0; i < (4 + global.main_stats.difficulty); i++) {
						angleT = baseAngle + (i * (360 / (4 + global.main_stats.difficulty)))
						var inst = shot_CreateShotA1(x,y,1,angleT,spr_danmaku_arrowhead,20,choose(0,1))
						with(inst) {
							set_function = function() {
								if count == 0 {
									t = 0;
								}
								move_ObjMove_SetAngle(self,direction + (30 * sin(t * 4)))
								t++;
							}
						}
					}
				
				}
				baseAngle += 12;
			}
		}
	}
	spellcard_saika_02 = function() {
		if count == 0 {
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_saika_portrait,0,_load_file.enemy_spell.SPELL_SAIKA_02,spr_tatsumaru_spell)
			global.main_stats.current_spell = "SPELL_SAIKA_02"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
		}
		
		if count >= 60 {
			if count mod (40 - (global.main_stats.difficulty * 5)) == 0 {
				sound_ObjSound_Play(se_tan01);
				var way = 8;
				var baseAngle = point_direction(x,y,obj_player.x,obj_player.y);
				for(var i = 0; i < way; i++) {
					var angleT = baseAngle + (i * (360 / way));
					var inst = shot_CreateShotA1(x,y,1,angleT,spr_danmaku_dagger,10,0);
					with(inst) {
						set_function = function() {
							if count == 60 {
								sound_ObjSound_Play(se_kira00);
								repeat(3) {
									shot_CreateShotA1(x,y,2,direction + irandom_range(-20,20),spr_danmaku_pellet,5,0);
								}
								instance_destroy();
							}
						}
					}
				}
			}
		}
	}
	spellcard_saika_03 = function() {
		if count == 0 {
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_saika_portrait,0,_load_file.enemy_spell.SPELL_SAIKA_03,spr_tatsumaru_spell)
			global.main_stats.current_spell = "SPELL_SAIKA_03"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
			
			radius = 0;
			angle = 0;
		}
		
		if count > 60 {
			if count mod 120 == 0 {
				var inst = shot_CreateShotA1(x,y,0,0,spr_danmaku_ball_m1,10,0)
				with(inst) {
					set_function = function() {
						if count == 0 {
							radius = 0;
						}
						if count <= 59 {
							if instance_exists(other) {
								radius += 1.5;
								direction += 5;
								x = other.x + lengthdir_x(radius,5)
								y = other.y + lengthdir_y(radius,5)
							}
						}
						if count == 60 {
							var angleT = point_direction(x,y,obj_player.x,obj_player.y);
							direction = angleT;
							speed = 3;
						}
						if count >= 61 {
							var inst2 = shot_CreateShotA1(x,y,0,irandom_range(0,360),spr_danmaku_ball_s1,20,1)
							move_ObjMove_SetAcceleration(inst,0.01);
							move_ObjMove_SetMaxSpeed(inst,0.5);
							with(inst2) {
								if count = 240 { instance_destroy(); }
							}
						}
					}
				}
			}
		}
	}
	spellcard_saika_04 = function() {
		if count == 0 {
			timer = 50;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_saika_portrait,0,_load_file.enemy_spell.SPELL_SAIKA_04,spr_tatsumaru_spell)
			global.main_stats.current_spell = "SPELL_SAIKA_04"
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
		
		if count > 60 {
			if count mod 40 == 0 {
				var baseAngle = irandom_range(0,360);
				repeat(20) {
					var angleT = baseAngle + count
					shot_CreateShotA1(x,y,1,angleT,spr_danmaku_amulet,20,12);
					baseAngle += 360 / 20;
				}
			}
			
			with(obj_player) {
				if xaxis != 0 or yaxis != 0 {
					var suction_angle = point_direction(x,y,other.x,other.y);
					var suction_length = point_distance(x,y,other.x,other.y);
					x = other.x + lengthdir_x(suction_length - 0.005,suction_angle)
					y = other.y + lengthdir_y(suction_length - 0.005,suction_angle)
				}
			}
		}
		if timer == 1 {
			hp = 0;
			scr_enemy_remove_life();
		}
	}
}