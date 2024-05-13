
event_inherited()

dialog_cakes = {
    id: id,
    text: "Cakes are awesome! I ate 8 already!",
    options: {
        "That's a lot!": "Yes!",
        "Don't you feel sick?": "No!",
        "See you later": "[end]"
    },
    call: function() {
        id.dialog_tree = id.dialog_cakes
        oGameState.addEventHappened(NarrativeEvents.first_talk)
        if oGameState.checkEventHappened(NarrativeEvents.cake_canban) {
            self.options[$ "Man, you only eat cakes"] = 
                    id.dialog_reliable_eater
        }
    }
}

dialog_kanban = {
    text: "Oh, look, what is this?",
    options: {
        "Not sure, but there is a cake on it": {
            text: "Hmmm... Are you sure it's not a pie?",
            options: {
                "Uhhh... is there a real difference?": {
                    text: "Of course! There is a huge difference!\nWhat are you even talking about?\nHave you lost your mind??",
                    options: {
                        "Oh. Ok": "[end]"
                    }
                }
            }
        }
    }
}

dialog_reliable_eater = {
    text: "So what? It's not that bad, 'cause cakes are awesome!",
    options: {
        "What are you going to do with your future?": {
            text: "Well. Actually I was thinking about it.\nI want to become a reliable cake eater!\nThat will the best job ever!",
            options: {
                "Thaaat's... ambitious": "[end]"
            }
        }
    }
}

dialog_tree = {
    text: "Hello!",
    options: {
        "Hi": "[end]",
        "Hi!": dialog_cakes,
    }
}
