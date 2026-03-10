// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		if x_pos > 128 {
			direction = random_range(135,225);
		}
		if x_pos < 128 {
			direction = random_range(315,405);
		}
		speed = 2;
	}
	
	if count >= 45 and count mod 10 == 0 {
		var speedT = 1.5;
		var angleT = point_direction(x,y,obj_player.x,obj_player.y);
		sound_ObjSound_Play(se_tan02);
		repeat(1 + global.main_stats.difficulty) {
			var inst = shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_ball_s1,5,5)
			with(inst) {
				set_function = function() {
					if count mod 15 == 0 {
						image_index -= 1;
						image_index = clamp(image_index,0,5);
						
						if count > 75 {
							speed += 0.1;
						}
					}
				}
			}
			speedT -= 0.25;
		}
	}
	
	count++;
	count2++;
}