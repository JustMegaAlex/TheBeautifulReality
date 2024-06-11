
switch room {
	case rmStart:
        room_goto_next()
    break
	case rmDWBedroom:
        global.pills_taken = undefined
		// if oGameState.checkEventHappened(NarrativeEvents.end_game_triggered){
        //     oRoomSwitch.target_room = rmDWBedroom
        // }
    break	
}

