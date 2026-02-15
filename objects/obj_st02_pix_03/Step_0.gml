// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		direction = 270;
		speed = 1;
	}
	if count < 50 {
		speed -= 0.01;
	}
	
	if count > 50 and count < 150 {
		if count mod 10 == 0 {
			sound_ObjSound_Play(se_tan02)
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			var dan_count = 15;
			repeat(global.main_stats.difficulty + 1) {
				var inst = shot_CreateShotA1(x,y,1.2,angleT + dan_count,spr_danmaku_seed_s,5,12);
				with(inst) {
					set_function = function() {
						if count < 120 {
							speed -= 0.01;
						}
						if count == 120 {
							sound_ObjSound_Play(se_kira00);
							image_index = 2;
							speed = 0.6;
							direction -= 90;
						}
					}
				}
				inst = shot_CreateShotA1(x,y,1.2,angleT - dan_count,spr_danmaku_seed_s,5,12);
				with(inst) {
					set_function = function() {
						if count < 120 {
							speed -= 0.01;
						}
						if count == 120 {
							sound_ObjSound_Play(se_kira00);
							image_index = 2;
							speed = 0.6;
							direction += 90;
						}
					}
				}
				dan_count += 10;
			}
		}
	}
	
	if count == 150 {
		direction = 270;
		speed = 1;
	}
	
	count++;
	count2++;
}