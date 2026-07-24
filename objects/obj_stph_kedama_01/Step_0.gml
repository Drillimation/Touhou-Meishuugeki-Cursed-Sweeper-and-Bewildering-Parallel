// Inherit the parent event
event_inherited();

//Main attacks
if entered == true {
	//Input action commands here
	if count == 0 {
		sound_ObjSound_Play(se_kira01)
		direction = 270
		speed = 1.5;
	}
	
	if count == 30 {
		sound_ObjSound_Play(se_tan01);
		var speedT = 1.5;
		var angleT = point_direction(x,y,obj_player.x,obj_player.y);
		repeat(4 + (global.main_stats.difficulty * 2)) {
			shot_CreateShotA1(x,y,speedT,angleT,spr_danmaku_pellet,5,0);
			speedT -= 0.1;
		}
	}
	
	count++;
	count2++;
}