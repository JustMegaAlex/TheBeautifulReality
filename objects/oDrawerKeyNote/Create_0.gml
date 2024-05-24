event_inherited()

dialog_tree = {
    text: "\"Woof\"!",
    options: {
        "Was this here the whole time or am I just... forgetful?]": {
            id: id,
            text: "[end]",
            call: function() {
                instance_destroy(id)
            },
            options: {}
        }
    },
}

setActive(false)
