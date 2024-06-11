
event_inherited()

greeting_replicas = [
    "Hey there, hireling! Rise and grind, it's another glorious day in the cellar! I hope you're ready to sort and arrange with precision. Remember, the early bird gets the worm—or in our case, the coldest customers. Now, quit screwing around and get to work! ",
    "Good morning hireling! Welcome to another exciting day in the land of the living dead. Ready to work your magic on today's arrivals? Let's make sure they leave looking better than they did in real life. Time to get to it!",
    "Good to see you, hireling! Hope you had a restful night because we've got a busy day ahead. Let's get those bodies processed and pristine. And don't fuck it up!",
    "My favourite mortician! Ready for another day of meticulous item arranging? Remember, those who fail to adhere to our standards tend to...vanish into thin air. Let's ensure we stay on the right path, shall we?",
    "Rise and shine, hireling! Time to roll up those sleeves and give the departed the send-off they deserve. We've got a lot of work ahead, so don't waste a single second. Ready, set, mortify!",
    "Morning, hireling! Another day, another inventory to sort. Keep up the good work, least you wanna join the ranks of those who've...underperformed... ugh. Chop chop! ",
    "The hireling returns! Another chance to keep these goddamn inventories in order. Let's make sure we stay on top of things, shall we? We wouldn't want any... unfortunate accidents to occur.",
]
current_greeting_replica_id = 0


#region read mitchel's stuff dialog
opt_read_mitchel_journal = {
    text: "[end]",
    options: undefined,
    call: function() {
        oPDA.setText(ReadFileString("mitchel_journal.txt"))
        oRobinReplicas.startDialog(oRobinReplicas.dialog_mitchel_journal)
        oGameState.addEventHappened(NarrativeEvents.read_mitchels_journal)
    }
}
opt_read_mitchel_notes = {
    text: "[end]",
    options: undefined,
    call: function() {
        oPDA.setText(ReadFileString("mitchel_notes.txt"))
        oRobinReplicas.startDialog(oRobinReplicas.dialog_mitchel_notes)
    }
}
options_mitchel = {
    "Read Mitchel's jounal]": opt_read_mitchel_journal,
    "Read Mitchel's notes]": opt_read_mitchel_notes
}
opt_read_mitchel_journal.options = options_mitchel
opt_read_mitchel_notes.options = options_mitchel
#endregion

dialog_tree_default = {
    id: id,
    text: greeting_replicas[0],
    options: {
        "Hi Merry": "[end]",
    },
    call: function() {
        id.current_greeting_replica_id = (id.current_greeting_replica_id + 1) 
                                          mod (array_length(id.greeting_replicas) - 1)
        text = id.greeting_replicas[id.current_greeting_replica_id]
        if oGameState.checkEventHappened(NarrativeEvents.found_mitchels_jacket) {
            options = id.options_mitchel
        }
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
        "Looks like all that yapping got to him. Now's my chance to get that report.] " : {
            text: "",
            options: {
                "That's it! Kimberly's autopsy report.]": "[end]"
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
