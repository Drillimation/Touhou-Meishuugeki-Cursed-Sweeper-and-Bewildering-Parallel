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
}