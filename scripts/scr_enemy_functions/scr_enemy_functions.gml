function enemy_GetEnemyBossSceneObjectID() {
	/// @function enemy_GetEnemyBossSceneObjectID()
	/// @description Returns the instance ID of the current boss. Returns undefined if no boss is currently present.
	
	if instance_exists(obj_boss) {
		return obj_boss.id
	}
	else {
		return undefined
	}
}

function enemy_GetEnemyBossObjectID() {
	/// @function enemy_GetEnemyBossSceneObjectID()
	/// @description Returns an array of the variables of the current boss. Returns undefined if no boss is currently present.
	
	if instance_exists(obj_boss) {
		return variable_struct_get_names(obj_boss);
	}
	else {
		return undefined
	}
}

function enemy_GetAllEnemyID() {
	/// @function enemy_GetAllEnemyID()
	/// @description Returns an array of all the enemies on-screen. Returns an empty array if no enemies are currently present on screen.
	
	var xview = camera_get_view_x(view_camera[0]);
	var yview = camera_get_view_y(view_camera[0]);
	var _instance_ids = array_create(0);
	with (obj_enemy) {
		if collision_rectangle(xview + global.playing_field.x1,yview + global.playing_field.y1,xview + global.playing_field.x2,yview + global.playing_field.y2,obj_enemy,true,false) {
			array_push(_instance_ids,id);
		}
	}
	return _instance_ids
}

function enemy_GetIntersectionRegistedEnemyID() {
	/// @function enemy_GetIntersectionRegistedEnemyID()
	/// @description Returns the IDs of all the enemies in the player's shot range. Returns an empty array if no enemies are currently in the range.
	
	var _instance_ids = array_create(0);
	with (obj_enemy) {
		if collision_circle(x,y,32,obj_player_bullet,false,false) {
			array_push(_instance_ids,id);
		}
	}
	return _instance_ids
}

function enemy_GetAllEnemyIntersectionPosition() {
	/// @function enemy_GetAllEnemyIntersectionPosition()
	/// @description Returns a 2D array of the X and Y coordinates of all the enemies on-screen. Returns an empty array if no enemies are currently present on screen.
	
	var xview = camera_get_view_x(view_camera[0]);
	var yview = camera_get_view_y(view_camera[0]);
	var _instance_ids = array_create(0);
	with (obj_enemy) {
		if collision_rectangle(xview + global.playing_field.x1,yview + global.playing_field.y1,xview + global.playing_field.x2,yview + global.playing_field.y2,obj_enemy,true,false) {
			array_push (_instance_ids,[x_pos,y_pos]);
		}
	}
	return _instance_ids
}

function enemy_GetEnemyIntersectionPosition(_x,_y,_range) {
	/// @function enemy_GetAllEnemyIntersectionPosition(_x,_y,_range)
	/// @description Returns a 2D array of the X and Y coordinates of all the enemies in a given circular range. Returns an empty array if no enemies are currently in the range.
	/// @param {real} _x The x coordinate of where to set the range.
	/// @param {real} _y The y coordinate of where to set the range.
	/// @param {real} _range The area to look for enemies.
	
	var _instance_ids = array_create(0);
	with (obj_enemy) {
		if collision_circle(_x,_y,_range,obj_enemy,true,false) {
			array_push (_instance_ids,[x_pos,y_pos]);
		}
	}
	return _instance_ids
}

function enemy_GetEnemyIntersectionPositionByIdA1(_enemy) {
	/// @function enemy_GetEnemyIntersectionPositionByIdA1(_enemy)
	/// @description Returns a 2D array of the X and Y coordinates of all the collision sides of a given enemy.
	/// @param {real} _enemy The ID of the enemy to get the coordinates from.
	
	var _instance_ids = array_create(0);
	with(_enemy) {
		array_push(_instance_ids,
			[x_pos - bbox_left,y_pos - bbox_left],
			[x_pos - bbox_top,y_pos - bbox_top],
			[x_pos + bbox_right,y_pos + bbox_right],
			[x_pos + bbox_bottom,y_pos + bbox_bottom]
		)
	}
	return _instance_ids
}

function enemy_GetEnemyIntersectionPositionByIdA2(_enemy,_x,_y) {
	/// @function enemy_GetEnemyIntersectionPositionByIdA1(_enemy)
	/// @description Returns a 2D array of the X and Y coordinates of all the collision sides of a given enemy in a selected range. This returns an empty array if the enemy is not present.
	/// @param {real} _enemy The ID of the enemy to get the coordinates from.
	/// @param {real} _x The x coordinate of where to set the range.
	/// @param {real} _y The y coordinate of where to set the range.
	
	var _instance_ids = array_create(0);
	with(_enemy) {
		if collision_point(_x,_y,_enemy,true,false) {
			array_push(_instance_ids,
				[x_pos - bbox_left,y_pos - bbox_left],
				[x_pos - bbox_top,y_pos - bbox_top],
				[x_pos + bbox_right,y_pos + bbox_right],
				[x_pos + bbox_bottom,y_pos + bbox_bottom]
			)
		}
	}
	return _instance_ids
}

function enemy_LoadEnemyShotData(_filename,_imgnumb = 1,_removeback = true,_smooth = false,_xorig = 0,_yorig = 0) {
	/// @function enemy_LoadEnemyShotData(_filename)
	/// @description Sets an enemy's danmaku sprites from an external file.
	/// @param {string} _filename The filename to load the sprite.
	/// @param {real} _imgnumb (OPTIONAL) The number of subimages to give the sprite. Set to 1 if using a GIF for the image.
	/// @param {real} _removeback (OPTIONAL) Whether to remove the background as dictated by the bottom left pixel.
	/// @param {real} _smooth (OPTIONAL) Whether to smooth the edges if transparent.
	/// @param {real} _xorig (OPTIONAL) Sets the x origin from the center.
	/// @param {real} _yorig (OPTIONAL) Sets the y origin from the center.
	
	var _spr = sprite_add(_filename,_imgnumb,_removeback,_smooth,0,0)
	var _spr_width = sprite_get_width(_spr);
	var _spr_height = sprite_get_height(_spr);
	
	var _origin_x = (_spr_width / 2) + _xorig;
	var _origin_y = (_spr_height / 2) + _yorig;
	
	sprite_set_offset(_spr,_origin_x,_origin_y);
	return _spr
}

function enemy_ReloadEnemyShotData(_index,_filename,_imgnumb = 1,_removeback = true,_smooth = false,_xorig = 0,_yorig = 0) {
	/// @function enemy_ReloadEnemyShotData(_filename)
	/// @description Loads a new set of danmaku sprites from an external file.
	/// @param {real} _filename The index of the sprite to change.
	/// @param {string} _filename The filename to load the sprite.
	/// @param {real} _imgnumb (OPTIONAL) The number of subimages to give the sprite. Set to 1 if using a GIF for the image.
	/// @param {real} _removeback (OPTIONAL) Whether to remove the background as dictated by the bottom left pixel.
	/// @param {real} _smooth (OPTIONAL) Whether to smooth the edges if transparent.
	/// @param {real} _xorig (OPTIONAL) Sets the x origin from the center.
	/// @param {real} _yorig (OPTIONAL) Sets the y origin from the center.
	
	sprite_replace(_index,_filename,_imgnumb,_removeback,_smooth,0,0)
	var _spr_width = sprite_get_width(_index);
	var _spr_height = sprite_get_height(_index);
	
	var _origin_x = (_spr_width / 2) + _xorig;
	var _origin_y = (_spr_height / 2) + _yorig;
	
	sprite_set_offset(_index,_origin_x,_origin_y);
}