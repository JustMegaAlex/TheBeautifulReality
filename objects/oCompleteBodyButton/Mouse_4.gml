if instance_exists(oBody){
	if (oBody.body_state == PBodyState.ship){
		instance_destroy(oBody)
		global.processed_body_count ++
	}
}

