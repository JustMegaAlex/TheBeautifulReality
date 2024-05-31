event_inherited()

spr_face = sCharlotteFace

dialog_tree = {
    text: "Hm?",
    options: {
        "How was school today?":
            "Boring honestly. I mean I did get the highest score on our math test...again. So there's that I guess. ",
        "What subjects are you enjoying right now?":
            "Hmm, English is the most tolerable. But honestly, none of the subjects are particularly challenging. ",
        "Do you have any upcoming projects?":
            "Last week I presented a monologue for the school play auditions. Naturally, I expect to get the lead role.  ",
        "What do you want to be when you grow up?": {
            text: "Seriously Dad? I'm already practically a superstar! Don't worry, I'll make sure everyone knows my name soon. Charlotte Anderson...I can see it on the silver screen already. ",
            options: {
                "Jeez do you ever turn it down a notch Sharl...at least one of us still has dreams, I suppose.]":
                    "[end]"
            }

        }
    }
}
