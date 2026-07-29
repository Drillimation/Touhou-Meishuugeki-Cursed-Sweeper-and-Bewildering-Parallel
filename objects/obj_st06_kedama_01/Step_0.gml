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
	
	if count < 50 {
		image_alpha += 0.02;
	}
	if count > 50 {
		spd = 2;
	}
	if count == 50 {
		sound_ObjSound_Play(se_tan01);
		var angleT = point_direction(x,y,obj_player.x,obj_player.y);
		repeat(15 + (global.main_stats.difficulty * 5)) {
			shot_CreateShotA1(x,y,2.5,angleT,spr_danmaku_ball_s1,5,10);
			angleT += 360 / (15 + (global.main_stats.difficulty * 5))
		}
	}
	
	count++;
	count2++;
}