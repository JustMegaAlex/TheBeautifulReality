
dialog_x = room_width * 0.5
dialog_y = room_height * 0.7
row_height = 20

dialog_cakes = {
	id: id,
	text: "Cakes are awesome! I ate 8 already!",
	options: {
		"That's a lot!": "Yes!",
		"Don't you feel sick?": "No!",
	},
	call: function() {
		id.dialog_tree = id.dialog_cakes
	}
}

dialog_tree = {
	text: "Hello!",
	options: {
		"Hi": "[end]",
		"Hi!": dialog_cakes,
	}
}

is_active = false
current_dialog = dialog_tree
current_replica = "Default replica"
current_options = []

function startDialog() {
	is_active = true
	current_dialog = dialog_tree
	current_replica = current_dialog.text
	current_options_struct = current_dialog.options
	current_options = get_keys(current_options_struct)
}

function chooseOption(option) {
	if option == "end dialog" {
		is_active = false
		return
	}
	current_dialog = current_options_struct[$ option]
	if current_dialog == "[end]" {
		current_options = ["end dialog"]
		return
	} else if is_string(current_dialog) {
		current_replica = current_dialog	
		current_options = ["end dialog"]
		return
	}
	current_replica = current_dialog.text
	current_options_struct = current_dialog.options
	current_options = get_keys(current_options_struct)
	var call = get(current_dialog, "call")
	if call != undefined { call() }
}

function get(struct, key) {
	if !variable_struct_exists(struct, key)
		return undefined
	return variable_struct_get(struct, key)
}

function get_keys(struct) {
	return struct_get_names(struct)
}

function get_first(struct) {
	return get_keys(struct)[0]
}
