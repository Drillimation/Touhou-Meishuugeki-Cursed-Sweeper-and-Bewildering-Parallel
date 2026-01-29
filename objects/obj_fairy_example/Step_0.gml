// Inherit the parent event
event_inherited();

if entered == true {
	//Input action commands here
	if count == 0 {
		move_ObjMove_SetDestAtSpeed(self,x_pos,y_pos + 96,1)
	}
	
	if count == 120 {
		sound_ObjSound_Play(se_tan01);
		var angleT = player_GetAngleToPlayer(self);
		shot_CreateShotA1(x,y,1,angleT,spr_danmaku_ball_s1,1,0);
		move_ObjMove_SetSpeed(self,1);
		move_ObjMove_SetAngle(self,irandom_range(180,360));
	}
	count++;
	count2++;
}