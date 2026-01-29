function playermain_CreatePlayerShotA1(_x,_y,_speed,_angle,_damage,_penetration,_graphic,_subimg = 0) {
	/// @function playermain_CreatePlayerShotA1(_x,_y,_speed,_angle,_damage,_penetration,_graphic,_subimg)
	/// @description Fires a single round of danmaku at the angle and speed defined, and returns the ID of the fired danmaku.
	/// @param {real} _x The x coordinate of where to fire the danmaku.
	/// @param {real} _y The y coordinate of where to fire the danmaku.
	/// @param {real} _speed The speed at which danmaku will travel.
	/// @param {real} _angle The angle where the danmaku will travel.
	/// @param {real} _damage The amount of damage the danmaku will deal.
	/// @param {real} _penetration The number of times the danmaku can hit the enemy before being removed.
	/// @param {real} _graphic The sprite to use for the danmaku.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	var inst = instance_create_layer(_x,_y,"Danmaku",obj_player_bullet,{
		speed : _speed,
		direction : _angle,
		sprite_index : _graphic,
		image_index : _subimg
	})
	inst.penetration = _penetration;
	inst.play_id = play_id;
	return inst
}

function playermain_CallSpell() {
	/// @function playermain_CallSpell()
	/// @description Pulls off a spell card, if the conditions are met.
	
	if can_shoot == true {
		var inst = playermain_ObjSpell_Create();
		return inst;
	}
}

function playermain_ObjSpell_Create(_damage = 1,_eraseshot = true) {
	/// @function playermain_ObjSpell_Create(_damage,_eraseshot)
	/// @description Creates the spell card at the player's coordinates, and returns the ID of the spell object.
	/// @param {real} _damage (OPTIONAL) The amount of damage the spell will deal. Defaults to 1.
	/// @param {bool} _eraseshot (OPTIONAL) Whether or not to erase shots. Defaults to true.
	
	var inst = instance_create_layer(x,y,"Spell",obj_spell_card_player)
	inst.damage = _damage;
	inst.erase_shot = _eraseshot
	inst.play_id = play_id;
	return inst
}