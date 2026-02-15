// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		direction = 270;
		speed = 1;
	}
	
	if count == 30 {
		sound_ObjSound_Play(se_tan02);
		var ee = (global.main_stats.difficulty * 10) + 10;
		var angleT = point_direction(x,y,obj_player.x,obj_player.y) - ee;
		repeat(3 + (global.main_stats.difficulty * 2)) {
			shot_CreateShotA1(x,y,1.25,angleT,spr_danmaku_ball_s1,5,8);
			shot_CreateShotA1(x,y,1,angleT,spr_danmaku_ball_s1,5,8);
			angleT += 12.5;
		}
		angleT = point_direction(x,y,obj_player.x,obj_player.y);
		var speedT = 1.5;
		repeat(2 + (global.main_stats.difficulty * 2)) {
			shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_pellet,5,8);
			speedT -= 0.125;
		}
		if x_pos > 128 {
			dir = 360;
		}
		else {
			dir = 180;
		}
	}
	if count > 30 {
		if direction < dir {
			direction += 2;
		}
		if direction > dir {
			direction -= 2;
		}
	}
	
	count++;
	count2++;
}