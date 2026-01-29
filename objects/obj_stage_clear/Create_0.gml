xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
scr_change_bgm("bgm/stage_clear.it")

bonuses = [
	["RANK","LIVES","HEALTH","POINT","POWER","BOMBS","TOTAL"]
];
for(var i = 0; i < array_length(global.player_stats); i++) {
	var bonuses_to_give = [
		global.player_stats[0].cur_lives * 1000,
		global.player_stats[0].cur_health * 100,
		global.player_stats[0].point_items * 100,
		global.player_stats[0].power_items * 100,
		global.player_stats[0].bombs * 100
	]
	var total = 0;
	for(var j = 0; j < array_length(bonuses_to_give); j++) {
		total += bonuses_to_give[j]
	}
	array_push(bonuses_to_give,total);
	array_push(bonuses,bonuses_to_give)
}
instance_deactivate_object(obj_player,false);

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

count = 0;