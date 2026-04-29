// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		image_alpha = 0;
		x_pos = choose(64,128,192);
		y_pos = 96;
		direction = irandom_range(180,360);
		speed = 0;
	}
	
	if count < 50 {
		image_alpha += 0.02;
	}
	if count > 50 {
		speed += 0.04;
		speed = clamp(speed,0,2)
		
		if count < 130 {
			if count mod 5 == 0 {
				var angleT = point_direction(x,y,obj_player.x,obj_player.y);
				shot_CreateShotA1(x,y,1.25,angleT,spr_danmaku_kunai,5,10);
				for(var i = 0; i < global.main_stats.difficulty + 1; i++) {
					var inst = shot_CreateShotA1(x,y,1.25,(angleT + 165) - (10 * i),spr_danmaku_kunai,5,0);
					with(inst) {
						set_function = function() {
							if count == 0 {
								angleT = point_direction(x,y,obj_player.x,obj_player.y);
							}
							if direction > angleT { direction--; }
							if direction < angleT { direction++; }
						}
					}
					inst = shot_CreateShotA1(x,y,1.25,(angleT - 165) + (10 * i),spr_danmaku_kunai,5,0);
					with(inst) {
						set_function = function() {
							if count == 0 {
								angleT = point_direction(x,y,obj_player.x,obj_player.y);
							}
							if direction > angleT { direction--; }
							if direction < angleT { direction++; }
						}
					}
				}
			}
		}
	}
	if count == 50 {
		var angleT = 0;
		var speedT = 1.25;
		repeat(16) {
			for(var i = 0; i < global.main_stats.difficulty + 1; i++) {
				sound_ObjSound_Play(se_tan01)
				var inst = shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_kunai,5,0);
				move_ObjMove_SetAcceleration(inst,-0.02);
				with(inst) {
					set_function = function() {
						if count == 60 {
							sound_ObjSound_Play(se_kira00)
							move_ObjMove_SetAcceleration(inst,0.04);
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