event_inherited()

/*
Holds Robin's replicas to himself for cases when there is no another dialog object
to hold replicas. E.g. picking up an item
Persistent
*/

dialog_dog_treat_found = {
    text: "[Hey, Barth might like that!]",
    options: {
        "continue": "[end]"
    }
}

dialog_family_photo_found = {
    text: "Hold on, I recognize this photo.\n"
          + "It’s our family trip to The Alps in the south of France.\n"
          + "I thought I lost it.]",
    options: {
        "continue": "[end]"
    }
}
