event_inherited()

if place_meeting(x + 50, y, oConveyerBelt) {
    x = Approach(x, target_x, oConveyerBelt.conveyerSpeed)
}

if just_grabbed {
    grabb_x = x
    grabb_y = y
    if is_on_table {
        is_on_table = false
        oBody.props_current--
    }
}

if dropped {
    if place_meeting(x, y, oPDA) {
        oPDA.interact(id)
        onPDADrop()
    }

    var dialog = instance_place(x, y, oDialog)
    if dialog {
        dialog.interact(id)
    }

    var on_inventory = place_meeting(x, y, oInventory)
    var on_table = place_meeting(x, y, oTable)
    if on_inventory {
        is_inventory = true
        is_on_table = false
        persistent = true
        onInventoryDrop()
    } else if on_table and can_be_processed {
        is_on_table = true
        is_inventory = false
        oBody.props_current++
    } else {
        x = grabb_x
        y = grabb_y
    }
}

if is_conveyor_out and instance_exists(oConveyerBeltOut) {
    if instance_place(x, y, oConveyerBeltOut){
        able_grab = false
        x += oConveyerBeltOut.conveyer_speed
    }
    if x > oConveyerBeltOut.bbox_right {
        instance_destroy()
    }
}
