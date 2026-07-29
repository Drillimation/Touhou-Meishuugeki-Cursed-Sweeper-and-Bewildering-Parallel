// Inherit the parent event
event_inherited();

if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		dir = 270
		spd = 2;
	}
	if count < 75 {
		spd -= 0.02;
		spd = clamp(speed,0,1.5);
	}
	
	if count < 90 {
		if count mod 3 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = point_direction(x,y,obj_player.x,obj_player.y);
			var speedT = 1.25;
			repeat(global.main_stats.difficulty + 1) {
				shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_ball_s1,5,13);
				speedT -= 0.1;
			}
		}
	}
	if count == 90 {
		baseAngle = point_direction(x,y,obj_player.x,obj_player.y);
	}
	if count == 120 {
		dist = 8;
	}
	if count > 120 and count <= 135 {
		sound_ObjSound_Play(se_kira00);
		repeat(global.main_stats.difficulty + 1) {
			var ex = x_pos + lengthdir_x(dist + irandom_range(-4,4),baseAngle + irandom_range(-15,15))
			var ey = y_pos + lengthdir_y(dist + irandom_range(-4,4),baseAngle + irandom_range(-15,15))
			var inst = shot_CreateShotA1(ex,ey,0,irandom_range(0,360),spr_danmaku_ball_s1,5,choose(0,10));
			move_ObjMove_SetAcceleration(inst,0.01);
		}
		dist += 8;
	}
	if count == 135 {
		if x_pos > 128 {
			dir = 180;
			spd = 1;
		}
	}
	
	count++;
	count2++;
}