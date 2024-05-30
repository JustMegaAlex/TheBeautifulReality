event_inherited()

hint_text = "Go to bed"

function switchRoom() {
    if oGameState.checkEventHappened(NarrativeEvents.finished_last_clue)
            and global.pills_taken == 0 {
        target_room = room
    }
	if global.pills_taken == undefined {
        oMeds.startDialog()
		return
	}
    is_switching_room = true
}

visible = false
