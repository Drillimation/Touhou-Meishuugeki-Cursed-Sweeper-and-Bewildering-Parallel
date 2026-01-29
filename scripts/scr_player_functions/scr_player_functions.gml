function player_GetPlayerObjectID(_player = 0) {
	/// @function player_GetPlayerObjectID(_player)
	/// @description Returns the instance ID of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the ID from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return instance_index[i]
		}
	}
}

function player_SetPlayerSpeed(_normal,_focus,_player = 0) {
	/// @function player_SetPlayerSpeed(_normal,_focus,_player)
	/// @description Sets the normal and focus speed of the given player.
	/// @param {real} _normal The normal speed of the player to set.
	/// @param {real} _focus The focus speed of the player to set.
	/// @param {real} _player (OPTIONAL) The player to set the speeds.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			instance_index[i].normal_speed = _normal;
			instance_index[i].focus_speed = _focus;
		}
	}
}

function player_SetPlayerClip(_x1,_y1,_x2,_y2,_player = 0) {
	/// @function player_SetPlayerClip(_x1,_y1,_x2,_y2,_player)
	/// @description Sets the area where the given player to move.
	/// @param {real} _x1 The leftmost coordinate the player can move to.
	/// @param {real} _y1 The topmost coordinate the player can move to.
	/// @param {real} _x2 The rightmost coordinate the player can move to.
	/// @param {real} _y2 The bottommost coordinate the player can move to.
	/// @param {real} _player (OPTIONAL) The player to set the area to.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			instance_index[i].clip_x1 = _x1;
			instance_index[i].clip_x2 = _x2;
			instance_index[i].clip_y1 = _y1;
			instance_index[i].clip_y2 = _y2;
		}
	}
}

function player_SetPlayerLife(_value,_player = 0,_relative = false) {
	/// @function player_SetPlayerLife(_value,_player)
	/// @description Sets the number of lives for the given player as an integer.
	/// @param {real} _value The lives of the player to set.
	/// @param {real} _player (OPTIONAL) The player to set the lives to.
	/// @param {real) _relative (OPTIONAL) Set whether or not to add or subtract the lives.
	
	if _relative == false {
		global.player_stats[_player].cur_lives = floor(_value);
	}
	else {
		global.player_stats[_player].cur_lives += _value;
		global.player_stats[_player].cur_lives = clamp(global.player_stats[_player].cur_lives,0,99);
	}
}

function player_SetPlayerHealth(_value,_player = 0,_relative = false) {
	/// @function player_SetPlayerHealth(_value,_player)
	/// @description Sets the amount of health for the given player as an integer.
	/// @param {real} _value The health of the player to set.
	/// @param {real} _player (OPTIONAL) The player to set the health to.
	/// @param {real) _relative (OPTIONAL) Set whether or not to add or subtract the health.
	
	if _relative == false {
		global.player_stats[_player].cur_health = floor(_value);
		global.player_stats[_player].cur_health = clamp(global.player_stats[_player].cur_health,0,global.main_stats.max_health);
	}
	else {
		global.player_stats[_player].cur_health += floor(_value);
		global.player_stats[_player].cur_health = clamp(global.player_stats[_player].cur_health,0,global.main_stats.max_health);
	}
}

function player_SetPlayerSpell(_value,_player = 0,_relative = false) {
	/// @function player_SetPlayerSpell(_value,_player)
	/// @description Sets the number of spell cards (bombs) for the given player as an integer.
	/// @param {real} _value The bombs of the player to set.
	/// @param {real} _player (OPTIONAL) The player to set the lives to.
	/// @param {real) _relative (OPTIONAL) Set whether or not to add or subtract the bombs.
	
	if _relative == false {
		global.player_stats[_player].cur_bombs = _value;
	}
	else {
		global.player_stats[_player].cur_bombs += _value;
		global.player_stats[_player].cur_bombs = clamp(global.player_stats[_player].cur_bombs,0,99);
	}
}

