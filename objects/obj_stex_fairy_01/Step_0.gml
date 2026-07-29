// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		dir = 270;
		spd = 1;
	}
	if count < 100 {
		if count mod 40 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			var speedT = 2;
			repeat(1 + global.main_stats.difficulty) {
				for(var i = -2; i < 3; i++) {
					shot_CreateShotA1(x,y,speedT,angleT + (i * 10),spr_danmaku_ball_s1,5,5);
				}
				speedT -= 0.2;
			}
		}
	}
	
	count++;
	count2++;
}