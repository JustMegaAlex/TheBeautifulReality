
if instance_exists(oBody){
	if (oBody.body_state == PBodyState.ship){
		oBody.moveToOutConveyor()
		with oInventoryItem {
			if !is_inventory and place_meeting(x, y, oTable) {
                moveToOutConveyor()
            }
		}
		oWorkController.processed++
	}
}

