
event_inherited()

dialog_tree_default = {
    text: "Hi Robin",
    options: {
        "Hi Merry": "[end]",
    }
}

dialog_tree = dialog_tree_default

dialog_missing_death_reason = {
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
        text: "Na ha I'm just messin with ya. GET BACK TO FUCKING WORK!",
        options: {
            "back to work]": "[end]"
        }
    }
}

dialog_autopsy_report = {
	text: "zzzzzzZZZZZZ",
    options: {
        "Read the autopsy report" : {
            text: "[The report says the death reason\nis 'overdosing from Somnium Amphetamines']",
            options: {
                "Somnium Amphetamines...?": "[end]"
            }
        }
    },
    event: NarrativeEvents.obtained_missing_death_report
}

function setDialogMissingReport() {
    dialog_tree = dialog_missing_death_reason
}

function getDialog() {
    // temp condition to trigger autopsy dialog
    if global.pills_taken == 2 and global.processed_body_count == 1 {
        return dialog_autopsy_report
    }
	return dialog_tree
}

setActive(false)
