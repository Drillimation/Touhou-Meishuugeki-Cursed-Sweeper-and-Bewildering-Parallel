// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		image_alpha = 0;
		x_pos = irandom_range(16,240);
		y_pos = irandom_range(32,96);
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		speed = 0;
	}
	
	if count < 50 {
		image_alpha += 0.02;
	}
	if count > 50 {
		speed += 0.04;
		speed = clamp(speed,0,2)
	}
	if count == 50 {
		sound_ObjSound_Play(se_tan01);
		angleT = point_direction(x,y,obj_player.x,obj_player.y);
		for(var i = -3; i <= 3; i++) {
			var speedT = 1.25;
			repeat(global.main_stats.difficulty + 1) {
				shot_CreateShotA1(x,y,speedT,angleT + (10 * i),spr_danmaku_kunai,5,10);
				speedT -= 0.125;
			}
		}
	}
	
	count++;
	count2++;
}