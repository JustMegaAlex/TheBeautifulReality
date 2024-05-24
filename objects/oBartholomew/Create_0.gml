event_inherited()


dialog_tree = {
    text: "zzZZZ",
    options: {
        "How’s your day been? ": "zzZZZ",
        "Enjoying your nap? ": "zzZZZ",
        "Wanna go for a walk?": "zzZZZ",
        "Do you want a treat?": {
            text: "Woof! *pants*",
            options: {
                "Ah, now that got your attention ay boy?]": "[end]"
            },
            event: NarrativeEvents.bart_treat_talk
        },
    },
    call: function() {
        // remove dog treat dialog after getting a treat
        if oGameState.checkEventHappened(NarrativeEvents.bart_gave_treat) {
            variable_struct_remove(self.options, "Do you want a treat?")
        }
    }
}

dialogTreat = {
	text: "Woof! *waving with his tail impatiently*",
	options: {
		"Do you want it?" : {
			text: "Woof!",
			options: {
				"Catch!": {
					text:  "Woof! *catches the treat",
					options: {
						"Haha, good boy!": "[end]"	
					}
				}
			}
		}
	},
	event: NarrativeEvents.bart_gave_treat
}

function interact(item) {
    if item.object_index == oDogTreat {
        startDialog(dialogTreat)
    }
    instance_destroy(item)
}
