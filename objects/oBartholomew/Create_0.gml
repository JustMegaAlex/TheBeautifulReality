event_inherited()


dialog_tree = {
    text: "zzZZZ",
    options: {
        "How’s your day been? ": "zzZZZ",
        "Enjoying your nap? ": "zzZZZ",
        "Wanna go for a walk?": "zzZZZ",
        "Do you want a treat? ": {
            text: "Woof! *pants*",
            options: {
                "Ah, now that got your attention ay boy?]": "[end]"
            },
            call: function() {
                oGameState.addEventHappened(NarrativeEvents.bart_treat_talk)
            }
        }
    }
}
