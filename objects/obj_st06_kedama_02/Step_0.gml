// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		image_alpha = 0;
		y_pos = 80
		//direction = 270
		speed = 0;
	}
	
	if count < 50 {
		image_alpha += 0.02;
	}
	if count > 50 {
		if x_pos < 128 { direction = 0; }
		else { direction = 180; }
		speed = 1;
	}
	if count == 50 {
		sound_ObjSound_Play(se_tan01);
		var angleT = point_direction(x,y,obj_player.x,obj_player.y);
		repeat(15 + (global.main_stats.difficulty * 5)) {
			for(var i = 0; i < 2; i++) {
				shot_CreateShotA1(x,y,1.75 + (0.25 * i),angleT,spr_danmaku_seed_s,5,5);
			}
			angleT += 360 / (15 + (global.main_stats.difficulty * 5))
		}
	}
	
	count++;
	count2++;
}