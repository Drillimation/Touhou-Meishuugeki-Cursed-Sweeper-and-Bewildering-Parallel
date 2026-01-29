function scr_item_sprites(){
	//This function is intended for setting the image speeds based on the sprites you import.
	switch(sprite_index) {
		case spr_bomb_item: image_speed = 0; break;
		case spr_full_item: image_speed = 0; break;
		case spr_life_item: image_speed = 0; break;
		case spr_point_item: image_speed = 0; break;
		case spr_power_item_l: image_speed = 0; break;
		case spr_power_item_s: image_speed = 0; break;
	}
}