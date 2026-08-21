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

function scr_binary_save_file(_variable,_file) {
	var _string = json_stringify(_variable);
    var _bytes = string_byte_length(_string);
    var _temp_buffer = buffer_create(_bytes, buffer_fixed, 1);
    buffer_write(_temp_buffer, buffer_text, _string);
    var _compressed_buffer = buffer_compress(_temp_buffer, 0, _bytes);
    buffer_save(_compressed_buffer, _file);
    buffer_delete(_temp_buffer);
    buffer_delete(_compressed_buffer);
}

function scr_binary_load_file(_file) {
	var _compressed_buffer = buffer_load(_file);
    var _decompressed_buffer = buffer_decompress(_compressed_buffer);
    buffer_delete(_compressed_buffer);
    var _bytes = buffer_get_size(_decompressed_buffer);
    var _string = buffer_read(_decompressed_buffer, buffer_text);
    buffer_delete(_decompressed_buffer);
	var _load_data = json_parse(_string);
    return _load_data
}