event_inherited()

if place_meeting(x, y, oConveyerBelt) {
    x = Approach(x, target_x, oConveyerBelt.conveyerSpeed)
}

if just_grabbed {
    grabb_x = x
    grabb_y = y
    if place_meeting(x, y, oTable) {
        oBody.props_current--
    }
}

if dropped {
    if place_meeting(x, y, oPDA) {
        oPDA.interact(id)
        onPDADrop()
    }
    
    var on_inventory = place_meeting(x, y, oInventory)
    var on_table = place_meeting(x, y, oTable)
    if !is_inventory {
        if on_inventory {
            is_inventory = true
            persistent = true
            onInventoryDrop()
        } else if on_table {
            oBody.props_current++
        } else {
            x = grabb_x
            y = grabb_y
        }
    } else {
        var dialog = instance_place(x, y, oDialog)
        if dialog {
            dialog.interact(id)
        } else if !on_inventory {
            x = grabb_x
            y = grabb_y
        }
    }
}

if instance_exists(oConveyerBeltOut) {
    if instance_place(x, y, oConveyerBeltOut){
        able_grab = false
        x += oConveyerBeltOut.conveyer_speed
    }
    if x > oConveyerBeltOut.bbox_right {
        instance_destroy()
    }
}
