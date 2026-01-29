function system_SetStgFrame(_x1,_y1,_x2,_y2,_minrpriority,_maxrpriority) {
	/// @function system_SetStgFrame(_left,_top,_right,_buttom,_minpriority,_maxpriority)
	/// @description Sets the playing field for the game, and the render priorities to prevent the player from going out of bounds.
	/// @param {real} _x1 Set the x coordinate of the top left corner of the playing field.
	/// @param {real} _y1 Set the y coordinate of the top left corner of the playing field.
	/// @param {real} _x2 Set the x coordinate of the bottom right corner of the playing field.
	/// @param {real} _y2 Set the y coordinate of the bottom right corner of the playing field.
	/// @param {real} _minrpriority Set the minimum render priority, on a 0 to 100 scale. Any values outside that will result in an error.
	/// @param {real} _maxrpriority Set the minimum render priority, on a 0 to 100 scale. Any values outside that will result in an error.
	
	global.playing_field = {
		x1 : _x1,
		y1 : _y1,
		x2 : _x2,
		y2 : _y2,
		minrpriority : _minrpriority,
		maxrpriority : _maxrpriority
	}
	if _minrpriority <= -1 or _minrpriority >= 101 {
		show_error("Minimum render priority is outside range.",true);
	}
	if _maxrpriority <= -1 or _maxrpriority >= 101 {
		show_error("Maximum render priority is outside range.",true);
	}
	if _maxrpriority <= _minrpriority {
		show_error("Minimum priority is greater than the maximum priority.",true);
	}
}

function system_GetScore(_player = 0) {
	/// @function system_GetScore(_player)
	/// @description Returns the current score of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the current score from.
	
	return global.player_stats[_player].cur_score;
}

function system_AddScore(_score,_player = 0) {
	/// @function system_AddScore(_score,_player)
	/// @description Adds the given value to the score of the given player.
	/// @param {real} _score The number of points to add to the score.
	/// @param {real} _player (OPTIONAL) The player to add to their current score.
	
	global.player_stats[_player].cur_score += _score;
}

function system_GetGraze(_player = 0) {
	/// @function system_GetGraze(_player)
	/// @description Returns the current graze of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the current graze from.
	
	return global.player_stats[_player].graze;
}

function system_AddGraze(_graze,_player = 0) {
	/// @function system_AddGraze(_graze,_player)
	/// @description Adds the given value to the graze count of the given player.
	/// @param {real} _graze The number of points to add to the graze.
	/// @param {real} _player (OPTIONAL) The player to add to their current graze count.
	
	global.player_stats[_player].graze += _graze;
}

function system_GetPoint(_player = 0) {
	/// @function system_GetPoint(_player)
	/// @description Returns the current number of point items collected by the given player.
	/// @param {real} _player (OPTIONAL) The player to get the current point item count from.
	
	return global.player_stats[_player].point_items;
}

function system_AddPoint(_point,_player = 0) {
	/// @function system_AddPoint(_point,_player)
	/// @description Adds the given value to the point item count of the given player.
	/// @param {real} _point The number of points to add to the point item count.
	/// @param {real} _player (OPTIONAL) The player to add to their current point item count.
	
	global.player_stats[_player].point_items += _point;
}

function system_SetItemRenderPriorityI(_rpriority) {
	/// @function system_SetItemRenderPriorityI(_rpriority)
	/// @description Sets the render priority for items, on a 0 to 100 scale. Any values outside that will result in an error.
	/// @param {real} _rpriority The value to set the render priority.
	
	with(obj_item) {
		rpriority = _rpriority;
		if rpriority < 0 or rpriority > 100 {
			show_error("Render priority is outside range.",true);
		}
	}
}

