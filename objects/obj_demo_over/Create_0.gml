count = 0;
var _load_data = scr_json_load_file("main/demo_over" + string(global.suf) + ".json");
header_notice = _load_data.header_notice;
header_message = _load_data.header_message;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}