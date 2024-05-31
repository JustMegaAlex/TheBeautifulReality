// fade in after being clicked
// or fade out after entering a room
fade_amount_prev = fade_amount
fade_amount += is_switching_room ? fade_ratio : -fade_ratio
fade_amount = clamp(fade_amount, 0, 1)
if fade_amount == 1 {
    room_goto(target_room)
}

if fade_amount_prev > 0 and fade_amount <= 0 {
    onTransitionEnd()
}

is_hint_on = false
if !global.dialog_on and collision_point(mouse_x, mouse_y, id, false, false) {
    is_hint_on = true
    if oInput.key_interact_pressed {
        if (target_room == rmDWBedroom) and (room == rmFoyer)
                or (target_room == rmWork) and (room == rmFoyer){
            playElevatorClose()
        } else {
            switchRoom()
        }
    }
}


checkElevatorClose()
