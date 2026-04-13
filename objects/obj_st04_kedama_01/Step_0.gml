// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		image_alpha = 0;
		//x_pos = irandom_range(16,240);
		y_pos = irandom_range(32,96);
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		speed = 0;
	}
	
	if count < 50 {
		image_alpha += 0.02;
	}
	if count > 50 {
		speed += 0.01;
		speed = clamp(speed,0,2)
	}
	if count == 50 {
		angleT = point_direction(x,y,obj_player.x,obj_player.y) - 20;
	}
	if count > 50 and count < 110 {
		if count mod (8 - global.main_stats.difficulty) == 0 {
			sound_ObjSound_Play(se_tan02);
			for(var i = -1; i <= 1; i++) {
				shot_CreateShotA1(x,y,1.5,angleT + (20 * i),spr_danmaku_seed_m,5,0);
			}
		}
	}
	
	count++;
	count2++;
}