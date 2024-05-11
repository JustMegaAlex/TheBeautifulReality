dialog_x = room_width * 0.5
dialog_y = room_height * 0.7
row_height = 20

dialog_cakes = {
    id: id,
    text: "Cakes are awesome! I ate 8 already!",
    options: {
        "That's a lot!": "Yes!",
        "Don't you feel sick?": "No!",
    },
    call: function() {
        id.dialog_tree = id.dialog_cakes
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

dialog_tree = {
    text: "Hello!",
    options: {
        "Hi": "[end]",
        "Hi!": dialog_cakes,
    }
}

is_active = false
current_dialog = dialog_tree
current_replica = "Default replica"
current_options = []

function startDialog(dialog=dialog_tree) {
    is_active = true
    current_dialog = dialog
    current_replica = current_dialog.text
    current_options_struct = current_dialog.options
    current_options = getKeys(current_options_struct)
}

function chooseOption(option) {
    if option == "end dialog" {
        is_active = false
        return
    }
    current_dialog = current_options_struct[$ option]
    if current_dialog == "[end]" {
        current_options = ["end dialog"]
        return
    } else if is_string(current_dialog) {
        current_replica = current_dialog
        current_options = ["end dialog"]
        return
    }
    current_replica = current_dialog.text
    current_options_struct = current_dialog.options
    current_options = getKeys(current_options_struct)
    var call = get(current_dialog, "call")
    if call != undefined {
        call()
    }
}

function get(struct, key) {
    if !variable_struct_exists(struct, key)
    return undefined
    return variable_struct_get(struct, key)
}

function getKeys(struct) {
    return struct_get_names(struct)
}

function getFirst(struct) {
    return getKeys(struct)[0]
}

function interact(item) {
    if item.object_index == oKanBan {
        startDialog(dialog_kanban)
        instance_destroy(item)
    }
}
