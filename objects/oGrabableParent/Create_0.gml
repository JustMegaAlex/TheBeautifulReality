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

function moveToOutConveyor() {
    x = oConveyerBeltOut.bbox_left + 50
    y = random_range(oConveyerBeltOut.bbox_top + 40, oConveyerBeltOut.bbox_bottom - 40)
    is_conveyor_out = true
    able_grab = false
}
