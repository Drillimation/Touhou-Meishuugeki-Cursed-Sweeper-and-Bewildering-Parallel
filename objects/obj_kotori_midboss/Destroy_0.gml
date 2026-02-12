item_CreateItemA2(spr_bomb_item,x,y,x + irandom_range(-16,16),y + irandom_range(-16,16),0);
for (var i = 0; i < array_length(global.player_stats); i++) {
	system_AddScore(round(5000),i);
}
if room != room_debug { scr_create_camera("STAGE_01_DAY"); }
var inst = instance_create_depth(x,y,-1000,obj_defeated_boss);
inst.index_sprite = spr_kotori_defeat;