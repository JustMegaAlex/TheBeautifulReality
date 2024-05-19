enum NarrativeEvents {
    bart_treat_talk,
    bart_gave_treat,
}

EnsureSingleton()

function addEventToHappenNextDay(event) {
    if checkEventHappenNextDay(event) {
        show_debug_message_ext("Event has already happened {0}", [event])
        return
    }
    array_push(next_day_events, event)
}

function addEventHappened(event) {
    show_debug_message_ext("Add event {0}", [event])
    if checkEventHappened(event) {
        show_debug_message_ext("Event is already going happen {0}", [event])
        return
    }
    array_push(happened_events, event)
}

function checkEventHappenNextDay(event) {
    return array_contains(next_day_events, event)
}

function checkEventHappened(event) {
    return array_contains(happened_events, event)
}

// check both checkEventHappenNextDay and checkEventHappened
function checkEvent(event) {
    return checkEventHappened(event) or checkEventHappenNextDay(event)
}

function triggerNextDay() {
    ArrayExpand(happened_events, next_day_events)
    next_day_events = []
}

next_day_events = []
happened_events = []
