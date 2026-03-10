// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		speed = 1;
		direction = 270;
		if x_pos > 128 {
			rt_sp = 7.5;
		}
		if x_pos < 128 {
			rt_sp = -7.5;
		}
	}
	if count < 60 {
		speed -= 0.0167;
	}
	if count == 60 {
		if x_pos > 128 {
			speed = 0.1;
			direction = 105;
		}
		if x_pos < 128 {
			speed = 0.1;
			direction = 345;
		}
		angleT = 0;
		angleU = 0;
	}
	if count > 60 {
		if count mod 10 == 0 {
			var angleX = 0;
			angleX -= global.main_stats.difficulty * 10
			sound_ObjSound_Play(se_tan02);
			repeat((global.main_stats.difficulty * 2) + 1) {
				shot_CreateShotA1(x,y,1,angleT + angleX,spr_danmaku_bullet,5,5);
				shot_CreateShotA1(x,y,1,180 - (angleU + angleX),spr_danmaku_arrowhead,5,10);
				angleX += 10;
			}
			angleT += 15;
			angleU -= 15;
		}
	}
	
	count++;
	count2++;
}