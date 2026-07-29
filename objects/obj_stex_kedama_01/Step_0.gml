// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		image_alpha = 0;
		y_pos = 32
		dir = 270
		spd = 0;
	}
	
	if count < 25 {
		image_alpha += 0.04;
	}
	if count > 25 {
		spd = 2;
	}
	if count >= 20 and count < 75 and count mod 10 == 0 {
		sound_ObjSound_Play(se_tan01);
		var angleT = point_direction(x,y,obj_player.x,obj_player.y);
		var speedT = 2.5
		repeat(1 + global.main_stats.difficulty) {
			shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_ball_s1,5,10);
			speedT -= 0.25;
		}
	}
	
	count++;
	count2++;
}