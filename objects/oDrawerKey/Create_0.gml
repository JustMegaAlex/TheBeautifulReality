
event_inherited()

can_be_processed = false

function onInventoryDrop() {
    oGameState.addEventHappened(NarrativeEvents.drawer_key_taken)
    oRobinReplicas.startDialog(oRobinReplicas.dialog_drawer_key)
}
