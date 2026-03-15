function shot_DeleteShotAll(_shottype,_deletetype) {
	/// @function shot_DeleteShotAll(_shottype,_deletetype)
	/// @description Removes all danmaku matching the criteria.
	/// @param {const} _shottype The type of danmaku to remove. (Only _shot_type.TYPE_ALL, _shot_type.TYPE_SHOT, and _shot_type.TYPE_CHILD are accepted.)
	/// @param {const} _deletetype How you want the danmaku to be removed. (Only _delete_type.TYPE_IMMEDIATE, _delete_type.TYPE_FADE, and _delete_type.TYPE_ITEM are accepted.)
	
	var delete_shot_functions = function(_deletetype) {
		if _deletetype == _delete_type.TYPE_IMMEDIATE {
			instance_destroy();
		}
		if _deletetype == _delete_type.TYPE_FADE {
			fade_speed = 0.01;
		}
		if _deletetype == _delete_type.TYPE_ITEM {
			instance_destroy();
			instance_create_layer(x,y,"Instances",obj_item);
		}
		if _deletetype != _delete_type.TYPE_IMMEDIATE && _deletetype != _delete_type.TYPE_FADE && _deletetype != _delete_type.TYPE_ITEM {
			show_error("Not a valid constant.",true)
		}
	}
	
	if _shottype == _shot_type.TYPE_ALL {
		with(obj_enemy_bullet) {
			delete_shot_functions(_delete_type.TYPE_IMMEDIATE);
		}
	}
	if _shottype == _shot_type.TYPE_SHOT {
		with(obj_enemy_bullet) {
			if spell_resist == false {
				delete_shot_functions(_delete_type.TYPE_FADE);
			}
		}
	}
	if _shottype == _shot_type.TYPE_CHILD {
		with(obj_enemy_bullet) {
			if shot_type == "CHILD" {
				delete_shot_functions(_delete_type.TYPE_ITEM);
			}
		}
	}
	if _shottype != _shot_type.TYPE_ALL && _shottype != _shot_type.TYPE_SHOT && _shottype != _shot_type.TYPE_CHILD {
		show_error("Not a valid constant.",true)
	}
}

function shot_DeleteShotInCircle(_shottype,_deletetype,_x,_y,_radius) {
	/// @function shot_DeleteShotInCircle(_shottype,_deletetype,_x,_y,_radius)
	/// @description Removes all danmaku matching the criteria in a given circular range.
	/// @param {const} _shottype The type of danmaku to remove. (Only _shot_type.TYPE_ALL, _shot_type.TYPE_SHOT, and _shot_type.TYPE_CHILD are accepted.)
	/// @param {const} _deletetype How you want the danmaku to be removed. (Only _delete_type.TYPE_IMMEDIATE, _delete_type.TYPE_FADE, and _delete_type.TYPE_ITEM are accepted.)
	/// @param {real} _x The x coordinate of where to remove the danmaku.
	/// @param {real} _y The y coordinate of where to remove the danmaku.
	/// @param {real} _radius The range in which to remove the danmaku.
	
	var delete_shot_functions = function(_deletetype) {
		if _deletetype == _delete_type.TYPE_IMMEDIATE {
			instance_destroy();
		}
		if _deletetype == _delete_type.TYPE_FADE {
			fade_speed = 0.01;
		}
		if _deletetype == _delete_type.TYPE_ITEM {
			instance_destroy();
			instance_create_layer(x,y,"Instances",obj_item);
		}
		if _deletetype != _delete_type.TYPE_IMMEDIATE && _deletetype != _delete_type.TYPE_FADE && _deletetype != _delete_type.TYPE_ITEM {
			show_error("Not a valid constant.",true)
		}
	}
	
	if collision_circle(_x,_y,_radius,obj_enemy_bullet,true,false) {
		if _shottype == _shot_type.TYPE_ALL {
			with(obj_enemy_bullet) {
				delete_shot_functions(_delete_type.TYPE_IMMEDIATE);
			}
		}
		if _shottype == _shot_type.TYPE_SHOT {
			with(obj_enemy_bullet) {
				if spell_resist == false {
					delete_shot_functions(_delete_type.TYPE_FADE);
				}
			}
		}
		if _shottype == _shot_type.TYPE_CHILD {
			with(obj_enemy_bullet) {
				if shot_type == "CHILD" {
					delete_shot_functions(_delete_type.TYPE_ITEM);
				}
			}
		}
		if _shottype != _shot_type.TYPE_ALL && _shottype != _shot_type.TYPE_SHOT && _shottype != _shot_type.TYPE_CHILD {
			show_error("Not a valid constant.",true)
		}
	}
}

