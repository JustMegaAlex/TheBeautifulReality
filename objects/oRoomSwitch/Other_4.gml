// begin fade out
fade_amount = 1
is_switching_room = false

if (room == rmWork){
	playElevatorOpen()
}

if (room == rmDWBedroom) and (room_previous == rmFoyer){
	playElevatorOpen()
}

