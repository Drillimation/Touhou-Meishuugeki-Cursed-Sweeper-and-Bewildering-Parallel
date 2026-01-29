function scr_change_language(){
	switch(global.game_options.language) {
		case 0: 
			global.suf = "_en";
			global.gui_font = "drp_shd4";
			break;
		case 1: 
			global.suf = "_jp";
			global.gui_font = "drp_shd";
			break;
	}
}