function shot_CreateShotA1(_x,_y,_speed,_angle,_graphic,_delay,_subimg = 0) {
	/// @function shot_CreateShotA1(_x,_y,_speed,_angle,_graphic,_delay,_subimg)
	/// @description Fires a single round of danmaku at the angle and speed defined, and returns the ID of the fired danmaku.
	/// @param {real} _x The x coordinate of where to fire the danmaku.
	/// @param {real} _y The y coordinate of where to fire the danmaku.
	/// @param {real} _speed The speed at which danmaku will travel.
	/// @param {real} _angle The angle where the danmaku will travel.
	/// @param {real} _graphic The sprite to use for the danmaku.
	/// @param {real} _delay The number of frames before the danmaku is allowed to hit the player.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	xview = camera_get_view_x(view_camera[0]);
	yview = camera_get_view_y(view_camera[0]);
	var ex, ey
	if _x != x { ex = xview + _x } else { ex = x }
	if _y != y { ey = yview + _y } else { ey = y }
	
	var inst = instance_create_layer(ex,ey,"Danmaku",obj_enemy_bullet,{
		speed : _speed,
		direction : _angle,
		sprite_index : _graphic,
		image_index : _subimg
	})
	inst.delay = _delay;
	return inst
}

function shot_CreateShotA2(_x,_y,_speed,_angle,_accel,_maxspeed,_graphic,_delay,_subimg = 0) {
	/// @function shot_CreateShotA2(_x,_y,_speed,_angle,_accel,_maxspeed,_graphic,_delay,_subimg)
	/// @description Fires a single round of danmaku at the angle and speed defined and incrementing a given speed every frame until capping at its maximum, and returns the ID of the fired danmaku.
	/// @param {real} _x The x coordinate of where to fire the danmaku.
	/// @param {real} _y The y coordinate of where to fire the danmaku.
	/// @param {real} _speed The speed at which danmaku will travel.
	/// @param {real} _angle The angle where the danmaku will travel.
	/// @param {real} _accel The value where the danmaku will accelerate every frame.
	/// @param {real} _maxspeed The maximum speed of the danmaku.
	/// @param {real} _graphic The sprite to use for the danmaku.
	/// @param {real} _delay The number of frames before the danmaku is allowed to hit the player.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	xview = camera_get_view_x(view_camera[0]);
	yview = camera_get_view_y(view_camera[0]);
	var ex, ey
	if _x != x { ex = xview + _x } else { ex = x }
	if _y != y { ey = yview + _y } else { ey = y }
	
	var inst = instance_create_layer(ex,ey,"Danmaku",obj_enemy_bullet,{
		speed : _speed,
		direction : _angle,
		sprite_index : _graphic,
		image_index : _subimg
	})
	inst.accel = _accel;
	inst.maxspeed = _maxspeed;
	inst.delay = _delay;
	return inst
}

function shot_CreateShotOA1(_parentobj,_speed,_angle,_graphic,_delay,_subimg = 0) {
	/// @function shot_CreateShotOA1(_parentobj,_speed,_angle,_graphic,_delay,_subimg)
	/// @description Fires a single round of danmaku at the angle and speed defined at the x and y coordinates of a given object, and returns the ID of the fired danmaku.
	/// @param {real} _parentobj The x and y coordinates where the danmaku will be fired.
	/// @param {real} _speed The speed at which danmaku will travel.
	/// @param {real} _angle The angle where the danmaku will travel.
	/// @param {real} _graphic The sprite to use for the danmaku.
	/// @param {real} _delay The number of frames before the danmaku is allowed to hit the player.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	var inst = instance_create_layer(_parentobj.x,_parentobj.y,"Instances",obj_enemy_bullet,{
		speed : _speed,
		direction : _angle,
		sprite_index : _graphic,
		image_index : _subimg
	})
	inst.delay = _delay;
	return inst
}

