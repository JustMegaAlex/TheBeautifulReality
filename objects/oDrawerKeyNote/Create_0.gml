event_inherited()

dialog_tree = {
    id: id,
    text: "Woof!",
    options: {
        "A sticker note that says \"Woof\"... and a key": "[end]"
    },
    call: function() {
        instance_destroy(id)
    }
}

setActive(false)
