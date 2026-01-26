switch(global.game_options.fullscreen) {
	case 0:
		draw_surface_stretched(application_surface, 0, 0, global.windowwidth, global.windowheight);
		break;
	case 1:
		draw_surface_stretched(application_surface, (x_axis / 2) - (global.windowwidth / 2), (y_axis / 2) - (global.windowheight / 2), global.windowwidth, global.windowheight);
		break;
}