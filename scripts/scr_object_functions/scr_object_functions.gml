function inst_Obj_Delete(_id) {
	/// @function inst_Obj_Delete(_id)
	/// @description Destroys an instance with the given ID.
	/// @param {real} _id The ID of the instance to destroy.
	
	instance_destroy(_id);
}

function inst_Obj_IsDeleted(_id) {
	/// @function inst_Obj_IsDeleted(_id)
	/// @description Checks whether or not an instance with the given ID has been deleted; returns true if so and false if not.
	/// @param {real} _id The ID of the removed instance to check.
	
	if !instance_exists(_id) {
		return true
	}
	else {
		return false
	}
}

function inst_Obj_SetVisible(_id,_alpha) {
	/// @function inst_Obj_SetVisible(_id,_alpha)
	/// @description Sets the sprite alpha of an instance with the given ID. Returns an error if the alpha is outside 0 or 1.
	/// @param {real} _id The ID of the instance to change.
	/// @param {real} _alpha The opacity to set the instance's sprite.
	
	with(_id) {
		if _alpha < 0 or _alpha > 1 {
			show_error("Alpha is outside range",true);
		}
		image_alpha = _alpha
	}
}

function inst_Obj_IsVisible(_id) {
	/// @function inst_Obj_IsVisible(_id)
	/// @description Checks whether or not an instance with the given ID is visible in some form. Returns true if so, even when semi-transparent, and false if not.
	/// @param {real} _id The ID of the removed instance to check.
	
	var _alpha = variable_struct_get(_id,"image_alpha")
	if _alpha > 0 {
		return true
	}
	else {
		return false
	}
}

function inst_Obj_SetRenderPriority(_id,_priority) {
	/// @function inst_Obj_SetRenderPriority(_id,_priority)
	/// @description Sets the render priority of an instance with the given ID, on a 0 to 100 scale. Returns an error if the value is outside 0 or 100.
	/// @param {real} _id The ID of the instance to change.
	/// @param {real} _alpha The opacity to set the instance's sprite.
	
	with(_id) {
		if _priority < 0 or _priority > 100 {
			show_error("Render priority is outside range",true);
		}
		rpriority = _priority
	}
}

function inst_Obj_GetRenderPriority(_id) {
	/// @function inst_Obj_GetRenderPriority(_id)
	/// @description Returns the render priority of an instance with the given ID.
	/// @param {real} _id The ID of the instance to check.
	
	var _priority = variable_struct_get(_id,"rpriority")
	return _priority
}

function inst_Obj_GetValue(_id,_value) {
	/// @function inst_Obj_GetValue(_id,_value)
	/// @description Returns the render priority of an instance with the given ID.
	/// @param {real} _id The ID of the instance to check.
	/// @param {string} _value The name of the variable to get the value from. Must be a string.
	
	if !struct_exists(_id,_value) {
		show_error("Variable does not exist or has been deleted.",true)
	}
	else {
		return variable_struct_get(_id,_value)
	}
}

function inst_Obj_SetValue(_id,_variable,_value) {
	/// @function inst_Obj_SetValue(_id,_variable,_value)
	/// @description Sets a variable and a value to an instance with the given ID.
	/// @param {real} _id The ID of the instance to set the value.
	/// @param {string} _variable The name of the variable to set the value. Must be a string.
	/// @param {free} _value The value to set the variable.
	
	with(_id) {
		variable_instance_set(_id,_variable,_value);
	}
}

function inst_Obj_DeleteValue(_id,_value) {
	/// @function inst_Obj_DeleteValue(_id,_value)
	/// @description Removes a variable of an instance with the given ID.
	/// @param {real} _id The ID of the instance to check.
	/// @param {string} _value The name of the variable to remove. Must be a string.
	
	if !struct_exists(_id,_value) {
		show_error("Variable does not exist or has been deleted.",true)
	}
	else {
		struct_remove(_id,_value);
	}
}

function inst_Obj_IsValueExists(_id,_value) {
	/// @function inst_Obj_IsValueExists(_id,_value)
	/// @description Checks whether a variable of an instance with the given ID exists. Returns true if so, false if not.
	/// @param {real} _id The ID of the instance to check.
	/// @param {string} _value The name of the variable to check. Must be a string.
	
	if struct_exists(_id,_value) {
		return true
	}
	else {
		return false
	}
}

function inst_Obj_GetType(_id) {
	/// @function inst_Obj_GetType(_id)
	/// @description Returns the name of the instance with the given ID.
	/// @param {real} _id The ID of the instance to check.
	
	return asset_get_index(_id)
}

function inst_ObjRender_SetX(_id,_x) {
	/// @function inst_ObjRender_SetPosition(_id,_x,_y)
	/// @description Sets the X coordinate of a given instance.
	/// @param {real} _id The ID of the instance to set the coordinates.
	/// @param {real} _x The X coordinate of the instance to set.
	
	with(_id) {
		x_pos = _x;
	}
}

function inst_ObjRender_SetY(_id,_y) {
	/// @function inst_ObjRender_SetPosition(_id,_x,_y)
	/// @description Sets the Y coordinate of a given instance.
	/// @param {real} _id The ID of the instance to set the coordinate.
	/// @param {real} _y The Y coordinate of the instance to set.
	
	with(_id) {
		y_pos = _y;
	}
}

