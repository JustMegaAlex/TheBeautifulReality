event_inherited()

hint_text = "Go to bed"

function switchRoom() {
	if global.pills_taken == undefined {
        oMeds.startDialog()
		return
	}
    is_switching_room = true
}

visible = false
