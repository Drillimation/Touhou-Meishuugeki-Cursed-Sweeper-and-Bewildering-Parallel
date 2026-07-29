// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		dir = 270
		spd = 1.5;
	}
	
	if count == 30 {
		sound_ObjSound_Play(se_tan01);
		var speedT = 1.5;
		var angleT = point_direction(x,y,obj_player.x,obj_player.y);
		repeat(2) {
			for(var i = -1 - global.main_stats.difficulty; i < 2 + global.main_stats.difficulty; i++) {
				shot_CreateShotA1(x,y,speedT,angleT + (10 * i),spr_danmaku_seed_m,5,8);
			}
			speedT -= 0.25;
		}
	}
	
	count++;
	count2++;
}