
event_inherited()

dialog_tree_default = {
    text: "Hi Robin",
    options: {
        "Hi Merry": "[end]",
    }
}

dialog_tree = dialog_tree_default

dialog_missing_death_reason = {
    text: "",
    options: {
        "Hey, Merry, one of today's bodies reports has a 'missing' death reason": {
            text: "So what?",
            options: {
                "Can I have a look on autopsy report?": {
                    text: "These files are for certified personnel only",
                    options: {
                        "Go back to work]" : "[end]"
                    }
                }
            }
        }
    },
    call: function() {
        if global.pills_taken == 2 and global.processed_body_count == 1 {
            text = "zzzzzzZZZZZZ"
            options = {
                "Read the autopsy report" : {
                    text: "[The report says the death reason\nis 'overdosing from Somnium Amphetamines']",
                    options: {
                        "Somnium Amphetamines...?": "[end]"
                    }
                }
            }
        }
    }
}

function setDialogMissingReport() {
    dialog_tree = dialog_missing_death_reason
}

setActive(false)