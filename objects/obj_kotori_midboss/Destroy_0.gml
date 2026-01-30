for (var i = 0; i < array_length(global.player_stats); i++) {
	system_AddScore(round(5000),i);
}
scr_create_camera("STAGE_01_DAY");
var inst = instance_create_depth(x,y,-1000,obj_defeated_boss);
inst.index_sprite = spr_kotori_defeat;