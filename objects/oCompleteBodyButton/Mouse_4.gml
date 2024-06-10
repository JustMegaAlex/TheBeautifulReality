
if instance_exists(oBody){
	if (oBody.body_state == PBodyState.ship){
		oBody.moveToOutConveyor()
		with oInventoryItem {
			if !is_inventory and place_meeting(x, y, oTable) {
                moveToOutConveyor()
            }
		}
		var gain = audio_sound_get_gain(sfxConveyerActive)
        audio_play_sound(sfxConveyerActive, 3, false)
		oWorkController.processed++
	}
}

