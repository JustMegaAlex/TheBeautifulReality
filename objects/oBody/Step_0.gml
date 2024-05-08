event_inherited()

//State Machine

switch(body_state){
	case p_body_state.conveyer:
		
		able_grab = false
		
		if x < targetX{
			x = clamp(x + oConveyerBelt.conveyerSpeed, x, targetX)
		}
		else{
			body_state = p_body_state.ready
		}
		break
		
	case p_body_state.ready:
		
		able_grab = true
		
		if dropped {
			if instance_place(x,y,oTable){
				body_state = p_body_state.table
				
				x = oTable.x
				y = oTable.y
			}
			else{
				x = targetX
				y = room_height/2
			}
		}
		break
		
	case p_body_state.table:
		
		able_grab = false
		break
		
	default:
		able_grab = true
		break
}