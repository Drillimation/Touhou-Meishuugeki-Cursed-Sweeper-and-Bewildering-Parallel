function scr_helene_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_HELENE
	
	//Main attacks
	attack_helene_mid = function() {
		if count <= 80 {
			if count mod 10 == 0 {
				sound_ObjSound_Play(se_tan02);
				repeat(7 + global.main_stats.difficulty) {
					var inst = shot_CreateShotA1(x,y,random_range(0.5,1),random_range(180,360),choose(spr_danmaku_seed_s,spr_danmaku_seed_m),5,irandom_range(0,2))
					move_ObjMove_SetAngularVelocity(inst,random_range(-1,1));
					inst.gravity = 0.005;
				}
			}
		}
		if count == 80 {
			move_ObjMove_SetDestAtFrame(self,irandom_range(32,224),irandom_range(32,96),60);
		}
		if count == 140 {
			count = 0;
		}
	}
}