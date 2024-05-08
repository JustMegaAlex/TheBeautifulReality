
if !EnsureSingleton() {
	exit
}

key_any = false
key_interact_pressed = false

//// Mouse
mouse_moved = false
mouse_x_prev = mouse_x
mouse_y_prev = mouse_y

active = true
function SetActive() {
    active = true
}
function SetInactive() {
    active = false
}