function move_ObjMove_SetX(_id,_x) {
	/// @function move_ObjMove_SetX(_id,_x)
	/// @description Sets the X coordinate of the instance with the given ID.
	/// @param {real} _id The ID of the instance to move.
	/// @param {real} _x The X coordinate to set.
	
	with(_id) {
		x_pos = _x;
	}
}

function move_ObjMove_SetY(_id,_y) {
	/// @function move_ObjMove_SetX(_id,_y)
	/// @description Sets the Y coordinate of the instance with the given ID.
	/// @param {real} _id The ID of the instance to move.
	/// @param {real} _y The X coordinate to set.
	
	with(_id) {
		y_pos = _y;
	}
}

function move_ObjMove_SetPosition(_id,_x,_y) {
	/// @function move_ObjMove_SetPosition(_id,_x,_y)
	/// @description Sets the X and Y coordinates of the instance with the given ID.
	/// @param {real} _id The ID of the instance to move.
	/// @param {real} _x The X coordinate to set.
	
	with(_id) {
		x_pos = _x;
		y_pos = _y;
	}
}

function move_ObjMove_SetSpeed(_id,_speed) {
	/// @function move_ObjMove_SetSpeed(_id,_speed)
	/// @description Sets the speed of the instance with the given ID.
	/// @param {real} _id The ID of the instance to set the speed.
	/// @param {real} _speed The speed to set.
	
	with(_id) {
		speed = _speed;
	}
}

function move_ObjMove_SetAngle(_id,_angle) {
	/// @function move_ObjMove_SetAngle(_id,_angle)
	/// @description Sets the direction or angle of the instance with the given ID.
	/// @param {real} _id The ID of the instance to set the direction.
	/// @param {real} _angle The direction to set.
	
	with(_id) {
		direction = _angle;
	}
}

function move_ObjMove_SetAcceleration(_id,_accel) {
	/// @function move_ObjMove_SetAcceleration(_id,_accel)
	/// @description Sets the acceleration of the instance with the given ID. Only applies to danmaku. Using any other instances will trigger an error.
	/// @param {real} _id The ID of the instance to set the acceleration.
	/// @param {real} _accel The acceleration to set.
	
	with(_id) {
		accel = _accel;
	}
}

function move_ObjMove_SetMaxSpeed(_id,_maxspeed) {
	/// @function move_ObjMove_SetMaxSpeed(_id,_maxspeed)
	/// @description Sets the maximum speed of the instance with the given ID. Only applies to danmaku. Using any other instances will trigger an error.
	/// @param {real} _id The ID of the instance to set the maximum speed.
	/// @param {real} _maxspeed The maximum speed to set.
	
	with(_id) {
		maxspeed = _maxspeed;
	}
}

function move_ObjMove_SetAngleAtTarget(_id,_target) {
	/// @function move_ObjMove_SetAngleAtTarget(_id,_target)
	/// @description Sets the direction or angle of the instance with the given ID at another instance, even if the target moves.
	/// @param {real} _id The ID of the instance to set the direction.
	/// @param {real} _target The direction to set.
	
	with(_id) {
		autohome = true;
		enemy_target = _target;
	}
}

function move_ObjMove_SetAngularVelocity(_id,_wvel) {
	/// @function move_ObjMove_SetAngularVelocity(_id,_wvel)
	/// @description Sets the angular velocity of the instance with the given ID. Only applies to danmaku. Using any other instances will trigger an error.
	/// @param {real} _id The ID of the instance to set the velocity.
	/// @param {real} _wvel The velocity to set.
	
	with(_id) {
		angular_velocity = _wvel;
	}
}

function move_ObjMove_SetDestAtSpeed(_id,_x,_y,_speed) {
	/// @function move_ObjMove_SetDestAtSpeed(_id,_x,_y,_speed)
	/// @description Moves the instance with the given ID to the given coordinates at the speed specified.
	/// @param {real} _id The ID of the instance to move.
	/// @param {real} _x The x coordinate of the target to set.
	/// @param {real} _y The y coordinate of the target to set.
	/// @param {real} _speed The speed of the instance to set.
	
	with(_id) {
		xview = camera_get_view_x(view_camera[0]);
		yview = camera_get_view_y(view_camera[0]);
		x_tar = _x;
		y_tar = _y;
		move_mode = true;
		direction = point_direction(x,y,xview + _x,yview + _y);
		speed = _speed;
	}
}

function move_ObjMove_SetDestAtFrame(_id,_x,_y,_frames) {
	/// @function move_ObjMove_SetDestAtFrame(_id,_x,_y,_frames)
	/// @description Moves the instance with the given ID to the given coordinates, with the speed based on the number of frames it takes to reach the destination. 
	/// @param {real} _id The ID of the instance to move.
	/// @param {real} _x The x coordinate of the target to set.
	/// @param {real} _y The y coordinate of the target to set.
	/// @param {real} _frames The time it will take for the instance to reach its destination (60 frames is one in-game second).
	
	with(_id) {
		xview = camera_get_view_x(view_camera[0]);
		yview = camera_get_view_y(view_camera[0]);
		x_tar = _x;
		y_tar = _y;
		move_mode = true;
		direction = point_direction(x,y,xview + _x,yview + _y);
		var length = point_distance(x,y,xview + _x,yview + _y);
		speed = length / _frames;
	}
}

function move_ObjMove_SetDestAtWeight(_id,_x,_y,_weight,_maxspeed) {
	/// @function move_ObjMove_SetDestAtWeight(_id,_x,_y,_weight,_maxspeed)
	/// @description Moves the instance with the given ID to the given coordinates, with it accelerating as it begins moving and braking as it gets close to the destination.
	/// @param {real} _id The ID of the instance to move.
	/// @param {real} _x The x coordinate of the target to set.
	/// @param {real} _y The y coordinate of the target to set.
	/// @param {real} _weight The speed at which the instance will accelerate.
	/// @param {real} _maxspeed The maximum speed for the instance.
	
	with(_id) {
		xview = camera_get_view_x(view_camera[0]);
		yview = camera_get_view_y(view_camera[0]);
		x_tar = _x;
		y_tar = _y;
		speedcap = true;
		acceleration = _weight;
		maxspeed = _maxspeed;
		direction = point_direction(x,y,xview + _x,yview + _y);
	}
}

function move_ObjMove_GetX(_id) {
	/// @function move_ObjMove_GetX(_id)
	/// @description Returns the X coordinate of an instance with the given ID.
	/// @param {real} _id The ID of the instance to get the X coordinate from.
	
	return variable_struct_get(_id,"x_pos");
}

function move_ObjMove_GetY(_id) {
	/// @function move_ObjMove_GetY(_id)
	/// @description Returns the Y coordinate of an instance with the given ID.
	/// @param {real} _id The ID of the instance to get the Y coordinate from.
	
	return variable_struct_get(_id,"y_pos");
}

function move_ObjMove_GetSpeed(_id) {
	/// @function move_ObjMove_GetX(_id)
	/// @description Returns the speed of an instance with the given ID.
	/// @param {real} _id The ID of the instance to get the speed from.
	
	return variable_struct_get(_id,"speed");
}

function move_ObjMove_GetAngle(_id) {
	/// @function move_ObjMove_GetX(_id)
	/// @description Returns the current direction of an instance with the given ID.
	/// @param {real} _id The ID of the instance to get the direction from.
	
	return variable_struct_get(_id,"direction");
}