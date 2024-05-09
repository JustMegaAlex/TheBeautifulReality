
if is_active {
	if oInput.key_any {
		var option_ind = keyboard_key - 49
		if option_ind >= 0 && option_ind < array_length(current_options) {
			chooseOption(current_options[option_ind])
		}
	}
} else {
	if mouseClickedOnMe() {
		startDialog()
	}
}
