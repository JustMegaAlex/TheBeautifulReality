
event_inherited()

dialog_tree_default = {
    text: "Hi Robin",
    options: {
        "Hi Merry": "[end]",
    }
}

dialog_tree = dialog_tree_default

dialog_ask_autopsy_report = {
    text: [
        "What can I do you for, hireling?",
        "Kimberly's cause of death has been tampered with, I need the autopsy report. Can you get it for me? ",
        "Oh yea sure, let me think about it. ",
        "Okay I'll pop by later-",
        "No.",
        "What do you mean 'no'? ",
        "I just thought about it. It's a no can do, sorry.",
        "Already?",
        "Mhm.",
        "What's in the file Merry? ",
        "Nothing. ",
        "Stop lying, I can see it with my very eyes!",
        "Okay you got me, I'll tell ya. ",
        "Really?",
    ],
    next: {
        id: id,
        text: "Na ha I'm just messin with ya. GET BACK TO FUCKING WORK!",
        options: {
            "back to work]": "[end]"
        },
        call: function() {
            id.dialog_tree = id.dialog_ask_autopsy_report2
        }
    }
}

dialog_ask_autopsy_report2 = {
    text: "Huh?",
    options: {
        "Read the autopsy report]": {
            id: id,
            text: "", options: {},
            _last_replica_used: undefined,
            call: function() {
                var text = choose(
                    "Nuh uh uh. For my eyes only!",
                    "Quit it.",
                    "It ain't fuckin' happening.",
                    "Shouldn't you be WORKING?",
                )
                while _last_replica_used == text {
                    text = choose(
                        "Nuh uh uh. For my eyes only!",
                        "Quit it.",
                        "It ain't fuckin' happening.",
                        "Shouldn't you be WORKING?",
                    )
                }
                _last_replica_used = text
                id.dialog_ask_autopsy_report2.text = text
                id.startDialog(id.dialog_ask_autopsy_report2)
            }
        },
        "Go back to work]": {
            id: id,
            text: "[end]",
            options: {},
            call: function() {
                id.dialog_ask_autopsy_report2.text = "Huh?"
            }
        }
    }
}

dialog_autopsy_report = {
	text: "zzzzzzZZZZZZ",
    options: {
        "Looks like all that yapping got to him. Now’s my chance to get that report.] " : {
            text: "",
            options: {
                "That’s it! Kimberly’s autopsy report.]": "[end]"
            },
            call: function() {
                var text = ReadFileString("autopsy.txt")
                oPDA.setText(text)
                oPDA.setCloseCallback(function() {
                    oRobinReplicas.startDialog(oRobinReplicas.dialog_autopsy_report)
                })
            }
        }
    },
    event: NarrativeEvents.obtained_missing_death_report
}

function setDialogMissingReport() {
    dialog_tree = dialog_ask_autopsy_report
}

function getDialog() {
    // temp condition to trigger autopsy dialog
    if oWorkController.processed >= 7 {
        return dialog_autopsy_report
    }
	return dialog_tree
}

setActive(false)
