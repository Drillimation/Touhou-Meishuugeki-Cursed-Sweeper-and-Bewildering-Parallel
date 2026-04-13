// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		direction = 270;
		speed = 2;
	}
	
	if count < 50 {
		speed -= 0.04;
		speed = clamp(speed,0,2);
	}
	if count == 50 {
		sound_ObjSound_Play(se_tan02);
		var speedT = 1.5
		var angleT = point_direction(x,y,obj_player.x,obj_player.y);
		repeat(global.main_stats.difficulty + 1) {
			for(var i = -2; i <= 2; i++) {
				shot_CreateShotA1(x,y,speedT,angleT + (i * 20),spr_danmaku_ball_m2,5,0);
			}
			speedT -= 0.125;
		}
	}
	if count > 50 {
		speed += 0.04;
		speed = clamp(speed,0,2);
	}
	
	count++;
	count2++;
}