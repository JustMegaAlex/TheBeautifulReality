if body_state = 0{
	if x < targetX{
		x = clamp(x+oConveyerBelt.conveyerSpeed,x,targetX)
	}
	else{
		body_state = 1
	}
}


//Check if body is grabbed, then if mouse is pressed, grab body
if !grabbed && mouse_check_button_pressed(mb_left) && body_state = 1{
	if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom){
		grabbed = true
		
		//Get the Relative mouse position to the origin
		mouse_relx = mouse_x-x
		mouse_rely = mouse_y-y
	}
}
//When Grabbed
if grabbed {
	x = mouse_x-mouse_relx
	y = mouse_y-mouse_rely
	
	if mouse_check_button_released(mb_left) {
		grabbed = false
		if instance_place(x,y,oTable){
			body_state = 2
			x = oTable.x
			y = oTable.y
		}
		else{
			x = targetX
			y = room_height/2
		}
	}
}