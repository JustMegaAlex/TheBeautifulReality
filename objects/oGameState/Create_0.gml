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
    bart_treat_talk,
    bart_gave_treat,
    drawer_key_taken,
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

happened_events = []
