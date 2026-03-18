function item_CreateItemA1(_type,_x,_y,_score,_speed = 0.5,_subimg = 0) {
	/// @function item_CreateItemA1(_type,_x,_y,_score,_speed,_subimg)
	/// @description Creates an item at the specified coordinates, and returns the ID of the item.
	/// @param {real} _type The type of item to create. Must be a sprite.
	/// @param {real} _x The x coordinate where to place the item.
	/// @param {real} _y The y coordinate where to place the item.
	/// @param {real} _score The value to add to the score of the player who collects it.
	/// @param {real} _speed (OPTIONAL) The speed at which the items will fly.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	var inst = instance_create_layer(_x,_y,"Instances",obj_item,{
		sprite_index : _type,
		image_index : _subimg,
		speed : _speed
	})
	inst.score_value = _score;
	return inst;
}

function item_CreateItemA2(_type,_x1,_y1,_x2,_y2,_score,_speed = 0.5,_subimg = 0) {
	/// @function item_CreateItemA2(_type,_x1,_y1,_x2,_y2,_score,_speed,_subimg)
	/// @description Creates an item at the specified coordinates that will travel to the given coordinates before falling.
	/// @param {real} _type The type of item to create. Must be a sprite.
	/// @param {real} _x1 The x coordinate where to place the item.
	/// @param {real} _y1 The y coordinate where to place the item.
	/// @param {real} _x2 The x coordinate where the item will begin to fall.
	/// @param {real} _y2 The y coordinate where the item will begin to fall.
	/// @param {real} _score The value to add to the score of the player who collects it.
	/// @param {real} _speed (OPTIONAL) The speed at which the items will fly.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	xview = camera_get_view_x(view_camera[0]);
	yview = camera_get_view_y(view_camera[0]);
	var inst = instance_create_layer(_x1,_y1,"Instances",obj_item,{
		sprite_index : _type,
		image_index : _subimg,
		direction : point_direction(_x1,_y1,xview + _x2,yview + _y2),
		speed : _speed
	})
	with(inst) {
		score_value = _score;
		move_mode = true;
		x_tar = _x2;
		y_tar = _y2;
	}
}

function item_CollectAllItems(_player = 0,_speed = 4) {
	/// @function item_CollectAllItems(_player,_speed)
	/// @description Makes all items fly towards the given player.
	/// @param {real} _player (OPTIONAL) The player where to send the items to.
	/// @param {real} _speed (OPTIONAL) The speed at which the items will fly.
	
	if play_id == _player {
		with(obj_item) {
			direction = point_direction(x,y,other.x,other.y)
			speed = _speed
			auto_collect = true;
		}
	}
}

function item_CollectItemsByType(_type,_player = 0,_speed = 4,_subimg = 0) {
	/// @function item_CollectAllItems()
	/// @description Makes all instances of a specific fly towards the player.
	/// @param {real} _type The type of item to collect. Must be a sprite.
	/// @param {real} _player (OPTIONAL) The player where to send the items to.
	/// @param {real} _speed (OPTIONAL) The speed at which the items will fly.
	/// @param {real} _subimg (OPTIONAL) The subimage of the sprite to use, if not animated.
	
	if play_id == _player {
		with(obj_item) {
			if sprite_index == _type and image_index == _subimg {
				direction = point_direction(x_pos,y_pos,other.x_pos,other.y_pos)
				speed = _speed
			}
		}
	}
}

function item_CollectItemsInCircle(_x,_y,_radius,_player = 0,_speed = 4) {
	/// @function item_CollectAllItems()
	/// @description Makes all items in a specified circular range fly towards the player.
	/// @param {real} _x The x coordinate for the range.
	/// @param {real} _y The y coordinate for the range.
	/// @param {real} _radius The circular range to collect the items.
	/// @param {real} _player (OPTIONAL) The player where to send the items to.
	/// @param {real} _speed (OPTIONAL) The speed at which the items will fly.
	
	if play_id == _player {
		with(obj_item) {
			if collision_circle(_x,_y,_radius,obj_player,true,false) {
				direction = point_direction(x_pos,y_pos,other.x_pos,other.y_pos)
				speed = _speed
			}
		}
	}
}

function item_CancelCollectItems(_player = 0) {
	/// @function item_CancelCollectItems()
	/// @description Stops all items from flying toward the player.
	/// @param {real} _player (OPTIONAL) The player to pull the items away from.
	
	with(obj_item) {
		direction = 270;
		speed = 0.5;
	}
}