// Inherit the parent event
event_inherited();

//Main attacks
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
	if count == 50 {
		sound_ObjSound_Play(se_tan01);
		spd = 0.5;
		var baseAngle = 0;
		repeat(5) {
			var ex = x_pos + lengthdir_x(32,baseAngle)
			var ey = y_pos + lengthdir_y(32,baseAngle)
			var inst = shot_CreateShotA1(ex,ey,0,baseAngle,spr_danmaku_ball_l,15,0);
			inst.parent_object = self;
			with(inst) {
				set_function = function() {
					if !instance_exists(parent_object) {
						instance_destroy();
					}
					else {
						x_pos = parent_object.x_pos + lengthdir_x(32,direction);
						y_pos = parent_object.y_pos + lengthdir_y(32,direction);
						dir++;
						if count mod 20 == 0 {
							sound_ObjSound_Play(se_kira01);
							var speedT = 1.25;
							repeat(4) {
								for(var i = -1; i < 2; i++) {
									shot_CreateShotA1(x,y,speedT,(dir - 90) + (i * 15),spr_danmaku_ball_s1,5,10);
								}
								speedT -= 0.125;
							}
						}
					}
				}
			}
			baseAngle += 360 / 5;
		}
	}
	
	count++;
	count2++;
}