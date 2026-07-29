scr_change_bgm("bgm/staff_roll.it")
var _buffer = buffer_load("main/staff_credits.txt");
var _string = buffer_read(_buffer,buffer_string);
buffer_delete(_buffer);

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

txt = _string;

crd_hgt = string_height_scribble_ext(txt,624)

vspeed = -0.5;