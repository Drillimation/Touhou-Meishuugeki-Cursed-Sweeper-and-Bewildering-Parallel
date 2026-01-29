function scr_json_load_file(_file) {
	var _buffer = buffer_load(_file);
	var _string = buffer_read(_buffer,buffer_string);
	buffer_delete(_buffer);
	var _load_data = json_parse(_string);
	return _load_data
}

function scr_json_save_file(_variable,_file) {
	var _string = json_stringify(_variable);
	var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
	buffer_write(_buffer,buffer_string,_string);
	buffer_save(_buffer,_file);
	buffer_delete(_buffer);
}