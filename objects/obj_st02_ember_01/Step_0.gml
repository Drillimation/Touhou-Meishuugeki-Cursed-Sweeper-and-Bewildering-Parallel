// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		direction = 270;
		speed = 1.5;
	}
	
	if count < 60 {
		if count mod 6 == 0 {
			sound_ObjSound_Play(se_tan02);
			var ee = floor(global.main_stats.difficulty / 2) * 30;
			var angleT = point_direction(x,y,obj_player.x,obj_player.y) - ee;
			repeat(1 + (ee * 2)) {
				shot_CreateShotA1(x,y,1.5,angleT,spr_danmaku_ball_s2,5,10);
				angleT += 30;
			}
		}
	}
	
	if count == 60 {
		if x_pos > 128 {
			dir = irandom_range(285,345);
		}
		else {
			dir = irandom_range(105,165);
		}
	}
	if count > 60 {
		if direction < dir {
			direction++;
		}
		if direction > dir {
			direction--;
		}
	}
	
	count++;
	count2++;
}
