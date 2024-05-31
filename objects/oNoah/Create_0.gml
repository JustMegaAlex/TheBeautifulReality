event_inherited()


dialog_tree = {
    id: id,
    text: "Daddy!",
    options: {
        "What have you been up to buddy? ": 
            "I found a cool bug in the backyard, wanna see? ",
        "Did you learn anything interesting at school? ":
            "We learned how to chop cabbages really fast, like ninja speed! If we want to have loads of stuff we need to work hard and beat the high score...I'm gonna beat it soon just wait. ",
        "Have you been looking after Mummy?":
            "Mummy is perfect all of the time. She doesn't need any help. ",
        "What do you want to be when you grow up?":
            "A reliable team player. Just like you dad!",
        "Ok, I gotta go": "[end]"
    },
    call: function() {
        // clue 2
        if oGameState.checkState([NarrativeEvents.showed_photo_to_sharon],
                                 [NarrativeEvents.obtained_missing_death_report]) {
            options[$ "What do you want to be when you grow up?"] = {
                text: "A reliable team player with attention to detail. Like you dad!",
                options: {
                    "Did his sentence just turn more...nevermind, I must be hearing things.]": 
                        id.dialog_tree
                }
            }
        }
    }
}

dialog_after_autopsy_report = {
    text: "...",
    options: {
        "What have you been up to buddy? ": 
            "...",
        "Did you learn anything interesting at school? ":
            "...",
        "Have you been looking after Mummy?":
            "...",
        "What do you want to be when you grow up?":
            "...",
        "Are you ok buddy?":
            "...",
        "leave]": "[end]"
    }
}

function getDialog() {
    if oGameState.checkState([NarrativeEvents.obtained_missing_death_report],
                             [NarrativeEvents.finished_clue_2]) {
        return dialog_after_autopsy_report
    }
    return dialog_tree
}
