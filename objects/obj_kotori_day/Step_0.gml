// Inherit the parent event
event_inherited();

if entered == true {
	//Input action commands here
	switch(life) {
		case 4: attack_kotori_main_1(); break;
		case 3: spell_card_kotori_01(); break;
		case 2: attack_kotori_main_2(); break;
		case 1: spell_card_kotori_03(); break;
		case 0: spell_card_kotori_05(); break;
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