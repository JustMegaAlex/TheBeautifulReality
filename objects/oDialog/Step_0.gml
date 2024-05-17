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


if is_active {	//Whatever visuals need to happen during dialogue
	image_alpha = 1
} else {		//Inactive state
	image_alpha = 0.6
	
	//Mouse hover
	if collision_point(mouse_x, mouse_y, id, false, false) {
		image_alpha = 1
	}
	
}

#endregion
