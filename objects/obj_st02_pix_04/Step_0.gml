// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		direction = 270;
		speed = 1;
		ctan = 0;
	}
	if count < 50 {
		speed -= 0.01;
	}
	
	if count > 50 and count < 150 {
		if count mod 2 == 0 {
			sound_ObjSound_Play(se_tan02)
			var speedT = 1.5
			repeat(global.main_stats.difficulty + 1) {
				shot_CreateShotA1(x,y,speedT,270 + ctan,spr_danmaku_amulet,5,12)
				shot_CreateShotA1(x,y,speedT,270 - ctan,spr_danmaku_amulet,5,12)
				speedT -= 0.125;
			}
			ctan += 12.5;
		}
	}
	
	if count == 150 {
		direction = 270;
		speed = 1;
	}
	
	count++;
	count2++;
}