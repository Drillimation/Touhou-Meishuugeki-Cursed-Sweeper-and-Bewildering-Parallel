// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		var angleT = player_GetAngleToPlayer(self);
		move_ObjMove_SetAngle(self,angleT)
		move_ObjMove_SetSpeed(self,2)
	}
	
	if count == 30 {
		move_ObjMove_SetSpeed(self,0.25)
	}
	
	if count >= 30 and count <= 199 {
		if count mod 30 == 0 {
			var angleT = player_GetAngleToPlayer(self);
			angleT -= global.main_stats.difficulty * 15
			sound_ObjSound_Play(se_tan02);
			repeat((global.main_stats.difficulty * 2) + 1) {
				shot_CreateShotA1(x,y,1,angleT,spr_danmaku_seed_s,1.5,8);
				angleT += 15;
			}
		}
	}
	
	if count == 200 {
		move_ObjMove_SetSpeed(self,1);
		move_ObjMove_SetAngle(self,direction + 180);
	}
	count++;
	count2++;
}
