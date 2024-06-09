// fade in after being clicked
// or fade out after entering a room

if transition_struct != undefined {
    transition_struct.step()
    if transition_struct.finished {
        transition_struct = undefined
    }
}

is_hint_on = false
if !global.dialog_on 
		and collision_point(mouse_x, mouse_y, id, false, false)
		and transition_struct == undefined {
    is_hint_on = true
    if oInput.key_interact_pressed {
        switchRoom()
    }
}
