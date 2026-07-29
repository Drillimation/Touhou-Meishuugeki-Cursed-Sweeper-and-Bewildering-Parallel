// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		image_alpha = 0;
		//x_pos = 128;
		y_pos = 96;
		//dir = 270
		spd = 0;
		angleX = 0;
	}
	
	if count < 50 {
		image_alpha += 0.02;
	}
	if count > 50 {
		if count mod 8 - global.main_stats.difficulty == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = 0;
			shot_CreateShotA1(x,y,1.75,0 + angleX,spr_danmaku_seed_s,5,0);
			shot_CreateShotA1(x,y,1.75,0 - angleX,spr_danmaku_seed_s,5,0);
			shot_CreateShotA1(x,y,1.75,120 + angleX,spr_danmaku_seed_s,5,10);
			shot_CreateShotA1(x,y,1.75,120 - angleX,spr_danmaku_seed_s,5,10);
			shot_CreateShotA1(x,y,1.75,240 + angleX,spr_danmaku_seed_s,5,12);
			shot_CreateShotA1(x,y,1.75,240 - angleX,spr_danmaku_seed_s,5,12);
			angleX += 5;
		}
		
		if count mod 30 == 0 {
			var speedT = 2;
			repeat(global.main_stats.difficulty + 1) {
				for(var i = 0; i < 4; i++) {
					shot_CreateShotA1(x,y,speedT,angleX + (i * 90),spr_danmaku_amulet,5,0);
				}
				speedT -= 0.2;
			}
		}
	}
	
	count++;
	count2++;
}