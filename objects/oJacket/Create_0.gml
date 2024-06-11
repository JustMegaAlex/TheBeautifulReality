event_inherited()

var scale = 0.5
image_xscale = scale
image_yscale = scale

dialog_triggered = false
function onInventoryDrop() {
    if dialog_triggered {
        return;
    }
	oGameState.addEventHappened(NarrativeEvents.found_mitchels_jacket)
    oRobinReplicas.startDialog(oRobinReplicas.dialog_mitchel_jacket)
    dialog_triggered = true
}
