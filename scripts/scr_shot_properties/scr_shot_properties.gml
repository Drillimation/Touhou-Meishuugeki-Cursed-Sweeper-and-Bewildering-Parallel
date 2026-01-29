function prop_ObjShot_SetAutoDelete(_id,_autodelete) {
	/// @function prop_ObjShot_SetAutoDelete(_id,_autodelete)
	/// @description Set whether to remove a danmaku instance when they go outside the screen boundaries. Defaults to true.
	/// @param {real} _id The ID of the instance to set the auto deletion.
	/// @param {bool} _autodelete The switch to turn this feature on or off.
	
	with(_id) {
		auto_delete = _autodelete;
	}
}

function prop_ObjShot_FadeDelete(_id,_speed = 0.01) {
	/// @function prop_ObjShot_FadeDelete(_id,_speed)
	/// @description Fades out a danmaku object and removes it.
	/// @param {real} _id The ID of the instance to remove.
	/// @param {real} _speed (OPTIONAL) The speed at which to fade the danmaku. Defaults to 0.01, which removes the instance in 100 frames (roughly over a second and a half).
	
	with(_id) {
		fade_delete = _speed;
	}
}

function prop_ObjShot_SetDeleteFrame(_id,_time) {
	/// @function prop_ObjShot_SetDeleteFrame(_id,_time)
	/// @description Removes a danmaku object after a specified number of frames.
	/// @param {real} _id The ID of the instance to remove.
	/// @param {real} _speed The time before the instance is removed.
	
	with(_id) {
		frame_delete = true;
		delete_time = _time;
	}
}

function prop_ObjShot_SetSpellResist(_id,_spellresist) {
	/// @function prop_ObjShot_SetSpellResist(_id,_spellresist)
	/// @description Set whether to grant spell card immunity to a danmaku instance.
	/// @param {real} _id The ID of the instance to set the spell resistance.
	/// @param {bool} _spellresist The switch to turn this feature on or off.
	
	with(_id) {
		item_resist = _spellresist;
	}
}

function prop_ObjShot_SetGraphic(_id,_sprite,_subimg = 0) {
	/// @function prop_ObjShot_SetGraphic(_id,_sprite,_subimg)
	/// @description Sets the sprite for a danmaku instance.
	/// @param {real} _id The ID of the instance to set the sprite.
	/// @param {real} _sprite The image file for the sprite.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	with(_id) {
		sprite_index = _sprite;
		image_index = _subimg;
	}
}

function prop_ObjShot_SetDamage(_id,_damage) {
	/// @function prop_ObjShot_SetDamage(_id,_damage)
	/// @description Set how much damage a danmaku instance can deal. Only applies to obj_player_bullet.
	/// @param {real} _id The ID of the instance to set the damage.
	/// @param {real} _damage The amount of damage the danmaku can deal.
	
	with(_id) {
		actual_damage = _damage;
	}
}

function prop_ObjShot_SetPenetration(_id,_penetration) {
	/// @function prop_ObjShot_SetPenetration(_id,_penetration)
	/// @description Sets how many times a danmaku instance can hurt the target. Only applies to obj_player_bullet. Defaults to 1.
	/// @param {real} _id The ID of the instance to set the penetration.
	/// @param {real} _damage The amount of times the danmaku can hit.
	
	with(_id) {
		penetration = _penetration;
	}
}

function prop_ObjShot_SetEraseShot(_id,_erase) {
	/// @function prop_ObjShot_SetEraseShot(_id,_erase)
	/// @description Set whether the player's own danmaku should erase enemy danmaku when coming into contact. Defaults to false.
	/// @param {real} _id The ID of the instance to set the penetration.
	/// @param {bool} _erase The switch to turn this feature on or off.
	
	with(_id) {
		erase_other_danmaku = _erase;
	}
}

function prop_ObjShot_GetDamage(_id) {
	/// @function prop_ObjShot_GetDamage(_id)
	/// @description Returns the actual damage of a danmaku instance.
	/// @param {real} _id The ID of the instance to get the damage.
	
	return variable_struct_get(_id,"actual_damage");
}

function prop_ObjShot_GetPenetration(_id) {
	/// @function ObjShot_GetPenetration(_id)
	/// @description Returns the penetration of a danmaku instance. Only applies to obj_player_bullet.
	/// @param {real} _id The ID of the instance to get the penetration.
	
	return variable_struct_get(_id,"penetration");
}

function prop_ObjShot_GetDelay(_id) {
	/// @function prop_ObjShot_GetDelay(_id)
	/// @description Returns the damage delay of a danmaku instance.
	/// @param {real} _id The ID of the instance to get the damage delay.
	
	return variable_struct_get(_id,"damage_delay");
}

function prop_ObjShot_IsSpellResist(_id) {
	/// @function prop_ObjShot_GetDelay(_id)
	/// @description Returns the spell resistance of a danmaku instance.
	/// @param {real} _id The ID of the instance to get the spell resistance.
	
	return variable_struct_get(_id,"spell_resist");
}

function prop_ObjShot_GetImageID(_id) {
	/// @function prop_ObjShot_GetDelay(_id)
	/// @description Returns the sprite index of a danmaku instance.
	/// @param {real} _id The ID of the instance to get the sprite index.
	
	return variable_struct_get(_id,"sprite_index");
}