function player_SetPlayerPower(_value,_player = 0,_relative = false) {
	/// @function player_SetPlayerPower(_value,_player)
	/// @description Sets the shot power for the given player as an integer.
	/// @param {real} _value The shot power of the player to set.
	/// @param {real} _player (OPTIONAL) The player to set the shot power to.
	/// @param {real) _relative (OPTIONAL) Set whether or not to add or subtract the power.
	
	if _relative == false {
		global.player_stats[_player].power_items = _value;
		global.player_stats[_player].power_items = clamp(global.player_stats[_player].power_items,0,100);
	}
	else {
		global.player_stats[_player].power_items += _value;
		global.player_stats[_player].power_items = clamp(global.player_stats[_player].power_items,0,100);
	}
}

function player_SetPlayerInvincibilityFrame(_invultime,_player = 0) {
	/// @function player_SetPlayerInvincibilityFrame(_invultime,_player)
	/// @description Sets the amount of time the given player will be invulnerable to danmaku.
	/// @param {real} _invultime The invincibility time of the player to set.
	/// @param {real} _player (OPTIONAL) The player to set the invincibility time to.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			instance_index[i].invultime = _invultime;
		}
	}
}

function player_SetPlayerDownStateFrame(_respawntime,_player = 0) {
	/// @function player_SetPlayerDownStateFrame(_respawntime,_player)
	/// @description Sets the amount of time the given player must wait after death before respawning.
	/// @param {real} _respawntime The respawn time of the player to set.
	/// @param {real} _player (OPTIONAL) The player to set the respawn time to.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			instance_index[i].respawn_time = _respawntime;
		}
	}
}

function player_SetPlayerDeathbombFrame(_deathbombtime,_player = 0) {
	/// @function player_SetPlayerDeathbombFrame(_deathbombtime,_player)
	/// @description Sets the amount of time the given player can deathbomb after a hit that results in the loss of a life.
	/// @param {real} _deathbombtime The deathbomb time time of the player to set.
	/// @param {real} _player (OPTIONAL) The player to set the deathbomb time to.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			instance_index[i].deathbomb_time = _deathbombtime;
		}
	}
}

function player_SetPlayerAutoItemCollectLine(_y,_player = 0) {
	/// @function player_SetPlayerAutoItemCollectLine(_y,_player)
	/// @description Sets the y coordinate the given player must be to autocollect all items on-screen.
	/// @param {real} _y The y coordinate to set.
	/// @param {real} _player (OPTIONAL) The player to set the y coordinate requirement to.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			instance_index[i].itemcollectline = _y;
		}
	}
}

function player_SetForbidPlayerShot(_forbid,_player = 0) {
	/// @function player_SetForbidPlayerShot(_forbid,_player)
	/// @description Sets whether or not the given player can shoot normal danmaku.
	/// @param {bool} _forbid The shooting ability of the player to set.
	/// @param {real} _player (OPTIONAL) The player to set the shooting ability to.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			instance_index[i].can_shoot = _forbid;
		}
	}
}

function player_SetForbidPlayerSpell(_forbid,_player = 0) {
	/// @function player_SetForbidPlayerSpell(_forbid,_player)
	/// @description Sets whether or not the given player can use spell cards (bombs).
	/// @param {bool} _forbid The bombing ability of the player to set.
	/// @param {real} _player (OPTIONAL) The player to set the bombing ability to.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			instance_index[i].can_bomb = _forbid;
		}
	}
}

function player_GetPlayerX(_player = 0) {
	/// @function player_GetPlayerX(_player)
	/// @description Gets the x coordinate of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the x coordinate from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return instance_index[i].x_pos;
		}
	}
}

function player_GetPlayerY(_player = 0) {
	/// @function player_GetPlayerY(_player)
	/// @description Gets the y coordinate of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the y coordinate from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return instance_index[i].y_pos;
		}
	}
}

function player_GetPlayerState(_player = 0) {
	/// @function player_GetPlayerState(_player)
	/// @description Gets the current status of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the current status from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return instance_index[i].player_state;
		}
	}
}

function player_GetPlayerSpeed(_player = 0) {
	/// @function player_GetPlayerSpeed(_player)
	/// @description Gets both the normal and focused speeds of the given player as an array.
	/// @param {real} _player (OPTIONAL) The player to get the speeds from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return [instance_index[i].normal_speed,instance_index[i].focus_speed];
		}
	}
}

