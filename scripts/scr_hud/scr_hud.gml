function scr_main_hud() {
	//For debug use only. Replace if you're making an actual game.
	xview = camera_get_view_x(view_camera[0]);
	yview = camera_get_view_y(view_camera[0]);
	
	draw_set_font(global.font_effects.sprite_font);
	//Top Part
	//High score text
	draw_set_halign(fa_center);
	draw_set_color(make_color_rgb(255,0,0));
	draw_text(xview + 128,yview + 0,"HIGH SCORE");
	draw_set_color(make_color_rgb(255,255,255));
	draw_set_halign(fa_right);
	draw_text(xview + 152,yview + 8,highscore);
	
	//Player 1
	draw_set_halign(fa_left);
	switch(global.player_stats[0].character) {
		case "CHAR_REIMU": draw_set_color(make_color_rgb(255,0,0)); break;
		case "CHAR_MARISA": draw_set_color(make_color_rgb(255,255,0)); break;
		case "CHAR_YUKARI": draw_set_color(make_color_rgb(128,0,255)); break;
		case "CHAR_KAGUYA": draw_set_color(make_color_rgb(255,128,192)); break;
	}
	draw_text(xview + 0,yview + 0,"1UP");
	draw_set_halign(fa_right);
	draw_set_color(make_color_rgb(255,255,255));
	draw_text(xview + 56,yview + 8,global.player_stats[0].cur_score);
	draw_sprite(spr_heart_icon,0,xview + 32,yview + 0);
	draw_text(xview + 56,yview + 0,global.player_stats[0].cur_health);
	
	//Player 2
	if array_length(global.player_stats) == 2 {
		draw_set_halign(fa_left);
		switch(global.player_stats[0].character) {
			case "CHAR_REIMU": draw_set_color(make_color_rgb(255,0,0)); break;
			case "CHAR_MARISA": draw_set_color(make_color_rgb(255,255,0)); break;
			case "CHAR_YUKARI": draw_set_color(make_color_rgb(128,0,255)); break;
			case "CHAR_KAGUYA": draw_set_color(make_color_rgb(255,128,192)); break;
		}
		draw_text(xview + 200,yview + 0,"2UP");
		draw_set_halign(fa_right);
		draw_set_color(make_color_rgb(255,255,255));
		draw_text(xview + 256,yview + 8,global.player_stats[1].cur_score);
		draw_sprite(spr_heart_icon,0,xview + 232,yview + 0);
		draw_text(xview + 256,yview + 0,global.player_stats[0].cur_health);
	}
	else {
		var p2_attract = ["CONNECT\nGAMEPAD","PUSH 2P\nSTART"]
		draw_set_halign(fa_center);
		draw_set_color(make_color_rgb(255,255,255));
		draw_text(xview + 224,yview + 0,p2_attract[gamepad_is_connected(1)]);
	}
	
	//Bottom Part
	//draw_sprite(spr_hud_bottom,0,xview + 0,yview + 272);
	draw_set_halign(fa_right);
	draw_set_color(make_color_rgb(255,255,255));
	draw_sprite(spr_hud_bottom,0,xview + 0,yview + 272);
	
	draw_text(xview + 24,yview + 272,global.player_stats[0].cur_lives - 1);
	draw_text(xview + 24,yview + 280,global.player_stats[0].cur_bombs);
	draw_text(xview + 72,yview + 272,global.player_stats[0].graze);
	draw_text(xview + 72,yview + 280,global.player_stats[0].power_items);
	draw_text(xview + 120,yview + 280,global.player_stats[0].point_items);
	
	if array_length(global.player_stats) == 2 {
		draw_text(xview + 256,yview + 272,global.player_stats[1].cur_lives - 1);
		draw_text(xview + 256,yview + 280,global.player_stats[1].cur_bombs);
		draw_text(xview + 224,yview + 272,global.player_stats[1].graze);
		draw_text(xview + 224,yview + 280,global.player_stats[1].power_items);
		draw_text(xview + 176,yview + 280,global.player_stats[1].point_items);
	}
	
	if global.main_stats.time_orbs >= global.main_stats.orb_requirement {
		draw_set_color(make_color_rgb(255,216,0));
	}
	else {
		draw_set_color(make_color_rgb(255,255,255));
	}
	draw_text(xview + 128,yview + 272,global.main_stats.time_orbs);
	draw_set_color(make_color_rgb(255,255,255));
	draw_text(xview + 176,yview + 272,global.main_stats.orb_requirement);
	
	/*draw_set_halign(fa_left);
	draw_text(xview + 0,yview + 0,global.player_stats[0].cur_score);
	draw_text(xview + 128,yview + 0,global.player_stats[0].point_items);
	draw_set_halign(fa_right);
	draw_text(xview + 256,yview + 0,global.player_stats[0].power_items);
	draw_set_halign(fa_left);
	draw_text(xview + 0,yview + 272,global.player_stats[0].cur_health);
	draw_text(xview + 48,yview + 272,global.player_stats[0].cur_lives - 1);
	draw_text(xview + 96,yview + 272,global.player_stats[0].cur_bombs);
	draw_text(xview + 144,yview + 272,global.player_stats[0].graze);*/
}

