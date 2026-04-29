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
		direction = point_direction(x,y,obj_player.x,obj_player.y) + irandom_range(-45,45);
		speed = 0;
	}
	
	if count < 50 {
		image_alpha += 0.02;
	}
	if count >= 50 and count <= 130 {
		if count mod 5 == 0 {
			sound_ObjSound_Play(se_tan01);
			baseAngle = 0;
			var angleT = 0;
			repeat(12) {
				shot_CreateShotA1(x,y,1.5,baseAngle + angleT,spr_danmaku_kunai,5,0);
				angleT += 360 / 12
			}
			baseAngle += 7.5;
			repeat(4) {
				var angleX = irandom_range(0,360)
				var speedT = 2.5;
				for(var i = 0; i < (global.main_stats.difficulty * 3) + 3; i++) {
					shot_CreateShotA1(x,y,speedT,angleX,spr_danmaku_kunai,5,10);
					speedT -= 0.1;
				}
			}
		}
	}
	if count == 50 {
		sound_ObjSound_Play(se_tan01);
		speed = 2;
		repeat(16) {
			shot_CreateShotA1(x,y,random_range(1,1.5),irandom_range(0,360),spr_danmaku_ball_m2,5,2)
		}
	}
	
	count++;
	count2++;
}