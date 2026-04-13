function scr_saika_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_SAIKA
	
	//Main attacks
	attack_saika_01 = function() {
		if count == 0 { timer = 50; }
		if count mod 60 == 0 {
			var speedT = 1.5;
			sound_ObjSound_Play(se_tan01)
			var e1 = irandom_range(0,360);
			var e2 = irandom_range(0,360);
			repeat(floor(global.main_stats.difficulty / 2) + 1) {
				for(var i = 0; i < 20; i++) {
					shot_CreateShotA1(x,y,speedT,e1 + (i * 2),spr_danmaku_bullet,10,0);
					shot_CreateShotA1(x,y,speedT,e2 - (i * 2),spr_danmaku_bullet,10,0);
				}
				speedT -= 0.75;
			}
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(48,144),60);
		}
		
		if count mod 120 == 60 {
			sound_ObjSound_Play(se_kira00)
			var angleT = point_direction(x,y,obj_player.x,obj_player.y)
			var speedT = 1;
			repeat(global.main_stats.difficulty + 1) {
				for(var i = -2; i <= 2; i++) {
					shot_CreateShotA1(x,y,speedT,angleT + (i * 15),spr_danmaku_ball_s1,20,1);
				}
				speedT -= 0.1;
			}
		}
	}
	attack_saika_02 = function() {
		if count == 0 {
			x_pos = 128;
			y_pos = 96;
			timer = 50;
		}
		if count mod 40 == 0 {
			sound_ObjSound_Play(se_tan02)
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			for(var i = 0; i < 6 + (global.main_stats.difficulty * 2); i++) {
				var inst = shot_CreateShotA1(x,y,0.75,angleT + (i * (360 / (6 + (global.main_stats.difficulty * 2)))),spr_danmaku_ball_l,10,0);
				with(inst) {
					set_function = function() {
						if count == 60 {
							sound_ObjSound_Play(se_kira01)
							for(var j = 0; j < 5; j++) {
								shot_CreateShotA1(x,y,speed * 1.25,(direction - 20) + (j * 10),spr_danmaku_bullet,5,0);
							}
							prop_ObjShot_FadeDelete(self,-0.02);
						}
					}
				}
			}
		}
		if count mod 80 == 0 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(48,96),60);
		}
	}
	attack_saika_03 = function() {
		x_pos = 128 + lengthdir_x(64,count);
		y_pos = 96 + lengthdir_y(32,count);
		timer = 50;
		//move_ObjMove_SetDestAtFrame(self,128 + (60 * sin(count * 2)),64,1);
		
		if count mod 5 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = point_direction(128,96,128 + lengthdir_x(64,count),96 + lengthdir_y(32,count))
			var inst = shot_CreateShotA1(x,y,0.1,angleT,spr_danmaku_amulet,10,1);
			prop_ObjShot_SetSpellResist(inst,true);
			with(inst){
				set_function = function() {
					if count == 60 {
						sound_ObjSound_Play(se_kira01)
						var speedT = 1
						repeat(floor(global.main_stats.difficulty / 2) + 1) {
							shot_CreateShotA1(x,y,speedT,direction + 180,spr_danmaku_seed_m,5,1);
							speedT -= 0.5;
						}
						prop_ObjShot_FadeDelete(self,-0.02);
					}
				}
			}
		}
		
		if count mod 90 == 0 {
			sound_ObjSound_Play(se_kira01)
			var angleT = point_direction(x,y,obj_player.x,obj_player.y)
			var speedT = 2.5
			repeat(2 + global.main_stats.difficulty) {
				for(var i = -1; i <= 1; i++) {
					shot_CreateShotA1(x,y,speedT,angleT + (i * 20),spr_danmaku_seed_s,5,12);
				}
				speedT -= 0.25;
			}
		}
	}
	
	//Spell cards
	spellcard_saika_01 = function() {
		if count == 0 {
			baseAngle = 0;
			timer = 60;
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
			if count mod (8 - (global.main_stats.difficulty)) == 0 {
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
								if count mod 15 == 0 {
									direction += (30 * sin(t * 4))
								}
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
			timer = 60;
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
				var way = 32;
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
			timer = 60;
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
			if count mod (8 - global.main_stats.difficulty) == 0 {
				sound_ObjSound_Play(se_option);
				var inst = shot_CreateShotA1(x,y,0,irandom_range(0,360),spr_danmaku_ball_m1,10,0)
				with(inst) {
					set_function = function() {
						if count == 0 {
							radius = 0;
						}
						if count <= 59 {
							if instance_exists(obj_saika) {
								radius += 0.75;
								direction += 5;
								x_pos = obj_saika.x_pos + lengthdir_x(radius,direction)
								y_pos = obj_saika.y_pos + lengthdir_y(radius,direction)
							}
						}
						if count == 60 {
							var angleT = point_direction(x,y,obj_player.x,obj_player.y);
							direction = angleT;
							speed = 2;
						}
						if count == 61 {
							sound_ObjSound_Play(se_kira00)
							var inst2 = shot_CreateShotA1(x,y,0,irandom_range(0,360),spr_danmaku_ball_s1,20,1)
							move_ObjMove_SetAcceleration(inst2,0.005);
							move_ObjMove_SetMaxSpeed(inst2,0.5);
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
			timer = 60;
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
			if count mod 20 == 0 {
				sound_ObjSound_Play(se_tan02)
				var baseAngle = irandom_range(0,360);
				repeat(20 + (global.main_stats.difficulty * 4)) {
					var angleT = baseAngle + count
					shot_CreateShotA1(x,y,1,angleT,spr_danmaku_amulet,20,12);
					baseAngle += 360 / (20 + (global.main_stats.difficulty * 4));
				}
			}
			
			with(obj_player) {
				if instance_exists(obj_saika) {
					if xaxis == 0 and yaxis == 0 {
						var suction_angle = point_direction(obj_saika.x,obj_saika.y,x,y);
						var suction_length = point_distance(obj_saika.x,obj_saika.y,x,y);
						x_pos = obj_saika.x_pos + lengthdir_x(suction_length - 0.05,suction_angle)
						y_pos = obj_saika.y_pos + lengthdir_y(suction_length - 0.05,suction_angle)
					}
				}
			}
		}
		if timer == 1 {
			hp = 0;
			scr_enemy_remove_life();
		}
	}
}