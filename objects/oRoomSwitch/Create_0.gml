//target_room = noone
//target_name = "TELL DEVS TO PUT A NAME HERE"
hint_message_template = "Go to {0}"
is_hint_on = false
is_switching_room = false
fade_ratio = 0.03
fade_amount = 0
hint_text = string(hint_message_template, target_name)
global.room_prev = noone

function switchRoom() {
    is_switching_room = true
}


//Elevator Close Sequence

active_animation = -1
sequence_layer = -1
active_sequence = -1

function playElevatorClose() {
	
	sequence = seqElevatorClose
	sequence_layer = layer_create(-99999)
	active_sequence = layer_sequence_create(sequence_layer, 0, 0, sequence)
}

function checkElevatorClose() {
	if (active_sequence == undefined) return
	
	if (layer_sequence_is_finished(active_sequence)) {
		layer_sequence_destroy(active_sequence)
		layer_destroy(sequence_layer)
		
		switchRoom()
		
		active_animation = -1
		sequence_layer = -1
		active_sequence = -1
	}
}

function playElevatorOpen() {
	
	sequence = seqElevatorOpen
	sequence_layer = layer_create(-99999)
	active_sequence_open = layer_sequence_create(sequence_layer, 0, 0, sequence)
}

function onTransitionEnd() {
    // override
}

