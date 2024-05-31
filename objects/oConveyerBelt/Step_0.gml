if instance_exists(oBody) {
    if oBody.body_state = PBodyState.conveyer {
        image_speed = 1
		if !audio_is_playing(sfxConveyerActive)
		sfx_play(sfxConveyerActive, 1)
    }
    else {
		if audio_is_playing(sfxConveyerActive)
		audio_stop_sound(sfxConveyerActive)	
        image_speed = 0
    }
}
else {
    image_speed = 0
}
