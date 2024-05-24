/*
Dialogs trees and animation.
Dialog objects can be interacted via inventory items (see interact())
*/

enum ExampleEvents {
    non_existing_event
}

dialog_x = room_width * 0.5
dialog_y = room_height * 0.7
row_height = 20

dialog_tree = undefined

another_dialog = {
    text: "Ok, what have you been up to lately?",
    options: {
        "I'm trying to figure out all that dialog stuff": "[end]"
    },
    id: id,
    // call() will be called when this dialog shoots
    call: function() {
        // redefine dialog_tree to make this dialog always appear
        id.dialog_tree = self
    }
}

// default value for the "root" dialog 
// override this in childs
dialog_tree = {
    // text - is the current replica of an npc
    text: "Who has put a Dialog parent object here?",
    // a player can choose one of the options to answer
    // struct varialbes are options' texts
    options: {
        // option can define next npc's replica directly
        "I don't know": "And who does know, huh?",
        // or it can lead to another dialog struct
        "What is a Dialog parent?": {
            text: "It's the core object for the dialog system",
            options: {
                // remember object's id
                id: id,
                // and use it to loop the dialog
                "And what was your first question?": id.dialog_tree
            }
        },
        // store object's id in a struct like this to have access
        // to the object from the struct
        id: id,
        // Of course you can use other dialog structs defined externally
        "Let's talk about smth else": id.another_dialog,
        // use [end] marker to exit dialog
        "uh...": "[end]",
    },
    // mark events as happened
    event: ExampleEvents.non_existing_event
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

// inactive dialog object is invisible
// and don't respond if you click on it
function setActive(value) {
    is_active = value
    visible = value
}

#region dialog functions
// override this in childs if need
// to choose between various dialogs
function getDialog() {
    return dialog_tree
}

function startDialog(dialog = undefined) {
    if dialog == undefined {
        dialog = getDialog()
    }
    is_dialog_running = true
    current_dialog = dialog
    current_replica = current_dialog.text
    current_options_struct = current_dialog.options
    current_options = getKeys(current_options_struct)
	dialogCheckCallFunction()
	dialogAddEvent()
}

function dialogAddEvent() {
    var event = get(current_dialog, "event")
    if event != undefined and !oGameState.checkEventHappened(event) {
        oGameState.addEventHappened(event)
    }
}

function dialogCheckCallFunction() {
    var call = get(current_dialog, "call")
    if call != undefined {
        call()
    }
}

function chooseOption(option) {
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
	dialogAddEvent()
	dialogCheckCallFunction()
    current_options = getKeys(current_options_struct)
    
    if current_replica == "[end]" {
        is_dialog_running = false
        return
    }
}
#endregion

#region helper functions
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
#endregion

function interact(item) {
    // this function is called when dropping an
    // inventory item on dialog object
    if item.object_index == oNuclearBomb {
        instance_destroy()
    }
}
