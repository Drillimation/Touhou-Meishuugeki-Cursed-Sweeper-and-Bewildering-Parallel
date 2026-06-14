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
		direction = 270
		speed = 0;
	}
	
	if count < 50 {
		image_alpha += 0.02;
	}
	if count >= 50 and count < 200 {
		if count mod 10 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			for(var i = -1 - global.main_stats.difficulty; i < 2 + global.main_stats.difficulty; i++) {
				shot_CreateShotA1(x,y,1,angleT + (i * 15),spr_danmaku_seed_s,5,0);
			}
		}
		if count mod 40 == 0 {
			sound_ObjSound_Play(se_kira00);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			shot_CreateShotA1(x,y,2,angleT,spr_danmaku_ball_l,5,10);
		}
	}
	if count == 200 {
		speed = 1;
	}
	
	count++;
	count2++;
}