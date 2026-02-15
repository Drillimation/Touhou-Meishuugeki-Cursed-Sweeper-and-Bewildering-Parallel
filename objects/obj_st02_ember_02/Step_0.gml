// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		x_pos = irandom_range(16,240);
		y_pos = irandom_range(32,96);
		direction = irandom_range(105,345);
		speed = 0;
	}
	
	if count < 100 {
		image_alpha += 0.01;
	}
	
	if count == 100 {
		var angleT = point_direction(x,y,obj_player.x,obj_player.y);
		sound_ObjSound_Play(se_kira01);
		repeat(20 + (global.main_stats.difficulty * 4)) {
			var speedT = 1.25;
			for (var i = 0; i < 3; i++) {
				shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_ball_s1,5,8);
				speedT -= 0.125;
			}
			angleT += 360 / (20 + (global.main_stats.difficulty * 4))
		}
	}
	if count > 100 {
		speed += 0.01;
	}
	
	count++;
	count2++;
}