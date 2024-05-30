event_inherited()

if place_meeting(x, y, oConveyerBelt) {
    x = Approach(x, target_x, oConveyerBelt.conveyerSpeed)
}

if just_grabbed {
    grabb_x = x
    grabb_y = y
}

if dropped {
    if place_meeting(x, y, oPDA) {
        oPDA.interact(id)
        onPDADrop()
    }

    var on_inventory = place_meeting(x, y, oInventory)
    if !is_inventory {
        if on_inventory {
            is_inventory = true
            persistent = true
            onInventoryDrop()
        } else if !place_meeting(x, y, oTable) {
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
