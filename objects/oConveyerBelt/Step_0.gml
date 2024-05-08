if instance_exists(oBody) {
	if oBody.body_state = p_body_state.conveyer{
		image_speed = 1
	}
	else{
		image_speed = 0
	}
}
else{
	image_speed = 0
}