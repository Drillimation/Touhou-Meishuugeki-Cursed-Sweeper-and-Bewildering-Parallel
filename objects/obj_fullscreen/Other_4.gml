var projection_x = display_get_width();
var projection_y = display_get_height();
global.windowwidth = 640 * floor(projection_x / 640)
global.windowheight = 360 * floor(projection_y / 360)

switch(global.game_options.fullscreen) {
	case 0: 
		window_set_fullscreen(false);
		global.windowwidth -= 640
		global.windowheight -= 360
		window_set_size(global.windowwidth,global.windowheight);
		window_center();
		break;
	case 1: 
		window_set_fullscreen(true);
		surface_resize(application_surface,global.windowwidth,global.windowheight)
		break;
}

application_surface_draw_enable(false)
surface_resize(application_surface, global.windowwidth, global.windowheight)

x_axis = display_get_width()
y_axis = display_get_height()