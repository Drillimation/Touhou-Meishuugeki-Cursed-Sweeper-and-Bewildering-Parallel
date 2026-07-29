// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		image_alpha = 0;
		x_pos = 128;
		y_pos = 96;
		//dir = 270
		spd = 0;
		angleX = 0;
	}
	
	if count < 50 {
		image_alpha += 0.02;
	}
	if count > 50 {
		if count mod 5 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = 0;
			repeat(6 + (global.main_stats.difficulty * 2)) {
				shot_CreateShotA1(x,y,1.75,angleT + angleX,spr_danmaku_shard,5,0);
				shot_CreateShotA1(x,y,1.75,angleT - angleX,spr_danmaku_shard,5,0);
				angleT += 360 / (6 + (global.main_stats.difficulty * 2))
			}
			angleX += 5;
		}
	}
	
	count++;
	count2++;
}