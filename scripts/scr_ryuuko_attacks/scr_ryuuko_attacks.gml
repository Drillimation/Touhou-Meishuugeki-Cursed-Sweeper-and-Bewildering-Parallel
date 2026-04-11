function scr_ryuuko_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_RYUUKO
	
	//Main attacks
	attack_ryuuko_mid = function() {
		if count mod 20 == 0 {
			sound_ObjSound_Play(se_tan01);
			var angleT = irandom_range(0,360);
			repeat(12 + (global.main_stats.difficulty * 2)) {
				var inst = shot_CreateShotA1(x,y,2,angleT,spr_danmaku_amulet,5,8);
				move_ObjMove_SetAcceleration(inst,-0.05)
				with(inst) {
					set_function = function() {
						if count <= 299 {
							speed = clamp(speed,0.25,2);
						}
						if count == 300 {
							sound_ObjSound_Play(se_kira00);
							move_ObjMove_SetAcceleration(self,0.01);
							move_ObjMove_SetMaxSpeed(self,2);
						}
					}
				}
				angleT += 7.5
			}
		}
		
		if count mod 120 == 0 {
			move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(32,144),1);
		}
	}
}