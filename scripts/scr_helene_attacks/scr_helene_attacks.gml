function scr_helene_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_HELENE
	
	//Main attacks
	attack_helene_mid = function() {
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
			count = 0;
		}
	}
	attack_helene_main_1 = function() {
		if count == 0 {
			speed = 0;
			x_pos = 128;
			y_pos = 96;
		}
		if count <= 80 {
			if count mod 10 == 0 {
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
		}
		if count mod 5 == 0 {
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
		}
		if count <= 80 {
			if count mod 10 == 0 {
				sound_ObjSound_Play(se_tan02);
				repeat(7 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(x,y,random_range(0.5,1),random_range(180,360),choose(spr_danmaku_seed_s,spr_danmaku_seed_m,spr_danmaku_ball_l),5,2)
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
}