function scr_enemy_hud() {
	//For debug use only. Replace if you're making an actual game.
	xview = camera_get_view_x(view_camera[0]);
	yview = camera_get_view_y(view_camera[0]);
	
	draw_set_font(global.font_effects.sprite_font)
	var cur_health = (life * start_hp) + hp;
	var max_health = (max_hp * start_hp);
	draw_healthbar(xview + 0,yview + 16,xview + 239,yview + 23,(cur_health / max_health) * 100,c_black,c_white,c_white,0,true,false);
	draw_set_halign(fa_right);
	draw_set_colour(make_colour_rgb(255,255,255))
	draw_text(xview + 256,yview + 16,ceil(timer));
	draw_set_alpha(0.5)
	draw_sprite_stretched(hbar,0,xview + 0,yview + 16,240,8);
	draw_set_alpha(1)
	
	scribble_object[0] = scribble(char_name)
		.starting_format("drp_shd5",make_color_rgb(255,255,255))
		.wrap(240)
		.line_spacing(16)
		.draw(xview + 0, yview + 24)
}

function scr_game_over_hud() {
	//For debug use only. Replace if you're making an actual game.
	xview = camera_get_view_x(view_camera[0]);
	yview = camera_get_view_y(view_camera[0]);
	
	scribble_object[0] = scribble(str)
		.starting_format("drp_shd2",make_color_rgb(192,0,0))
		.align(fa_center,fa_middle)
		.outline(make_color_rgb(0,0,0))
		.shadow(make_color_rgb(0,0,0),1)
		.gradient(make_color_rgb(64,0,0),1)
		.wrap(640)
		.draw(xview + 128,yview + 144)
		
	draw_sprite_stretched(spr_textbox,0,xview + 0,yview + 192,256,80);
}

function scr_enemy_spell_card_hud() {
	//For debug use only. Replace if you're making an actual game.
	xview = camera_get_view_x(view_camera[0]);
	yview = camera_get_view_y(view_camera[0]);
	
	draw_sprite(spr_enemy_spell_banner,0,xview + x_pos,yview + 24);
	scribble_object[0] = scribble(attack_name)
		.starting_format("drp_shd5",make_color_rgb(255,255,255))
		.align(fa_right,fa_top)
		.wrap(240)
		.line_spacing(16)
		.draw(xview + x_pos,yview + 32)
	
	//draw_set_halign(fa_left);
	switch(captured) {
		case true: 
			scribble_object[1] = scribble(string(round((global.main_stats.stage * 1000) + (associated_object.timer * 100))))
				.starting_format("drp_shd5",make_color_rgb(255,255,255))
				.align(fa_right,fa_top)
				.wrap(240)
				.line_spacing(16)
				.draw((xview + x_pos) - 100,yview + 24)
			break;
		case false: 
			scribble_object[1] = scribble(fail_text)
				.starting_format("drp_shd5",make_color_rgb(255,255,255))
				.align(fa_right,fa_top)
				.wrap(240)
				.line_spacing(16)
				.draw((xview + x_pos) - 100,yview + 24)
			break;
	}
	
	var inst = struct_get(global.spellcard_statistics,global.main_stats.current_spell)
	if is_nan(round(inst.captures / inst.encounters)) {
		inst = 0;
	}
	else {
		inst = round(inst.captures / inst.encounters) * 100;
	}
	
	scribble_object[2] = scribble(string(inst) + "%")
		.starting_format("drp_shd5",make_color_rgb(255,255,255))
		.align(fa_right,fa_top)
		.wrap(240)
		.line_spacing(16)
		.draw(xview + x_pos,yview + 24)
}

function scr_spell_bonus_hud() {
	//For debug use only. Replace if you're making an actual game.
	xview = camera_get_view_x(view_camera[0]);
	yview = camera_get_view_y(view_camera[0]);
	
	draw_set_font(global.font_effects.sprite_font)
	draw_set_halign(fa_center);
	draw_set_color(make_color_rgb(255,216,0));
	switch(captured) {
		case true: 
			draw_text(xview + 128,yview + 40,"SPELL CARD BONUS"); 
			scribble_object[0] = scribble(spell_value)
				.starting_format("drp_shd2",make_color_rgb(255,0,0))
				.outline(make_color_rgb(0,0,0))
				.shadow(make_color_rgb(0,0,0),1)
				.gradient(make_color_rgb(127,0,0),1)
				.align(fa_center,fa_top)
				.wrap(240)
				.line_spacing(16)
				.draw(xview + 128,yview + 48)
			break;
		case false: 
			draw_text(xview + 128,yview + 40,"SPELL BONUS FAILED"); 
			break;
	}
}