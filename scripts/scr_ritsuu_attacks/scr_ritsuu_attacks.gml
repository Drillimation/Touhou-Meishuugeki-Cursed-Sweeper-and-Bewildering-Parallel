function scr_ritsuu_attacks(){
	//Load the files
	var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
	char_name = _load_file.char_names.CHAR_RITSUU
	
	//Main attacks
	
	//Spell cards
	spell_card_ritsuu_01 = function() {
		if count == 0 { 
			timer = 40;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ritsuu_portrait,0,_load_file.enemy_spell.SPELL_RITSUU_01,spr_ritsuu_spell)
			global.main_stats.current_spell = "SPELL_RITSUU_01"
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
			speed = 0;
			move_mode = false;
		}
		
		if count >= 60 {
			if count mod (7 - global.main_stats.difficulty) == 0 {
				sound_ObjSound_Play(se_tan02);
				var inst;
				inst = shot_CreateShotA1(x + 16,y,1,irandom_range(0,360),spr_danmaku_seed_s,5,1);
				move_ObjMove_SetAngularVelocity(inst,random_range(-1,1));
				inst = shot_CreateShotA1(x - 16,y,1,irandom_range(0,360),spr_danmaku_seed_s,5,5);
				move_ObjMove_SetAngularVelocity(inst,random_range(-1,1));
			}
		}
		if count == 180 {
			sound_ObjSound_Play(se_boon01);
			move_ObjMove_SetX(self,32);
			move_ObjMove_SetY(self,144);
		}
		if count == 360 {
			sound_ObjSound_Play(se_boon01);
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,240);
		}
		if count == 540 {
			sound_ObjSound_Play(se_boon01);
			move_ObjMove_SetX(self,224);
			move_ObjMove_SetY(self,144);
		}
		if count == 720 {
			sound_ObjSound_Play(se_boon01);
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
		}
		if count == 900 {
			sound_ObjSound_Play(se_boon01);
			move_ObjMove_SetX(self,32);
			move_ObjMove_SetY(self,144);
			count = 180;
		}
	}
	spell_card_ritsuu_03 = function() {
		if count == 0 { 
			timer = 40;
			sound_ObjSound_Play(se_cat00);
			var _load_file = scr_json_load_file("main/spell_cards" + string(global.suf) + ".json")
			shot_CreateSpellCard("ENEMY",spr_ritsuu_portrait,0,_load_file.enemy_spell.SPELL_RITSUU_03,spr_ritsuu_spell)
			global.main_stats.current_spell = "SPELL_RITSUU_03"
			speed = 0;
			move_mode = false;
			move_ObjMove_SetX(self,128);
			move_ObjMove_SetY(self,48);
		}
		
		if count >= 60 {
			if count mod (7 - global.main_stats.difficulty) == 0 {
				sound_ObjSound_Play(se_tan02);
				shot_CreateShotA1(8,irandom_range(24,264),random_range(0.5,1.25),irandom_range(-5,5),spr_danmaku_seed_s,5,0);
				shot_CreateShotA1(248,irandom_range(24,264),random_range(0.5,1.25),irandom_range(175,185),spr_danmaku_seed_s,5,1);
			}
			
			if count mod 120 == 0 {
				speed = 0;
				move_mode = false;
				move_ObjMove_SetDestAtSpeed(self,irandom_range(32,224),irandom_range(48,96),1);
			}
		}
	}
}