able_grab = true

grabbed = false
just_grabbed = false
dropped = false

mouse_rel_x = mouse_x
mouse_rel_y = mouse_y

function setActive(value) {
    able_grab = value
    visible = value
}
