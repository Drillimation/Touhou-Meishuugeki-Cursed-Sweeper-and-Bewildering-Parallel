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
	
	if count == 50 {
		angleU = 0;
		angleT = point_direction(x,y,obj_player.x,obj_player.y);
	}
	
	if count >= 51 and count <= 60 {
		sound_ObjSound_Play(se_tan02);
		repeat(10 + (global.main_stats.difficulty * 2)) {
			shot_CreateShotA1(x,y,1.5,angleT + angleU,spr_danmaku_bullet,1,1);
			angleT += 360 / (10 + (global.main_stats.difficulty * 2));
		}
		angleU++;
	}
	
	if count == 90 {
		sound_ObjSound_Play(se_kira00);
		angleT = point_direction(x,y,obj_player.x,obj_player.y);
		repeat(10 + (global.main_stats.difficulty * 2)) {
			shot_CreateShotA1(x,y,1.5,angleT,spr_danmaku_ball_m1,0,1);
			angleT += 360 / (10 + (global.main_stats.difficulty * 2));
		}
	}
	
	count++;
	count2++;
}