xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
x_pos = clamp(x_pos,clip_x1,clip_x2);
y_pos = clamp(y_pos,clip_y1,clip_y2);

x = xview + x_pos;
y = yview + y_pos;

//Movement
if global.replay_mode = false {
	scr_get_input(play_id);
}
else {
	scr_replay_input(play_id);
}

script_execute(state);

//Button Commands
///Shoot
if (action_shoot) and can_shoot == true {
	shoot_sequence();
}
else {
	reload = 0;
}

///Focus
if (action_focus) {
	spd = focus_speed;
	turret_pos += 3;
	turret_pos = clamp(turret_pos,0,60);
}
else {
	spd = normal_speed;
	turret_pos -= 3;
	turret_pos = clamp(turret_pos,0,60);
}

///Bombing
if (action_bomb) and can_bomb == true {
	if global.player_stats[play_id].cur_bombs >= 1 and global.player_stats[play_id].power_items >= 10 and !instance_exists(obj_spell_card_player) and !instance_exists(obj_cutscene_textbox) {
		player_SetPlayerInvincibilityFrame(300,play_id);
		player_SetPlayerPower(-10,play_id,true);
		if deathbomb_time >= 1 {
			player_SetPlayerLife(1,play_id,true);
			player_SetPlayerPower(22,play_id,true);
		}
		global.player_stats[play_id].bombs_used += 1;
		with(obj_spell_card_enemy) { captured = false; }
		bomb_sequence();
	}
	else {
		sound_ObjSound_Play(se_invalid);
	}
}
invultime--;
invultime = clamp(invultime,0,9999);
deathbomb_time--;
deathbomb_time = clamp(deathbomb_time,0,9999);

//Grazing
if collision_circle(x,y,16,obj_enemy_bullet,true,false) {
	var _list = ds_list_create();
	var _num = collision_circle_list(x,y,16,obj_enemy_bullet,true,false,_list,false);
	if _num >= 0 {
		for (var i = 0; i < _num; i++) {
			with(_list[|i]) {
				if grazable == true {
					sound_ObjSound_Play(se_graze);
					system_AddGraze(1,other.play_id);
					system_AddScore(50,other.play_id);
					grazable = false;
					global.main_stats.time_orbs += 1;
				}
			}
		}
	}
	ds_list_destroy(_list);
}

//Autocollecting items
if global.player_stats[play_id].power_items == 100 {
	if y_pos < itemcollectline {
		item_CollectAllItems(play_id)
	}
}

if collision_circle(x,y,16,obj_item,true,false) {
	var inst = instance_nearest(x,y,obj_item)
	with(inst) {
		direction = point_direction(x,y,other.x,other.y);
		speed = 2;
	}
}

//Regenerating Health
if count2 mod 300 == 0 {
	player_SetPlayerHealth(1,play_id,true);
	count2 = 0;
}
count2++;

//Pausing
if (action_pause) {
	var inst = instance_create_layer(0,0,"Effects",obj_pause);
	instance_activate_object(obj_pause);
	inst._id = play_id;
	with(inst) { event_perform(ev_other,ev_user0); }
}