function shot_CreateShotB1(_x,_y,_hspeed,_vspeed,_graphic,_delay,_subimg = 0) {
	/// @function shot_CreateShotB1(_x,_y,_hspeed,_vspeed,_graphic,_delay,_subimg)
	/// @description Fires a single round of danmaku at the horizontal and vertical speeds defined, and returns the ID of the fired danmaku.
	/// @param {real} _x The x coordinate of where to fire the danmaku.
	/// @param {real} _y The y coordinate of where to fire the danmaku.
	/// @param {real} _hspeed The horizontal speed at which danmaku will travel.
	/// @param {real} _vspeed The vertical speed at which danmaku will travel.
	/// @param {real} _graphic The sprite to use for the danmaku.
	/// @param {real} _delay The number of frames before the danmaku is allowed to hit the player.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.

	var inst = instance_create_layer(_x,_y,"Danmaku",obj_enemy_bullet,{
		hspeed : _hspeed,
		vspeed : _vspeed,
		direction : point_direction(x,y,hspeed,vspeed),
		sprite_index : _graphic,
		image_index : _subimg
	})
	inst.delay = _delay;
	return inst
}

function shot_CreateShotB2(_x,_y,_hspeed,_vspeed,_haccel,_vaccel,_maxhspeed,_maxvspeed,_graphic,_delay,_subimg = 0) {
	/// @function shot_CreateShotB1(_x,_y,_hspeed,_vspeed,_graphic,_delay,_subimg)
	/// @description Fires a single round of danmaku at the horizontal and vertical speeds defined and incrementing a given speed every frame until capping at its maximum,, and returns the ID of the fired danmaku.
	/// @param {real} _x The x coordinate of where to fire the danmaku.
	/// @param {real} _y The y coordinate of where to fire the danmaku.
	/// @param {real} _hspeed The horizontal speed at which danmaku will travel.
	/// @param {real} _vspeed The vertical speed at which danmaku will travel.
	/// @param {real} _haccel The horizontal value where the danmaku will accelerate every frame.
	/// @param {real} _vaccel The vertical value where the danmaku will accelerate every frame.
	/// @param {real} _maxhspeed The maximum horizontal speed of the danmaku.
	/// @param {real} _maxvspeed The maximum vertical speed of the danmaku.
	/// @param {real} _graphic The sprite to use for the danmaku.
	/// @param {real} _delay The number of frames before the danmaku is allowed to hit the player.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.

	var inst = instance_create_layer(_x,_y,"Danmaku",obj_enemy_bullet,{
		hspeed : _hspeed,
		vspeed : _vspeed,
		direction : point_direction(x,y,hspeed,vspeed),
		sprite_index : _graphic,
		image_index : _subimg
	})
	inst.haccel = _haccel;
	inst.vaccel = _vaccel;
	inst.maxhspeed = _maxhspeed;
	inst.maxvspeed = _maxvspeed;
	inst.delay = _delay;
	return inst
}

function shot_CreateShotOB2(_parentobj,_hspeed,_vspeed,_graphic,_delay,_subimg = 0) {
	/// @function shot_CreateShotOA1(_parentobj,_speed,_angle,_graphic,_delay,_subimg)
	/// @description Fires a single round of danmaku at the angle and speed defined at the x and y coordinates of a given object, and returns the ID of the fired danmaku.
	/// @param {real} _parentobj The x and y coordinates where the danmaku will be fired.
	/// @param {real} _hspeed The horizontal speed at which danmaku will travel.
	/// @param {real} _vspeed The vertical speed at which danmaku will travel.
	/// @param {real} _graphic The sprite to use for the danmaku.
	/// @param {real} _delay The number of frames before the danmaku is allowed to hit the player.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	var inst = instance_create_layer(_parentobj.x,_parentobj.y,"Instances",obj_enemy_bullet,{
		hspeed : _hspeed,
		vspeed : _vspeed,
		direction : point_direction(x,y,hspeed,vspeed),
		sprite_index : _graphic,
		image_index : _subimg
	})
	inst.delay = _delay;
	return inst
}

