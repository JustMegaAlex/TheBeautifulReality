event_inherited()

if place_meeting(x, y, oConveyerBelt) {
    x = Approach(x, target_x, oConveyerBelt.conveyerSpeed)
}

if just_grabbed {
    grabb_x = x
    grabb_y = y
}

if dropped {
	var xnow = x
	var ynow = y
	
    var on_inventory = place_meeting(x, y, oInventory)
	var dialog = instance_place(x, y, oDialog)
	if instance_exists(oTable){
		var table = instance_place(x, y, oTable)
	} else {
		var table = false
	}
	
    if !is_inventory {
        if on_inventory {
            is_inventory = true
            persistent = true
            onInventoryDrop()
		} else if table{
			onInventoryDrop()
			if (able_grab == true){
				able_grab = false
				oBody.props_current ++
			}
			
			
		} else {
            x = grabb_x
            y = grabb_y
        }
    } else {
        var dialog = instance_place(x, y, oDialog)
        if dialog {
            dialog.interact(id)
        } else if table{
			onInventoryDrop()
		}
	}
}	

