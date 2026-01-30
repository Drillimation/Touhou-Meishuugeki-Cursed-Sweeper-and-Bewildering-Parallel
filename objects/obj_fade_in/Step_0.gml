if layer_sequence_exists("Fade",_sequence) and layer_sequence_is_finished(_sequence) != 0 {
	layer_sequence_destroy(_sequence);
	instance_destroy();
}