function system_SetShotRenderPriorityI(_rpriority) {
	/// @function system_SetShotRenderPriorityI(_rpriority)
	/// @description Sets the render priority for danmaku, on a 0 to 100 scale. Any values outside that will result in an error.
	/// @param {real} _rpriority The value to set the render priority.
	
	with(obj_shot) {
		rpriority = _rpriority;
		if rpriority < 0 or rpriority > 100 {
			show_error("Render priority is outside range.",true);
		}
	}
}

function system_GetStgFrameRenderPriorityMinI() {
	/// @function system_GetStgFrameRenderPriorityMinI()
	/// @description Returns the lowest render priority for the playing field, on a 0 to 100 scale as an integer.
	
	return floor(global.playing_field.minrpriority)
}

function system_GetStgFrameRenderPriorityMaxI() {
	/// @function system_GetStgFrameRenderPriorityMaxI()
	/// @description Returns the highest render priority for the playing field, on a 0 to 100 scale as an integer.
	
	return floor(global.playing_field.maxrpriority)
}

function system_GetItemRenderPriorityI() {
	/// @function system_GetItemRenderPriorityI()
	/// @description Returns the render priority for items, on a 0 to 100 scale as an integer.
	
	return floor(obj_item.rpriority)
}

function system_GetShotRenderPriorityI() {
	/// @function system_GetShotRenderPriorityI()
	/// @description Returns the render priority for danmaku, on a 0 to 100 scale as an integer.
	
	return floor(obj_shot.rpriority)
}

function system_GetPlayerRenderPriorityI(_player = 0) {
	/// @function system_GetPlayerRenderPriorityI()
	/// @description Returns the render priority for the given player, on a 0 to 100 scale as an integer.
	/// @param {real} _player (OPTIONAL) The player to get the render priority from.
	
	return floor(global.player_stats[_player].rpriority)
}

function system_GetCameraFocusPermitPriorityI() {
	/// @function system_GetCameraFocusPermitPriorityI()
	/// @description Returns the render priority for the camera, on a 0 to 100 scale as an integer.
	
	return floor(global.playing_field.camera_priority)
}

function system_GetStgFrameLeft() {
	/// @function system_GetStgFrameLeft()
	/// @description Returns the leftmost coordinate of the playing field.
	
	return global.playing_field.x1
}

function system_GetStgFrameTop() {
	/// @function system_GetStgFrameTop()
	/// @description Returns the topmost coordinate of the playing field.
	
	return global.playing_field.y1
}

function system_GetStgFrameRight() {
	/// @function system_GetStgFrameRight()
	/// @description Returns the rightmost coordinate of the playing field.
	
	return global.playing_field.x2
}

function system_GetStgFrameBottom() {
	/// @function system_GetStgFrameBottom()
	/// @description Returns the bottommost coordinate of the playing field.
	
	return global.playing_field.y2
}

function system_GetStgFrameWidth() {
	/// @function system_GetStgFrameWidth()
	/// @description Returns the width of the playing field.
	
	return global.playing_field.x2 - global.playing_field.x1
}

function system_GetStgFrameHeight() {
	/// @function system_GetStgFrameHeight()
	/// @description Returns the height of the playing field.
	
	return global.playing_field.y2 - global.playing_field.y1
}

function system_GetScreenWidth() {
	/// @function system_GetStgFrameWidth()
	/// @description Returns the width of the game window.
	
	return window_get_width()
}

function system_GetScreenHeight() {
	/// @function system_GetScreenHeight()
	/// @description Returns the height of the game window.
	
	return window_get_height()
}

function system_IsReplay() {
	/// @function system_GetScreenHeight()
	/// @description Checks whether or not the game is currently in replay mode. If so, it will return true, false if not.

	return global.replay_mode;
}

function system_AddArchiveFile(_archivepath) {
	/// @function system_AddArchiveFile(_archivepath)
	/// @description Adds the path to use when reading external images or sound effects from a folder. Nonexistent paths will return as undefined.
	/// @param {string} _archivepath The path to use to get the folder.
	
	if directory_exists(_archivepath) {
		return _archivepath
	}
	else {
		return undefined
	}
}