function shot_CreateLooseLaserA1(_x,_y,_speed,_angle,_length,_width,_graphic,_delay,_subimg = 0) {
	/// @function shot_CreateLooseLaserA1(_x,_y,_speed,_angle,_length,_width,_graphic,_delay,_subimg)
	/// @description Fires a moving laser at the angle, speed, width, and height defined, and returns the ID of the fired laser. You can also use it to create larger danmaku.
	/// @param {real} _x The x coordinate of where to fire the laser.
	/// @param {real} _y The y coordinate of where to fire the laser.
	/// @param {real} _speed The speed at which laser will travel.
	/// @param {real} _angle The angle where the laser will travel.
	/// @param {real} _length The length of the laser.
	/// @param {real} _width The width of the laser.
	/// @param {real} _graphic The sprite to use for the laser.
	/// @param {real} _delay The number of frames before the danmaku is allowed to hit the player.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	var inst = instance_create_layer(_x,_y,"Danmaku",obj_enemy_bullet,{
		speed : _speed,
		direction : _angle,
		sprite_index : _graphic,
		image_index : _subimg,
		image_xscale : _length,
		image_yscale : _width
	})
	inst.delay = _delay;
	return inst
}

function shot_CreateStraightLaserA1(_x,_y,_angle,_length,_width,_deletetime,_graphic,_delay,_subimg = 0) {
	/// @function shot_CreateStraightLaserA1(_x,_y,_angle,_length,_width,_deletetime,_graphic,_delay,_subimg)
	/// @description Creates a line that warns the player that a laser will be fired at the angle, length, and width defined, and then fires the laser after a given time. The laser is then removed after a specified time.
	/// @param {real} _x The x coordinate of where to fire the laser.
	/// @param {real} _y The y coordinate of where to fire the laser.
	/// @param {real} _angle The angle where the laser will be fired.
	/// @param {real} _length The length of the laser.
	/// @param {real} _width The width of the laser.
	/// @param {real} _deletetime The time the laser is allowed to stay on-screen before it is removed.
	/// @param {real} _graphic The sprite to use for the laser.
	/// @param {real} _delay The number of frames before the laser is actually fired.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	var inst = instance_create_layer(_x,_y,"Danmaku",obj_warning_line,{
		direction : _angle,
		sprite_index : _graphic,
		image_index : _subimg,
		image_xscale : _length,
		image_yscale : _width
	})
	inst.delay = _delay;
	inst.deletetime = _deletetime;
	return inst
}

function shot_CreateCurveLaserA1(_x,_y,_speed,_angle,_length,_width,_graphic,_delay,_subimg = 0) {
	/// @function shot_CreateLooseLaserA1(_x,_y,_speed,_angle,_length,_width,_graphic,_delay,_subimg)
	/// @description Fires a curved moving laser at the angle, speed, width, and height defined, and returns the ID of the fired laser. You can also use it to create larger danmaku.
	/// @param {real} _x The x coordinate of where to fire the laser.
	/// @param {real} _y The y coordinate of where to fire the laser.
	/// @param {real} _speed The speed at which laser will travel.
	/// @param {real} _angle The angle where the laser will travel.
	/// @param {real} _length The length of the laser.
	/// @param {real} _width The width of the laser.
	/// @param {real} _graphic The sprite to use for the laser.
	/// @param {real} _delay The number of frames before the danmaku is allowed to hit the player.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	var inst = instance_create_layer(_x,_y,"Danmaku",obj_enemy_bullet,{
		speed : _speed,
		direction : _angle,
		sprite_index : _graphic,
		image_index : _subimg,
		image_xscale : _length,
		image_yscale : _width
	})
	inst.delay = _delay;
	inst.angular_velocity = 1;
	return inst
}

function shot_SetShotIntersectionCircle(_x,_y,_radius) {
	/// @function shot_SetShotIntersectionCircle(_x,_y,_radius)
	/// @description Sets a circular hitbox at a specified position in a given range. This only lasts a single frame.
	/// @param {real} _x The x coordinate of where to place the hitbox.
	/// @param {real} _y The y coordinate of where to place the hitbox.
	/// @param {real} _radius The range of the hitbox.
	
	
}

