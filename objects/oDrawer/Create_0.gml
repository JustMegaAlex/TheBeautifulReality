event_inherited()

layer = layer_get_id("Inventory")

function startDialog() {
    oRobinReplicas.startDialog(oRobinReplicas.dialog_drawer)
}

function drawerOpen() {
    image_index = 1
    oFamilyPhoto.setActive(true)
    oRobinReplicas.startDialog(oRobinReplicas.dialog_drawer_opened)
}

function interact(item) {
    if item.object_index == oDrawerKey {
        drawerOpen()
        instance_destroy(item)
        oGameState.addEventHappened(NarrativeEvents.drawer_key_taken)
    }
}
