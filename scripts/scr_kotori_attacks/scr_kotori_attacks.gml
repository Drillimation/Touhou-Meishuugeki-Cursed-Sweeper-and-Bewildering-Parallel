function scr_kotori_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_KOTORI
	
	//Main attacks
	attack_kotori_mid = function() {
		if count == 0 { timer = 30;  x_pos = 128; y_pos = 56; speed = 0; move_mode = false; }
		if count <= 140 {
			if count mod 45 == 0 {
				sound_ObjSound_Play(se_tan02);
				var angleT = point_direction(x,y,obj_player.x,obj_player.y)
				repeat(16 + (global.main_stats.difficulty * 2)) {
					var inst = shot_CreateShotA1(x,y,1.25,angleT,spr_danmaku_amulet,5,2);
					with(inst) {
						image_xscale = 2;
						image_yscale = 2;
						set_function = function() {
							direction += random_range(-5,5);
						}
					}
					angleT += 360 / (16 + (global.main_stats.difficulty * 2))
				}
			}
		}
		if count == 140 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
		if count >= 141 and count <= 200 {
			if count mod 20 == 0 {
				sound_ObjSound_Play(se_tan02);
				var angleT = point_direction(x,y,obj_player.x,obj_player.y)
				repeat(20 + (global.main_stats.difficulty * 4)) {
					var inst = shot_CreateShotA1(x,y,0.75,irandom_range(0,360),spr_danmaku_pellet,5,15);
					with(inst) {
						set_function = function() {
							if count == 10 { direction += 90 }
							if count == 20 { 
								direction -= 90; 
								count = 0; 
							}
						}
					}
					angleT += 360 / (20 + (global.main_stats.difficulty * 4))
				}
			}
		}
		if count == 200 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
		}
		if count == 260 {
			count = 1;
		}
		if point_distance(x_pos,y_pos,x_tar,y_tar) > 4 {
			direction = point_direction(x_pos,y_pos,x_tar,y_tar)
		}
		else {
			speed = 0;
			move_mode = false;
		}
	}
	attack_kotori_main_1 = function() {
		if count == 0 { timer = 30;  x_pos = 128; y_pos = 56; speed = 0; move_mode = false; }
		if count > 1 and count < 121 {
			if count mod 30 == 0 {
				move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
				sound_ObjSound_Play(se_tan01);
				var angleT = player_GetAngleToPlayer(self);
				var speedT = 1.5
				repeat ((global.main_stats.difficulty * 2) + 2) {
					var inst = shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_kunai,5,8)
					with(inst) {
						set_function = function() {
							if count == 60 {
								instance_destroy();
								repeat(4) {
									sound_ObjSound_Play(se_kira00);
									shot_CreateShotA1(x,y,0.75,irandom_range(0,360),choose(spr_danmaku_ball_s1,spr_danmaku_pellet),5,15)
								}
							}
						}
					}
					speedT -= 0.1;
				}
			}
		}
		if count == 240 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
			sound_ObjSound_Play(se_tan01);
			var angleT = player_GetAngleToPlayer(self);
			for(var i = 0; i < 4; i++) {
				var ex = x + irandom_range(-32,32)
				var ey = y + irandom_range(-16,16)
				repeat (global.main_stats.difficulty + 1) {
					var speedT = 1.5
					var inst = shot_CreateShotA1(ex,ey,speedT,angleT,spr_danmaku_kunai,5,8)
					with(inst) {
						set_function = function() {
							if count == 60 {
								instance_destroy();
								repeat(4) {
									sound_ObjSound_Play(se_kira00);
									shot_CreateShotA1(x,y,0.75,irandom_range(0,360),choose(spr_danmaku_ball_s1,spr_danmaku_pellet),5,15)
								}
							}
						}
					}
					speedT -= 0.125;
				}
			}
		}
		if count == 360 {
			count = 1;
		}
		if point_distance(x_pos,y_pos,x_tar,y_tar) > 4 {
			direction = point_direction(x_pos,y_pos,x_tar,y_tar)
		}
		else {
			speed = 0;
			move_mode = false;
		}
	}
	attack_kotori_main_2 = function() {
		if count == 0 { timer = 30; x_pos = 128; y_pos = 56; speed = 0; move_mode = false; }
		if count > 1 and count < 181 {
			if count mod 30 == 0 {
				move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
				sound_ObjSound_Play(se_tan01);
				var angleT = player_GetAngleToPlayer(self);
				var speedT = 1.5
				repeat ((global.main_stats.difficulty * 2) + 2) {
					var inst = shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_kunai,5,8)
					with(inst) {
						set_function = function() {
							if count == 60 {
								instance_destroy();
								repeat(4) {
									sound_ObjSound_Play(se_kira00);
									shot_CreateShotA1(x,y,0.75,irandom_range(0,360),choose(spr_danmaku_ball_s1,spr_danmaku_pellet),5,15)
								}
							}
						}
					}
					speedT -= 0.1;
				}
			}
		}
		if count == 300 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
			sound_ObjSound_Play(se_tan01);
			var angleT = player_GetAngleToPlayer(self) - 60;
			for (var i = 0; i < 7; i++) {
				var speedT = 1.5
				repeat (global.main_stats.difficulty + 1) {
					var inst = shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_kunai,5,8)
					with(inst) {
						set_function = function() {
							if count == 60 {
								instance_destroy();
								repeat(4) {
									sound_ObjSound_Play(se_kira00);
									shot_CreateShotA1(x,y,0.75,irandom_range(0,360),choose(spr_danmaku_ball_s1,spr_danmaku_pellet),5,15)
								}
							}
							count++;
						}
					}
					speedT -= 0.125;
				}
				angleT += 20;
			}
			angleT = player_GetAngleToPlayer(self)
			shot_CreateStraightLaserA1(x,y,angleT,36,1,60,spr_danmaku_laser,120,8);
		}
		if count == 420 {
			count = 1;
		}
		if point_distance(x_pos,y_pos,x_tar,y_tar) > 4 {
			direction = point_direction(x_pos,y_pos,x_tar,y_tar)
		}
		else {
			speed = 0;
			move_mode = false;
		}
	}

	//Spell cards
	spell_card_kotori_01 = function() {
		if count == 0 { 
			timer = 30;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_kotori_portrait,0,_load_file.enemy_spell.SPELL_KOTORI_01,spr_kotori_spell)
			global.main_stats.current_spell = "SPELL_KOTORI_01";
			speed = 0;
			move_mode = false;
		}
		if count == 60 {
			ex = obj_player.x_pos
			ey = obj_player.y_pos
			move_ObjMove_SetDestAtSpeed(self,ex,ey,4);
			reached_destination = false;
		}
		if count >= 61 {
			if reached_destination == false {
				if point_distance(x_pos,y_pos,ex,ey) <= 32 {
					move_ObjMove_SetDestAtSpeed(self,x_pos,64,1);
					reached_destination = true;
				}
				else {
					if count mod 2 == 0 {
						repeat(2 + global.main_stats.difficulty) {
							sound_ObjSound_Play(se_tan01);
							var inst = shot_CreateShotA1(x,y,0.5,choose(random_range(135,225),random_range(315,405)),spr_danmaku_amulet,5,15);
							inst.gravity = 0.005;
						}
					}
				}
			}
			else {
				if point_distance(x_pos,y_pos,x_pos,64) >= 4 {
					if count mod 45 == 0 {
						var angleT = 90
						var speedT = 1
						sound_ObjSound_Play(se_kira00);
						repeat(8) {
							for(var i = 0; i < global.main_stats.difficulty + 1; i++) {
								shot_CreateShotA1(x,y,speedT - (0.1 * i),270 + angleT,spr_danmaku_arrowhead,5,8)
								shot_CreateShotA1(x,y,speedT - (0.1 * i),270 - angleT,spr_danmaku_arrowhead,5,8)
							}
							speedT -= 0.05;
							angleT -= 11;
						}
					}
				}
				else {
					reached_destination = false;
					count = 55;
				}
			}
		}
	}
	spell_card_kotori_02 = function() {
		if count == 0 { 
			timer = 30;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_kotori_portrait,0,_load_file.enemy_spell.SPELL_KOTORI_02,spr_kotori_spell)
			global.main_stats.current_spell = "SPELL_KOTORI_02";
			x_pos = 128;
			y_pos = 128;
			speed = 0;
			move_mode = false;
		}
		if count >= 60 {
			if count mod 15 == 0 {
				sound_ObjSound_Play(se_tan01);
				repeat((global.main_stats.difficulty * 2) + 6) {
					var angleT = point_direction(x,y,obj_player.x,obj_player.y);
					var inst = shot_CreateShotA1(x + irandom_range(-32,32),y + irandom_range(-32,32),0.75,(angleT - 180) + random_range(-45,45),spr_danmaku_arrowhead,5,8);
					with(inst) {
						set_function = function() {
							if count == 0 { choose_to_move = choose(90,105,120); }
							if count == choose_to_move {
								sound_ObjSound_Play(se_kira00);
								direction += 180;
								speed += 0.25;
							}
						}
					}
				}
			}
		}
	}
	spell_card_kotori_03 = function() {
		if count == 0 { 
			timer = 30;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_kotori_portrait,0,_load_file.enemy_spell.SPELL_KOTORI_03,spr_kotori_spell)
			global.main_stats.current_spell = "SPELL_KOTORI_03";
			x_pos = 128;
			y_pos = 48;
			speed = 0;
			move_mode = false;
		}
		if count >= 60 {
			if count mod (19 - (global.main_stats.difficulty * 3)) == 0 {
				sound_ObjSound_Play(se_tan01);
				var ex = 16;
				repeat(7) {
					for(var i = 0; i < global.main_stats.difficulty + 1; i++) {
						var inst = shot_CreateShotA1(ex,96,0.25,random_range(75,105),spr_danmaku_amulet,5,15);
						inst.gravity = 0.005;
						ex += 32;
					}
				}
			}
		}
	}
	spell_card_kotori_04 = function() {
		if count == 0 {
			timer = 30;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_kotori_portrait,0,_load_file.enemy_spell.SPELL_KOTORI_04,spr_kotori_spell)
			global.main_stats.current_spell = "SPELL_KOTORI_04";
			speed = 0;
			move_mode = false;
		}
		
		if count == 60 {
			if x_pos > 128 { ex = 16 }
			else { ex = 240 }
			ey = irandom_range(32,144)
			move_ObjMove_SetDestAtSpeed(self,ex,ey,4);
		}
		if count >= 61 {
			if point_distance(x_pos,y_pos,ex,ey) > 4 {
				if count mod 10 == 0 {
					var angleT = irandom_range(0,360);
					sound_ObjSound_Play(se_tan01);
					repeat(4 + (global.main_stats.difficulty * 2)) {
						shot_CreateShotA1(x,y,1.25,angleT,spr_danmaku_amulet,5,15);
						angleT += 10;
						var inst = shot_CreateShotA1(x,y,0.75,irandom_range(0,360),spr_danmaku_pellet,5,15);
						with(inst) {
							set_function = function() {
								if count == 10 { direction += 90 }
								if count == 20 { 
									direction -= 90; 
									count = 0; 
								}
							}
						}
					}
				}
			}
			else {
				move_mode = false;
				speed = 0;
				count = 50;
			}
		}
	}
	spell_card_kotori_05 = function() {
		if count == 0 { 
			timer = 30;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_kotori_portrait,0,_load_file.enemy_spell.SPELL_KOTORI_05,spr_kotori_spell)
			global.main_stats.current_spell = "SPELL_KOTORI_05";
			x_pos = 128;
			y_pos = 96;
			speed = 0;
			move_mode = false;
		}
		
		if count >= 60 {
			if count mod 6 == 0 {
				sound_ObjSound_Play(se_tan01);
				repeat(3 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(x,y,random_range(0.75,1.5),irandom_range(0,360),spr_danmaku_amulet,5,15);
					with(inst) {
						set_function = function() {
							direction += random_range(-5,5);
						}
					}
				}
			}
			if count mod 12 == 0 {
				sound_ObjSound_Play(se_tan01);
				repeat(3 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(x,y,0.75,irandom_range(0,360),spr_danmaku_pellet,5,15);
					with(inst) {
						set_function = function() {
							if count == 10 { direction += 90 }
							if count == 20 { 
								direction -= 90; 
								count = 0; 
							}
						}
					}
				}
			}
			if count mod 180 == 0 {
				sound_ObjSound_Play(se_kira00);
				var angleT = point_direction(x,y,obj_player.x,obj_player.y)
				repeat(8 + (global.main_stats.difficulty * 2)) {
					var inst = shot_CreateShotA1(x,y,1.25,angleT,spr_danmaku_amulet,5,2);
					with(inst) {
						image_xscale = 2;
						image_yscale = 2;
						set_function = function() {
							direction += random_range(-5,5);
						}
					}
					angleT += 360 / (8 + (global.main_stats.difficulty * 2))
				}
			}
		}
	}
}