function shot_SetShotIntersectionLine(_x1,_y1,_x2,_y2,_width) {
	/// @function shot_SetShotIntersectionLine(_x1,_y1,_x2,_y2,_width)
	/// @description Sets a linear hitbox between two points within a provided width. This only lasts a single frame.
	/// @param {real} _x1 The x coordinate of the first position where to place the hitbox.
	/// @param {real} _y1 The y coordinate of the first position where to place the hitbox.
	/// @param {real} _x2 The x coordinate of the second position where to place the hitbox.
	/// @param {real} _y2 The y coordinate of the second position where to place the hitbox.
	/// @param {real} _width The width of the hitbox.
	
	
}

function shot_GetShotIdInCircleA1(_x,_y,_radius) {
	/// @function shot_GetShotIdInCircleA1(_x,_y,_radius)
	/// @description Returns the instance IDs of all danmaku inside a given range.
	/// @param {real} _x The x coordinate of where to start the search.
	/// @param {real} _y The y coordinate of where to start the search.
	/// @param {real} _radius The range of the search.
	
	var _instance_ids = array_create(0);
	with (obj_enemy_bullet) {
		if collision_circle(_x,_y,_radius,obj_enemy_bullet,false,false) {
			array_push (_instance_ids,id);
		}
	}
	return _instance_ids
}

function shot_GetShotIdInCircleA2(_x,_y,_radius,_target) {
	/// @function shot_GetShotIdInCircleA2(_x,_y,_radius,_target)
	/// @description Returns the instance IDs of all or specific danmaku inside a given range.
	/// @param {real} _x The x coordinate of where to start the search.
	/// @param {real} _y The y coordinate of where to start the search.
	/// @param {real} _radius The range of the search.
	/// @param {real) _target The type of danmaku you want to search. (Only _target_type.TARGET_ALL, _target_type.TARGET_ENEMY, and _target_type.TARGET_PLAYER are accepted.)
	
	var _instance_ids = array_create(0);
	if _target == _target_type.TARGET_ALL || _target_type.TARGET_ENEMY {
		with (obj_enemy_bullet) {
			if collision_circle(_x,_y,_radius,obj_enemy_bullet,false,false) {
				array_push (_instance_ids,id);
			}
		}
	}
	if _target == _target_type.TARGET_ALL || _target_type.TARGET_PLAYER {
		with (obj_player_bullet) {
			if collision_circle(_x,_y,_radius,obj_player_bullet,false,false) {
				array_push (_instance_ids,id);
			}
		}
	}
	if _target != _target_type.TARGET_ALL && _target != _target_type.TARGET_ENEMY && _target != _target_type.TARGET_PLAYER {
		show_error("Not a valid constant.",true)
	}
	return _instance_ids
}

function shot_Get_ShotCount(_target) {
	/// @function  shot_Get_ShotCount(_target)
	/// @description Returns the number of all or specific danmaku on-screen.
	/// @param {const} _target The type of danmaku you want to search. (Only _target_type.TARGET_ALL, _target_type.TARGET_ENEMY, and _target_type.TARGET_PLAYER are accepted.)
	
	var _instance_count = 0;
	if _target == _target_type.TARGET_ALL || _target_type.TARGET_PLAYER {
		_instance_count += instance_number(obj_player_bullet);
	}
	if _target == _target_type.TARGET_ALL || _target_type.TARGET_ENEMY {
		_instance_count += instance_number(obj_enemy_bullet);
	}
	
	if _target != _target_type.TARGET_ALL && _target != _target_type.TARGET_ENEMY && _target != _target_type.TARGET_PLAYER {
		show_error("Not a valid constant.",true)
	}
	return _instance_count
}

