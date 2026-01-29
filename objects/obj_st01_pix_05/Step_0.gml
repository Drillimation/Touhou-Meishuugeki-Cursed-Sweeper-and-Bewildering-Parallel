// Inherit the parent event
event_inherited();

if entered == true {
	//Input action commands here
	if count == 0 {
		var angleT = player_GetAngleToPlayer(self);
		move_ObjMove_SetAngle(self,angleT)
		move_ObjMove_SetSpeed(self,1)
	}
	
	if count == 30 {
		move_ObjMove_SetSpeed(self,0)
		dan_count = 1;
	}
	
	if count >= 30 and count <= 180 {
		if count mod 15 == 0 {
			var angleT = player_GetAngleToPlayer(self);
			angleT -= dan_count * 5
			sound_ObjSound_Play(se_tan02);
			repeat(dan_count + 1) {
				shot_CreateShotA1(x,y,1,angleT,spr_danmaku_seed_s,1.5,8);
				angleT += 10;
			}
			dan_count += 1;
		}
	}
	
	if count == 200 {
		move_ObjMove_SetSpeed(self,1);
		move_ObjMove_SetAngle(self,direction + 180);
	}
	count++;
	count2++;
}