function player_GetPlayerClip(_player = 0) {
	/// @function player_GetPlayerClip(_player)
	/// @description Gets the area where the given player can move as an array.
	/// @param {real} _player (OPTIONAL) The player to get move area from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return [instance_index[i].clip_x1,instance_index[i].clip_x2,instance_index[i].clip_y1,instance_index[i].clip_y2];
		}
	}
}

function player_GetPlayerLife(_player = 0) {
	/// @function player_GetPlayerLife(_player)
	/// @description Gets the current number of lives of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the move area from.
	
	return global.player_stats[_player].cur_lives
}

function player_GetPlayerHealth(_player = 0) {
	/// @function player_GetPlayerHealth(_player)
	/// @description Gets the current amount of health of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the health from.
	
	return global.player_stats[_player].cur_health
}

function player_GetPlayerSpell(_player = 0) {
	/// @function player_GetPlayerSpell(_player)
	/// @description Gets the current number of spell cards (bombs) of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the bombs from.
	
	return global.player_stats[_player].cur_bombs
}

function player_GetPlayerPower(_player = 0) {
	/// @function player_GetPlayerPower(_player)
	/// @description Gets the current shot power of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the shot power from.
	
	return global.player_stats[_player].power_items
}

function player_GetPlayerInvincibilityFrame(_player = 0) {
	/// @function player_GetPlayerInvincibilityFrame(_player)
	/// @description Gets the current time for the invincibility period of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the invincibility period from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return instance_index[i].invultime;
		}
	}
}

function player_GetPlayerDownStateFrame(_player = 0) {
	/// @function player_GetPlayerDownStateFrame(_player)
	/// @description Gets the current time for the respawn period of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the respawn period from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return instance_index[i].respawn_time;
		}
	}
}

function player_GetPlayerRebirthFrame(_player = 0) {
	/// @function player_GetPlayerRebirthFrame(_player)
	/// @description Gets the current time for the deathbomb period of the given player.
	/// @param {real} _player (OPTIONAL) The player to get the deathbomb period from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return instance_index[i].deathbomb_time;
		}
	}
}

function player_GetAngleToPlayer(_obj,_player = 0) {
	/// @function player_GetAngleToPlayer(_obj)
	/// @description Gets the angle between the given object and player's coordinates.
	/// @param {index} _obj (OPTIONAL) The object to get the coordinates from.
	/// @param {real} _player (OPTIONAL) The player to get the coordinates from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return point_direction(_obj.x,_obj.y,instance_index[i].x,instance_index[i].y);
		}
	}
}

function player_IsPermitPlayerShot(_player = 0) {
	/// @function player_IsPermitPlayerShot(_player)
	/// @description Determines whether or not the given player can shoot. Returns true if so, false if not.
	/// @param {real} _player (OPTIONAL) The player to get the shoot ability from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			if instance_index[i].can_shoot == true {
				return true
			}
			else {
				return false
			}
		}
	}
}

function player_IsPermitPlayerSpell(_player = 0) {
	/// @function player_IsPermitPlayerSpell(_player)
	/// @description Determines whether or not the given player can bomb. Returns true if so, false if not.
	/// @param {real} _player (OPTIONAL) The player to get the bomb ability from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			if instance_index[i].can_bomb == true {
				return true
			}
			else {
				return false
			}
		}
	}
}

function player_IsPlayerSpellActive(_player = 0) {
	/// @function player_IsPlayerSpellActive(_player)
	/// @description Determines whether or not the given player is using a spell card (bomb). Returns true if so, false if not.
	/// @param {real} _player (OPTIONAL) The player to get the spell card from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_spell_card_player); i++) {
		instance_index[i] = instance_find(obj_spell_card_player,i);
		if instance_index[i].play_id == _player {
			return true
		}
		else {
			return false
		}
	}
}

function player_GetPlayerID(_player = 0) {
	/// @function player_GetPlayerID(_player)
	/// @description Returns the ID of the given player instance.
	/// @param {real} _player (OPTIONAL) The player to get the ID from.
	
	var instance_index = [];
	for(var i = 0; i < instance_number(obj_player); i++) {
		instance_index[i] = instance_find(obj_player,i);
		if instance_index[i].play_id == _player {
			return instance_index[i].id
		}
	}
}

function player_GetPlayerReplayName() {
	/// @function player_GetPlayerReplayName()
	/// @description Returns the seed of the current replay.
	
	return global.main_stats.random_seed
}