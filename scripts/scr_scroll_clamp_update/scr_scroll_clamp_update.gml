function scr_scroll_clamp_update(_x,_y,_clamp_max) {
	if _x == true {
		scroll_clamp += xaxis
		if x_pos > inventory_scroll[1] {
			scroll_clamp = _clamp_max
			inventory_scroll[0] = x_pos - _clamp_max
			inventory_scroll[1] = x_pos
			/*with(obj_menu_button) {
				if other.x_pos > other.op_length_x - 1 or other.inventory_scroll[1] > other.op_length_x - 1 {
					option_x -= (other.op_length_x - other.list_max_entries);
				}
				else {
					option_x++;
				}
			}*/
		}
		if x_pos < inventory_scroll[0] {
			scroll_clamp = 0
			inventory_scroll[0] = x_pos
			inventory_scroll[1] = x_pos + _clamp_max
			/*with(obj_menu_button) {
				if other.x_pos < 0 or other.inventory_scroll[0] < 0 {
					option_x += (other.op_length_x - other.list_max_entries);
				}
				else {
					option_x--;
				}
			}*/
		}
	}
	if _y == true {
		scroll_clamp += yaxis 
		if y_pos > inventory_scroll[1] {
			scroll_clamp = _clamp_max
			inventory_scroll[0] = y_pos - _clamp_max
			inventory_scroll[1] = y_pos
			/*with(obj_menu_button) {
				if other.y_pos > other.op_length_y - 1 or other.inventory_scroll[1] > other.op_length_y - 1 {
					option_y -= (other.op_length_y - other.list_max_entries);
				}
				else {
					option_y++;
				}
			}*/
			//show_debug_message("Scrolled down")
		}
		if y_pos < inventory_scroll[0] {
			scroll_clamp = 0
			inventory_scroll[0] = y_pos
			inventory_scroll[1] = y_pos + _clamp_max
			/*with(obj_menu_button) {
				if other.y_pos < 0 or other.inventory_scroll[0] < 0 {
					option_y += (other.op_length_y - other.list_max_entries);
				}
				else {
					option_y--;
				}
			}*/
			//show_debug_message("Scrolled up")
		}
	}
}