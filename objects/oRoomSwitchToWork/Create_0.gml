event_inherited()

hint_text = "Go to bed"

function switchRoom() {
    // not leaving to work today
    if oGameState.checkEventHappened(NarrativeEvents.end_game_triggered) {
        oRobinReplicas.startDialog(oRobinReplicas.dialog_endgame_not_leaving)
        return
    }
    if oGameState.checkEventHappened(NarrativeEvents.finished_last_clue)
            and global.pills_taken == 0 {
        target_room = room
        oGameState.addEventHappened(NarrativeEvents.end_game_triggered)
    }
	if global.pills_taken == undefined {
        oMeds.startDialog()
		return
	}
    transition_struct = new transition(true)
}

function onTransitionEnd() {
    if oGameState.checkEventHappened(NarrativeEvents.end_game_triggered) {
        oRobinReplicas.startDialog(oRobinReplicas.dialog_endgame_enter_bedroom)
    }
}

// instead of visible=false which turns off all drawing
// explaining: we need drawing of fading and we need
// sprite for collision
image_alpha = 0
