
// fade in after being clicked
// or fade out after entering a room
fade_amount += is_switching_room ? fade_ratio : -fade_ratio
if fade_amount >= 1 {
	room_goto(target_room)
}

is_hint_on = false
if collision_point(mouse_x, mouse_y, id, false, false) {
	is_hint_on = true
	if oInput.key_interact_pressed {
		switchRoom()
	}
}
