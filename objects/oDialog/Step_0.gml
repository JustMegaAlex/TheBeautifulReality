if is_active {
    if oInput.key_any {
        var option_ind = keyboard_key - 49
        if option_ind >= 0 && option_ind < array_length(current_options) {
            chooseOption(current_options[option_ind])
        }
    }
} else {
	image_alpha = 0.6
	if collision_point(mouse_x, mouse_y, id, false, false) {
		image_alpha = 1
	}
    if mouseClickedOnMe() {
		intro_timer.reset()
		image_alpha = 1
		startDialog()
    }
}
