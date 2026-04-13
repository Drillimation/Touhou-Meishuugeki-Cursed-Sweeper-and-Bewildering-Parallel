// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		move_ObjMove_SetDestAtSpeed(self,128,96,1);
		angleT = irandom_range(0,360);
	}
	
	if count > 60 and count < 120 {
		if count mod 3 == 0 {
			sound_ObjSound_Play(se_tan02)
			repeat(global.main_stats.difficulty + 4) {
				shot_CreateShotA1(x,y,random_range(0.5,1),angleT + irandom_range(-20,20),spr_danmaku_pellet,5,12);
			}
			angleT += 20;
		}
	}
	
	if count > 150 and count < 210 {
		if count mod 3 == 0 {
			sound_ObjSound_Play(se_tan02)
			repeat(global.main_stats.difficulty + 4) {
				shot_CreateShotA1(x,y,random_range(0.5,1),angleT + irandom_range(-20,20),spr_danmaku_pellet,5,10);
			}
			angleT -= 20;
		}
	}
	
	if count == 240 {
		angleT = point_direction(x,y,obj_player.x,obj_player.y);
		speedT = 1.25
		for(var i = 0; i < 2 + (global.main_stats.difficulty * 2); i++) {
			repeat(10) {
				shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_ball_s2,5,0);
				angleT += 360 / (2 + (global.main_stats.difficulty * 2))
			}
			speedT -= 0.1;
			angleT -= 5;
		}
	}
	
	if count == 300 {
		angleT = point_direction(x,y,obj_player.x,obj_player.y);
		speedT = 1.25
		for(var i = 0; i < 2 + (global.main_stats.difficulty * 2); i++) {
			repeat(10) {
				shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_ball_s2,5,0);
				angleT += 360 / (2 + (global.main_stats.difficulty * 2))
			}
			speedT -= 0.1;
			angleT -= 5;
		}
		speed = 1;
		direction = 270;
	}
	
	count++;
	count2++;
}