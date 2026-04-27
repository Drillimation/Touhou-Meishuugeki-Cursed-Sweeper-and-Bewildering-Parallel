// Inherit the parent event
event_inherited();

if entered == true {
	//Input action commands here
	switch(life) {
		case 0: spell_card_fusana_07(); break;
		case 1: spell_card_fusana_05(); break;
		case 2: attack_fusana_main_03(); break;
		case 3: spell_card_fusana_03(); break;
		case 4: attack_fusana_main_02(); break;
		case 5: spell_card_fusana_01(); break;
		case 6: attack_fusana_main_01(); break;
	}
	count++;
	
	if tick mod 6 == 0 {
		timer -= 0.1;
		tick = 0;
		if timer == 0 {
			with(obj_spell_card_enemy) { captured = false; }
			hp = 0;
			scr_enemy_remove_life();
		}
	}
	tick++;
}

//Animation
if hspeed < 0 { face = 0; }
else if hspeed == 0 { face = 1; }
else if hspeed > 0 { face = 2; }
	
if count2 mod 20 == 0 {
	image_index = (face * 4)
	count2 = 0;
}
else {
	image_index = (face * 4) + floor(count2 / 5);
}
count2++;