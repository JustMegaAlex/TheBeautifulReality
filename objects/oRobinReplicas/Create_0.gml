event_inherited()

/*
Holds Robin's replicas to himself for cases when there is no another dialog object
to hold replicas. E.g. picking up an item
Persistent
*/

dialog_dog_treat_found = {
    text: "[[Hey, Barth might like that!]",
    options: {
        "continue": "[end]"
    }
}

dialog_family_photo_found = {
    text: "Hold on, I recognize this photo.\n"
          + "It's our family trip to The Alps in the south of France.\n"
          + "I thought I lost it.]",
    options: {
        "continue": "[end]"
    }
}

dialog_autopsy_report = {
    text: "[[Somnium Amphetamines? This is Noah’s teacher...she was always working late. Noah didn’t say anything about her dying.]",
    options: {
        "continue": {
            text: "[[Maybe I should talk to him.]",
            options: {"continue": "[end]"}
        }
    }
}

dialog_missing_death_reason = {
    text: "That's…unusual. Guess I should report it to Merry.]",
    options: {"continue": "[end]"}
}

dialog_mitchel_death_reason = {
    text: "[[Another tampered profile…]",
    options: {"continue": "[end]"}
}
