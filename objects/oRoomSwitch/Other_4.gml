// begin fade out
fade_amount = 1
is_switching_room = false

if (room == rmWork){
	playElevatorOpen()
}

if (room == rmDWBedroom) and (global.room_prev == rmFoyer){
	playElevatorOpen()
}

