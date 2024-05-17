event_inherited()

instance_deactivate_object(oRoomSwitch)

dialog_tree = {
    text: "Hey psssst! Who is that by my side?",
    options: {
        "This is Sharon, she's my wife": {
            text: "Your wife?? That's crazy!",
            options: {
                "What's wrong?": {
                    text: "Can't you see? She looks.. idk... she's just so weird",
                    options: {
                        "Are you trying to say she's a beauty? =)": {
                            text: "She's wha... Yes!!" +
                                "\n Yes! Exactly!" +
                                "\nAbnormally beautiful I would say." +
                                "\nShe's like from the other dimension!" +
                                "\nHas handsome guy seen her?" +
                                "\nGo away you gorgeous aien!!!" +
                                "Leave our moderately handsome world!",
                            options: {
                                "XD Can I just go back?": {
                                    id: id,
                                    text: "Oh, of course",
                                    options: {
                                        "Thank you": {
                                            id: id,
                                            text: "[end]",
                                            options: {},
                                            call: function() {
                                                with id instance_destroy
                                                    ()
                                            }
                                        }
                                    },
                                    call: function() {
                                        with id {
                                            instance_activate_all()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        },
    }
}
