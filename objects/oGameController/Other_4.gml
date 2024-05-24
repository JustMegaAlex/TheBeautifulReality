
switch room {
	case rmStart:
        room_goto_next()
    break
	case rmDWBedroom:
        global.pills_taken = undefined
        global.processed_body_count = 0
    break	
}
