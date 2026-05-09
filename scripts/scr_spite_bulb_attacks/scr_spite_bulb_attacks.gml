function scr_spite_bulb_attacks(){
	char_name = " ";
	
	//Main attacks
	attack_spite_bulb_01 = function() {
		if count == 0 {
			angleT = 0;
		}
		if count mod 30 == 0 {
			sound_ObjSound_Play(se_kira00);
			var speedT = 2;
			repeat(4 + (global.main_stats.difficulty * 2)) {
				for(var i = 0; i < 12; i++) {
					shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_ball_s2,10,0)
					angleT += 360 / 12;
				}
				speedT -= 0.1;
			}
			angleT += 13;
		}
		if count mod 60 == 0 {
			sound_ObjSound_Play(se_tan02);
			var playerAngle = point_direction(x,y,obj_player.x,obj_player.y)
			repeat(2 + global.main_stats.difficulty) {
				shot_CreateShotA1(x,y,2.5,playerAngle + irandom_range(-10,10),spr_danmaku_bullet,5,0)
			}
		}
		if count == 60 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,128),60);
		}
		if count == 115 {
			count = 55;
		}
	}
	attack_spite_bulb_02 = function() {
		if count == 0 {
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_SPITE_BULB_01,spr_fusana_spell)
			global.main_stats.current_spell = "SPELL_SPITE_BULB_01"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
			
			countT = 0;
		}
		
		if count >= 60 {
			if count mod 20 == 0 {
				sound_ObjSound_Play(se_tan01)
				for(var i = 0; i < 10 + (global.main_stats.difficulty * 2); i++) {
					var angleT = (i * (360 / (10 + (global.main_stats.difficulty * 2)))) + countT;
					var inst = shot_CreateShotA2(x,y,1.5,angleT,-0.01,0,spr_danmaku_arrowhead,20,2);
					with(inst) {
						set_function = function() {
							if count == 60 {
								sound_ObjSound_Play(se_kira01);
								prop_ObjShot_SetGraphic(self,spr_danmaku_arrowhead,15);
								if instance_exists(obj_player) {
									direction = point_direction(x,y,obj_player.x,obj_player.y) + irandom_range(-90,90);
								}
								//move_ObjMove_SetSpeed(self,0.75)
								move_ObjMove_SetAcceleration(self,0);
								move_ObjMove_SetSpeed(self,0.5);
							}
						}
					}
				}
				
				countT += 17;
			}
			
			if count mod 180 == 0 {
				move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(32,128),2);
			}
		}
	}
	attack_spite_bulb_03 = function() {
		if count == 0 {
			angleT = 0;
		}
		if count >= 60 and count <= 79 {
			if count == 60 {
				repeat(10 + (global.main_stats.difficulty * 2)) {
					var speedT = 2;
					for(var i = 0; i < 18; i++) {
						shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_ball_s1,10,0)
						angleT += 360 / 18;
						speedT -= 0.1;
					}
				}
				angleT += 13;
			}
			if count mod 5 == 0 {
				sound_ObjSound_Play(se_kira00);
				var playerAngle = point_direction(x,y,obj_player.x,obj_player.y);
				repeat(3 + (global.main_stats.difficulty * 2)) {
					shot_CreateShotA1(x,y,2.5,playerAngle + irandom_range(-60,60),spr_danmaku_bullet,5,0);
				}
			}
		}
		if count == 80 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),40);
		}
		if count == 115 {
			count = 55;
		}
	}
	attack_spite_bulb_04 = function() {
		if count == 0 {
			timer = 60;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_font,0,_load_file.enemy_spell.SPELL_SPITE_BULB_02,spr_grieg_spell)
			global.main_stats.current_spell = "SPELL_SPITE_BULB_02"
			speed = 0;
			move_mode = false;
			x_pos = 128;
			y_pos = 64;
			
			countT = 0;
		}
		if count mod 40 == 0 {
			for(var i = 0; i < 12 + (global.main_stats.difficulty * 4); i++) {
				sound_ObjSound_Play(se_tan01);
				var angleT = i * (12 + (global.main_stats.difficulty * 4)) + count;
				var inst = shot_CreateShotA2(x,y,1.5,angleT,-0.01,0,spr_danmaku_shard,20,2);
				with(inst) {
					set_function = function() {
						if count == 120 {
							sound_ObjSound_Play(se_kira01);
							prop_ObjShot_SetGraphic(self,spr_danmaku_shard,15);
							var angleT = point_direction(x,y,obj_player.x,obj_player.y);
							move_ObjMove_SetAngle(self,angleT);
							move_ObjMove_SetAcceleration(self,0.05);
							move_ObjMove_SetMaxSpeed(self,3);
						}
					}
				}
				count += 360 / (12 + (global.main_stats.difficulty * 4))
			}
			count += 17;
		}
	}
}