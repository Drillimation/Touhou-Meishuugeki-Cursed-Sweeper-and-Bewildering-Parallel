function scr_danmaku_sprites(){
	//This function is intended for setting the image speeds and angles based on the sprites you import.
	switch(sprite_index) {
		case spr_danmaku_amulet: image_angle = direction; image_speed = 0; break;
		case spr_danmaku_arrowhead: image_angle = direction; image_speed = 0; break;
		case spr_danmaku_ball_l: image_angle = 0; image_speed = 0; break;
		case spr_danmaku_ball_m1: image_angle = 0; image_speed = 0; break;
		case spr_danmaku_ball_m2: image_angle = 0; image_speed = 0; break;
		case spr_danmaku_ball_s1: image_angle = 0; image_speed = 0; break;
		case spr_danmaku_ball_s2: image_angle = 0; image_speed = 0; break;
		case spr_danmaku_bullet: image_angle = direction; image_speed = 0; break;
		case spr_danmaku_butterfly: image_angle = direction; image_speed = 0; break;
		case spr_danmaku_dagger: image_angle = direction; image_speed = 0; break;
		case spr_danmaku_kunai: image_angle = direction; image_speed = 0; break;
		case spr_danmaku_laser: image_angle = direction; image_speed = 0; break;
		case spr_danmaku_pellet: image_angle = 0; image_speed = 0; break;
		case spr_danmaku_seed_m: image_angle = direction; image_speed = 0; break;
		case spr_danmaku_seed_s: image_angle = direction; image_speed = 0; break;
		case spr_danmaku_shard: image_angle = direction; image_speed = 0; break;
		case spr_danmaku_star_s: image_angle++; image_speed = 0; break;
		case spr_danmaku_star_m: image_angle++; image_speed = 0; break;
		
		case spr_reimu_amulet_1: image_angle = 0; image_speed = 1; break;
		case spr_reimu_amulet_2: image_angle = 0; image_speed = 1; break;
		case spr_marisa_amulet_1: image_angle = direction; image_speed = 1; break;
		case spr_marisa_amulet_2: image_angle = direction; image_speed = 1; break;
		
		case spr_reimu_bomb_1: image_angle = 0; image_speed = 1; break;
		case spr_marisa_bomb_1: image_angle = direction; image_speed = 1; break;
	}
}