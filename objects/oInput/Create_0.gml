
if !EnsureSingleton() {
	exit
}

key_any = false
gp_hinp_pressed = false
gp_vinp_pressed = false
key_interact_pressed = false

gp_hinp_threshold = 0.25
gp_vinp_threshold = 0.85

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