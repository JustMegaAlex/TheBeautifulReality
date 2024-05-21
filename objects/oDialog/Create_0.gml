dialog_x = room_width * 0.5
dialog_y = room_height * 0.7
row_height = 20

// default value for the "root" dialog 
// override this in childs
dialog_tree = {
    text: "Who has put a Dialog parent object here?",
    options: {
        "uh...": "[end]",
    }
}

is_active = true // can be interacted
is_dialog_running = false
current_dialog = dialog_tree
current_replica = "Default replica"
current_options = []


intro_timer = MakeTimer(8)
draw_text_allowed = false
textbox_alpha = 0
textbox_w = 0

function setActive(value) {
    is_active = value
    visible = value
}

function startDialog(dialog = dialog_tree) {
    is_dialog_running = true
    current_dialog = dialog
    current_replica = current_dialog.text
    current_options_struct = current_dialog.options
    current_options = getKeys(current_options_struct)
	dialogAddEvent()
}

function dialogAddEvent() {
    var event = get(current_dialog, "event")
    if event != undefined and !oGameState.checkEventHappened(event) {
        oGameState.addEventHappened(event)
    }
}

function chooseOption(option) {
    if option == "end dialog" {
        is_dialog_running = false
        return
    }
    current_dialog = current_options_struct[$ option]
    if current_dialog == "[end]" {
        is_dialog_running = false
        return
    } else if is_string(current_dialog) {
        current_replica = current_dialog
        return
    }
    current_replica = current_dialog.text
    current_options_struct = get(current_dialog, "options")
    if current_options_struct == undefined {

    }
	dialogAddEvent()
    var call = get(current_dialog, "call")
    if call != undefined {
        call()
    }
	dialogAddEvent()
    current_options = getKeys(current_options_struct)
}

function get(struct, key) {
    if !variable_struct_exists(struct, key) {
        return undefined
    }
    return variable_struct_get(struct, key)
}

function getKeys(struct) {
    return struct_get_names(struct)
}

function getFirst(struct) {
    return getKeys(struct)[0]
}

function interact(item) {
}