function inst_ObjRender_SetPosition(_id,_x,_y) {
	/// @function inst_ObjRender_SetPosition(_id,_x,_y)
	/// @description Sets the X and Y coordinates of a given instance.
	/// @param {real} _id The ID of the instance to set the coordinates.
	/// @param {real} _x The X coordinate of the instance to set.
	/// @param {real} _y The Y coordinate of the instance to set.
	
	with(_id) {
		x_pos = _x;
		y_pos = _y;
	}
}

function inst_ObjRender_SetAngle(_id,_angle) {
	/// @function inst_ObjRender_SetAngle(_id,_angle)
	/// @description Sets the direction or angle of a given instance.
	/// @param {real} _id The ID of the instance to set the direction or angle.
	/// @param {real} _angle The angle or direction of the instance to set.
	
	with(_id) {
		direction = _angle;
	}
}

function inst_ObjRender_SetScaleX(_id,_xscale) {
	/// @function inst_ObjRender_SetScaleX(_id,_xscale)
	/// @description Sets the width of the sprite for the given instance.
	/// @param {real} _id The ID of the instance to set the length.
	/// @param {real} _xscale The length of the instance to set.
	
	with(_id) {
		image_xscale = _xscale;
	}
}

function inst_ObjRender_SetScaleY(_id,_yscale) {
	/// @function inst_ObjRender_SetScaleY(_id,_yscale)
	/// @description Sets the width of the sprite for the given instance.
	/// @param {real} _id The ID of the instance to set the width.
	/// @param {real} _yscale The width of the instance to set.
	
	with(_id) {
		image_yscale = _yscale;
	}
}

function inst_ObjRender_SetScale(_id,_xscale,_yscale) {
	/// @function inst_ObjRender_SetAngle(_id,_angle)
	/// @description Sets the length and width of the sprite for the given instance.
	/// @param {real} _id The ID of the instance to set the length and width.
	/// @param {real} _xscale The length of the instance to set.
	/// @param {real} _yscale The width of the instance to set.
	
	with(_id) {
		image_xscale = _xscale;
		image_yscale = _yscale;
	}
}

function inst_ObjRender_SetColor(_id,_red,_green,_blue) {
	/// @function inst_ObjRender_SetColor(_id,_red,_green,_blue)
	/// @description Sets the color of the sprite for the given instance via an RGB value.
	/// @param {real} _id The ID of the instance to set the color.
	/// @param {real} _red The red color of the instance to set.
	/// @param {real} _green The green color of the instance to set.
	/// @param {real} _blue The blue color of the instance to set.
	
	if _red < 0 or _red > 255 {
		show_error("Red color out of range",true);
	}
	if _green < 0 or _green > 255 {
		show_error("Green color out of range",true);
	}
	if _blue < 0 or _blue > 255 {
		show_error("Blue color out of range",true);
	}
	
	with(_id) {
		image_blend = make_color_rgb(_red,_green,_blue)
	}
}

function inst_ObjRender_SetColorHSV(_id,_hue,_saturation,_value) {
	/// @function inst_ObjRender_SetColorHSV(_id,_hue,_saturation,_value)
	/// @description Sets the color of the sprite for the given instance via an HSV value.
	/// @param {real} _id The ID of the instance to set the color.
	/// @param {real} _hue The hue color of the instance to set.
	/// @param {real} _saturation The saturation of the instance to set.
	/// @param {real} _value The value of the instance to set.
	
	if _hue < 0 or _hue > 255 {
		show_error("Hue out of range",true);
	}
	if _saturation < 0 or _saturation > 255 {
		show_error("Saturation out of range",true);
	}
	if _value < 0 or _value > 255 {
		show_error("Value out of range",true);
	}
	
	with(_id) {
		image_blend = make_color_hsv(_hue,_saturation,_value)
	}
}

function inst_ObjRender_GetX(_id) {
	/// @function inst_ObjRender_GetX(_id)
	/// @description Returns the X coordinate of the ID of the given instance.
	/// @param {real} _id The ID of the instance to get the value.
	
	return variable_struct_get(_id,"x_pos")
}

function inst_ObjRender_GetY(_id) {
	/// @function inst_ObjRender_GetY(_id)
	/// @description Returns the Y coordinate of the ID of the given instance.
	/// @param {real} _id The ID of the instance to get the value.
	
	return variable_struct_get(_id,"y_pos")
}

function inst_ObjAngle(_id) {
	/// @function inst_ObjAngle(_id)
	/// @description Returns the direction or angle of the ID of the given instance.
	/// @param {real} _id The ID of the instance to get the value.
	
	return variable_struct_get(_id,"direction")
}

function inst_ObjRender_GetScaleX(_id) {
	/// @function inst_ObjRender_GetScaleX(_id)
	/// @description Returns the image length of the ID of the given instance.
	/// @param {real} _id The ID of the instance to get the value.
	
	return variable_struct_get(_id,"image_xscale")
}

function inst_ObjRender_GetScaleY(_id) {
	/// @function inst_ObjRender_GetScaleY(_id)
	/// @description Returns the image width of the ID of the given instance.
	/// @param {real} _id The ID of the instance to get the value.
	
	return variable_struct_get(_id,"image_yscale")
}