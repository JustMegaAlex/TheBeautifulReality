event_inherited()

//State Machine

switch (body_state) {
    case PBodyState.conveyer:

        able_grab = false

        if x < target_x {
            x = clamp(x + oConveyerBelt.conveyerSpeed, x, target_x)
        }
        else {
            body_state = PBodyState.ready
        }
        break

    case PBodyState.ready:
		
		if mouse_check_button_pressed(mb_left)
		sfx_play(sfxBodyPickup, 1)
		
        able_grab = true

        if dropped {
            if instance_place(x, y, oTable) {
				
				var _sfx_place = choose(sfxBodyPlace1, sfxBodyPlace2, sfxBodyPlace3)
				sfx_play(_sfx_place, 1)
				
                body_state = PBodyState.table
                x = oTable.x
                y = oTable.y
            }
            else {
                x = target_x
                y = room_height / 2
            }
        }
        break

    case PBodyState.table:
		if props_current >= props_count
		body_state = PBodyState.ship
		
        able_grab = false
        break
	case PBodyState.ship:
		able_grab = true
		
		if dropped {
			if instance_place(x, y, oConveyerBeltOut){
				x = oConveyerBeltOut.x - oConveyerBeltOut.sprite_width + 100
				y = oConveyerBeltOut.y
			}
		}
		
		
		break
	
    default:
        able_grab = true
        break
}
