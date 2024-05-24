function PrintBodyState() {
    var returnstring = "NO BODY"

    if instance_exists(oBody) {
        returnstring = "Body State: " + string(oBody.body_state)
    }

    return returnstring
}

//// Shortcuts to set and get instance variables
function Get(inst, variable) {
    return variable_instance_get(inst, variable)
}

function Set(inst, variable, value) {
    return variable_instance_set(inst, variable, value)
}
////

function AddEvent(event) {
    oGameState.addEventHappened(event)
    oGameStateUpdater.update()
}

function Pills(amount) {
    global.pills_taken = amount
}

function Bodies(amount) {
    global.processed_body_count = amount
}

function DebugSetGameState() {
    AddEvent(NarrativeEvents.showed_photo_to_sharon)
    Pills(2)
    Bodies(1)
}
