function scr_enemy_remove_life(){
	life -= 1;
	with(obj_enemy_bullet) {
		instance_destroy();
		for(var i = 0; i < array_length(global.player_stats); i++) {
			var item_val = (abs(round((y_pos / 10) - 30)) * 10);
			system_AddScore(item_val,i);
		}
	}
	with(obj_spell_card_enemy) {
		var item_val = round((global.main_stats.stage * 1000) + (other.timer * 100))
		if captured == true {
			sound_ObjSound_Play(se_cardget)
			for(var i = 0; i < array_length(global.player_stats); i++) {
				system_AddScore(item_val,i);
			}
			array_push(global.main_stats.spells_captured,attack_name);
		}
		if instance_exists(obj_spell_bonus) { instance_destroy(obj_spell_bonus); }
		var inst = instance_create_depth(0,0,0,obj_spell_bonus);
		inst.captured = captured;
		inst.spell_value = item_val;
		instance_destroy();
	}
	if life >= 0 {
		count = 0;
		hp = start_hp;
		if timer >= 0 {
			for (var i = 0; i < array_length(global.player_stats); i++) {
				system_AddScore(round((timer * 100) + (global.main_stats.stage * 1000)),i);
			}
		}
		for(var i = 0; i < array_length(item_drop); i++) {
			item_CreateItemA2(item_drop[i],x,y,x + irandom_range(-16,16),y + irandom_range(-16,16),0);
		}
	}
	else {
		instance_destroy();
		sound_ObjSound_Play(se_enep01);
	}
}