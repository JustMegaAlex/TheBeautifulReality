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

dialog_mitchel_journal = {
    text: "[[Looks like another in my line of work. Fortunately for me, I can’t communicate with my patients.]",
    options: {"continue": "[end]"}
}

dialog_mitchel_notes = {
    text: "[[He was trying to warn us about something…or is this to himself?] ",
    options: {"continue": "[end]"}
}

dialog_endgame_enter_bedroom = {
    text: "[[Huh. Was I asleep too long?] ",
    options: {"continue": "[end]"}
}

dialog_endgame_not_leaving = {
    text: "[[I have a strange feeling... I'm not going to work today]",
    options: {"continue": "[end]"}
}
