if is_dialog_running {
    text_length += 2
    if oInput.key_any {
        var option_ind = keyboard_key - 49
        if option_ind >= 0 && option_ind < array_length(current_options) {
            chooseOption(current_options[option_ind])
			sfx_play(sfxDialogueSelect, 1)
        }
    }
} else if is_active {
    image_alpha = 0.8
    if collision_point(mouse_x, mouse_y, id, false, false) {
        image_alpha = 1
    }
    if mouseClickedOnMe() {
        intro_timer.reset()
        image_alpha = 1
        startDialog()
    }
}
