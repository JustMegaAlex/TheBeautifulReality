if instance_exists(oBody) {
    if oBody.body_state = PBodyState.conveyer {
        image_speed = 1
		if !audio_is_playing(sfxConveyerActive)
			sfx_play(sfxConveyerActive, 1)
    }
}
else {
    image_speed = 0
}