function shot_SetShotAutoDeleteClip(_x1,_y1,_x2,_y2) {
	/// @function shot_SetShotAutoDeleteClip(_x1,_y1,_x2,_y2)
	/// @description Sets the boundaries where all danmaku will automatically be removed when outside the given range.
	/// @param {real} _x1 The x coordinate of the first position where to place the border.
	/// @param {real} _y1 The y coordinate of the first position where to place the border.
	/// @param {real} _x2 The x coordinate of the second position where to place the border.
	/// @param {real} _y2 The y coordinate of the second position where to place the border.
	
	with(obj_enemy_bullet) {
		clip_x1 = _x1;
		clip_x2 = _x2;
		clip_y1 = _y1;
		clip_y2 = _y2;
	}
}

function shot_GetShotDataInfoA1(_graphic,_targetshotsheet,_infotype) {
	/// @function shot_SetShotAutoDeleteClip(_x1,_y1,_x2,_y2)
	/// @description Returns information on the properties of a given sprite.
	/// @param {real} _graphic The sprite where to get the information from.
	/// @param {real} _targetshotsheet The instance of the danmaku to get the information from.
	/// @param {const} _infotype The type of info you want to look for. (Only _info_type.INFO_RECT, _info_type.INFO_DELAY_COLOR, _info_type.INFO_BLEND, _info_type.INFO_COLLISION, and _info_type.INFO_COLLISION_LIST are accepted.)
	
	if _infotype == _info_type.INFO_RECT {
		return [_targetshotsheet.bbox_left,_targetshotsheet.bbox_top,_targetshotsheet.bbox_right,_targetshotsheet.bbox_bottom]
	}
	if _infotype == _info_type.INFO_DELAY_COLOR {
		return _targetshotsheet.image_blend
	}
	if _infotype == _info_type.INFO_BLEND {
		return _targetshotsheet.sprite_blend_mode
	}
	if _infotype == _info_type.INFO_RECT {
		var bbox_width = _targetshotsheet.bbox_right - _targetshotsheet.bbox_left;
		var bbox_height = _targetshotsheet.bbox_bottom - _targetshotsheet.bbox_top;
		var avg_radius = (bbox_width + bbox_height) / 4;
		return avg_radius
	}
	if _infotype == _info_type.INFO_COLLISION_LIST {
		var collision_list = [
			[_targetshotsheet.x_pos - _targetshotsheet.bbox_left,_targetshotsheet.y_pos - _targetshotsheet.bbox_left],
			[_targetshotsheet.x_pos - _targetshotsheet.bbox_top,_targetshotsheet.y_pos - _targetshotsheet.bbox_top],
			[_targetshotsheet.x_pos + _targetshotsheet.bbox_right,_targetshotsheet.y_pos + _targetshotsheet.bbox_right],
			[_targetshotsheet.x_pos + _targetshotsheet.bbox_bottom,_targetshotsheet.y_pos + _targetshotsheet.bbox_bottom]
		]
		return collision_list
	}
	
	if _infotype != _info_type.INFO_RECT || _infotype != _info_type.INFO_DELAY_COLOR || _infotype != _info_type.INFO_BLEND || _infotype != _info_type.INFO_COLLISION || _infotype != _info_type.INFO_COLLISION_LIST {
		show_error("Not a valid constant",true);
	}
}

function shot_CreateSpellCard(_type,_sprite,_subimg,_name,_back = undefined) {
	/// @functionshot_CreateSpellCard(_type,_sprite,_subimg,_name)
	/// @description Declares a spell card, complete with a cut-in.
	/// @param {string} _type The type of spell card to use. Must be a string; only "PLAYER" or "ENEMY" are accepted.
	/// @param {real} _sprite The sprite where to get the cut-in from.
	/// @param {real} _subimg The subimage of the sprite to use, if not animated.
	/// @param {string} _name The name of the attack, as a string.
	/// @param {string} _back The sprite to use as a background.
	
	if _type != "PLAYER" and _type != "ENEMY" {
		show_error("\"PLAYER\" and \"ENEMY\" are only accepted.",true);
	}
	var inst;
	switch(_type) {
		case "PLAYER": inst = instance_create_layer(0,0,"Spell",obj_spell_card_player); break;
		case "ENEMY": inst = instance_create_layer(0,0,"Spell",obj_spell_card_enemy); break;
	}
	with(inst) {
		user_type = _type;
		sprite_index = _sprite;
		image_index = _subimg;
		attack_name = _name;
		associated_object = other;
		back_image = _back
	}
}