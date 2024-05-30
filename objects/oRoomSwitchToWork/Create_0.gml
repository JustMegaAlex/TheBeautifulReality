event_inherited()

hint_text = "Go to bed"

function switchRoom() {
    if oGameState.checkEventHappened(NarrativeEvents.finished_last_clue)
            and global.pills_taken == 0 {
        target_room = room
        oGameState.addEventHappened(NarrativeEvents.end_game_triggered)
    }
	if global.pills_taken == undefined {
        oMeds.startDialog()
		return
	}
    is_switching_room = true
}

function onTransitionEnd() {
    if oGameState.checkEventHappened(NarrativeEvents.end_game_triggered) {
        oRobinReplicas.startDialog(oRobinReplicas.dialog_endgame_enter_bedroom)
    }
}

visible = false
