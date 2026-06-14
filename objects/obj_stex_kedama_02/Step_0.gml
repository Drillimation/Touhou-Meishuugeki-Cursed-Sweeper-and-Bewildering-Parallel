// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		image_alpha = 0;
		y_pos = 256
		direction = 90
		speed = 0;
	}
	
	if count < 25 {
		image_alpha += 0.04;
	}
	if count > 25 {
		speed = 2;
	}
	if count >= 20 and count < 75 and count mod 10 == 0 {
		sound_ObjSound_Play(se_tan01);
		//var angleT = point_direction(x,y,obj_player.x,obj_player.y);
		repeat(4 + (2 * global.main_stats.difficulty)) {
			shot_CreateShotA1(x,y,2.5,irandom_range(0,360),spr_danmaku_seed_s,5,5);
		}
	}
	
	count++;
	count2++;
}