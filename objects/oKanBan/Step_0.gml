event_inherited()

if place_meeting(x, y, oConveyerBelt) {
	x = Approach(x, target_x, oConveyerBelt.conveyerSpeed)
}

if just_grabbed {
	grabb_x = x
	grabb_y = y
}

if dropped {
	if place_meeting(x, y, oInventory) {
		is_inventory = true
		persistent = true
	} else {
		x = grabb_x
		y = grabb_y
	}
}
