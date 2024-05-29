/*
Controls the game behaviour and triggers different objects to appear
based on different circumstances like happened events (see oGameState) or current room.
*/

EnsureSingleton()

function check(_room, events, exclude_events) {
	if room != _room {
		return false
	}
	for (var i = 0; i < array_length(events); ++i) {
		if !oGameState.checkEventHappened(events[i]) {
			return false
		}
	}
	for (var i = 0; i < array_length(exclude_events); ++i) {
		if oGameState.checkEventHappened(exclude_events[i]) {
			return false
		}
	}
	return true
}

function initMitchelItems() {
    instance_destroy(oInventoryItem)
    var xx = oConveyerBelt.bbox_right, yy = oConveyerBelt.y
    var journal = instance_create_layer(xx, yy, "Instances", oInventoryItem)
    journal.sprite_index = sKanBan
    var note = instance_create_layer(xx + 20, yy + 20, "Instances", oInventoryItem)
    note.sprite_index = sStickerNote
}

function update() {
	if check(rmWork, [NarrativeEvents.bart_treat_talk], [NarrativeEvents.bart_gave_treat]) {
		instance_create_layer(0, oConveyerBelt.y, "Instances", oDogTreat)
	}
	if check(rmWork, [NarrativeEvents.bart_gave_treat], [NarrativeEvents.drawer_key_taken]) {
		oDrawerKey.setActive(true); oDrawerKeyNote.setActive(true)
	}
	if check(rmWork, [NarrativeEvents.showed_photo_to_sharon], [NarrativeEvents.obtained_missing_death_report]) {
		oMerry.setDialogMissingReport()
        oBody.setInfoDeathMissingReason()
        oPDA.setOpenCallback(function() {
            oRobinReplicas.startDialog(oRobinReplicas.dialog_missing_death_reason)
        })
	}
	if check(rmWork, [NarrativeEvents.finished_clue_2], [NarrativeEvents.found_mitchels_jounal]) {
        oBody.setInfoMitchel()
        oPDA.setOpenCallback(function() {
            oRobinReplicas.startDialog(oRobinReplicas.dialog_mitchel_death_reason)
        })
        initMitchelItems()
	}
}
