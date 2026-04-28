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
		direction = irandom_range(0,360);
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
		var angleT = 0;
		repeat(16) {
			var speedT = 1.25;
			for(var i = 0; i < global.main_stats.difficulty + 1; i++) {
				sound_ObjSound_Play(se_tan01)
				var inst = shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_kunai,5,0);
				move_ObjMove_SetAcceleration(inst,-0.02);
				with(inst) {
					set_function = function() {
						if count == 60 {
							sound_ObjSound_Play(se_kira00)
							move_ObjMove_SetAcceleration(self,0.04);
							direction = point_direction(x,y,obj_player.x,obj_player.y);
						}
					}
				}
				speedT -= 0.125;
			}
			angleT += 360 / 16;
		}
	}
	
	count++;
	count2++;
}