// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		move_ObjMove_SetAngle(self,270)
		move_ObjMove_SetSpeed(self,1.25)
	}
	
	if count >= 5 {
		if count mod (12 - global.main_stats.difficulty) == 0 {
			var angleT = player_GetAngleToPlayer(self);
			sound_ObjSound_Play(se_tan02);
			shot_CreateShotA1(x,y,1,angleT,spr_danmaku_ball_s1,2,8);
		}
	}
	
	if count == 30 {
		if x_pos < 128 {
			div_angle = 1;
		}
		else {
			div_angle = -1;
		}
	}
	
	if count >= 31 and count <= 119 {
		move_ObjMove_SetAngle(self,direction + div_angle)
	}
	
	count++;
	count2++;
}