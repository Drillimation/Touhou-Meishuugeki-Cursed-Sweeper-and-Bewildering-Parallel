function scr_change_language(){
	switch(global.game_options.language) {
		case 0: global.suf = "_en"; break;
		case 1: global.suf = "_jp"; break;
	}
}