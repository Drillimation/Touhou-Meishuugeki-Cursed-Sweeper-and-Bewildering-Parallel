// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		if x_pos < 128 {
			move_ObjMove_SetDestAtSpeed(self,64,64,1);
		}
		if x_pos > 128 {
			move_ObjMove_SetDestAtSpeed(self,192,64,1);
		}
	}
	
	if count == 60 {
		if x_pos < 128 {
			move_ObjMove_SetDestAtSpeed(self,96,96,1);
		}
		if x_pos > 128 {
			move_ObjMove_SetDestAtSpeed(self,160,96,1);
		}
		speedT = 2;
		sound_ObjSound_Play(se_tan01)
		for(var i = 0; i < global.main_stats.difficulty + 4; i++) {
			angleT = point_direction(x,y,obj_player.x,obj_player.y);
			repeat(5) {
				shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_seed_s,5,10);
				angleT += 360 / 5
			}
			speedT -= 0.1;
		}
	}
	
	if count == 120 {
		if x_pos < 128 {
			direction = 330;
		}
		if x_pos > 128 {
			direction = 210;
		}
		speed = 2;
		sound_ObjSound_Play(se_tan01)
		
		speedT = 2;
		for(var i = 0; i < global.main_stats.difficulty + 4; i++) {
			angleT = point_direction(x,y,obj_player.x,obj_player.y);
			repeat(5) {
				shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_seed_s,5,8);
				angleT += 360 / 5
			}
			speedT -= 0.1;
		}
	}
	
	count++;
	count2++;
}