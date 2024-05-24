event_inherited()

dialog_tree = {
    id: id,
    text: "\"Woof\"!",
    options: {
        "Was this here the whole time or am I just... forgetful?]": "[end]"
    },
    call: function() {
        instance_destroy(id)
    }
}

setActive(false)
