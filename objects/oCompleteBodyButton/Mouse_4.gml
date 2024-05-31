
if instance_exists(oBody){
	if (oBody.body_state == PBodyState.ship){
		oBody.moveToOutConveyor()
		with oInventoryItem {
			if place_meeting(x, y, oTable) {
                moveToOutConveyor()
            }
		}
		global.processed_body_count++
	}
}

