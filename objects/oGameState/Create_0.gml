/*
This is the game's event registry.
Game progress is defined by a sequence of events
that already have happened, e.g. gave-treat-to-the-dog event,
talked-to-sharon-about-vacation event, took-key-from-drawer event etc.
Event ids are defined in NarrativeEvents enum.
Mark events as happened using addEventHappened function.
Check if an event has happened using checkEventHappened function.

See oGameStateUpdater
*/

enum NarrativeEvents {
    // first clue
    bart_treat_talk,
    bart_gave_treat,
    drawer_key_taken,
    showed_photo_to_sharon, // 3

    // second clue
    obtained_missing_death_report,
    finished_clue_2,

    // the last clue
    found_mitchels_jounal, // 6
    
    
    asked_sharon_about_vacation,
}

EnsureSingleton()

function addEventHappened(event) {
    show_debug_message_ext("Add event {0}", [event])
    if checkEventHappened(event) {
        show_debug_message_ext("Event is already going happen {0}", [event])
        return
    }
    array_push(happened_events, event)
}

function checkEventHappened(event) {
    return array_contains(happened_events, event)
}

function checkState(happened, not_happened=[]) {
	for (var i = 0; i < array_length(happened); ++i) {
		if !oGameState.checkEventHappened(happened[i]) {
			return false
		}
	}
	for (var i = 0; i < array_length(not_happened); ++i) {
		if oGameState.checkEventHappened(not_happened[i]) {
			return false
		}
	}
	return true
}

happened_events = []
