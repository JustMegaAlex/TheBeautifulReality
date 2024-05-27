//target_room = noone
//target_name = "TELL DEVS TO PUT A NAME HERE"
hint_message_template = "Go to {0}"
is_hint_on = false
is_switching_room = false
fade_ratio = 0.03
fade_amount = 0
hint_text = string(hint_message_template, target_name)


function switchRoom() {
    is_switching_room = true
}


//Elevator Close Sequence

activeAnimation = -1;
sequenceLayer = -1;
activeSequence = -1;

function playElevatorClose() {
	
	sequence = seqElevatorClose;
	sequenceLayer = layer_create(-99999);
	activeSequence = layer_sequence_create(sequenceLayer, 0, 0, sequence);
}

function checkElevatorClose() {
	if (activeSequence == undefined) return;
	
	if (layer_sequence_is_finished(activeSequence)) {
		layer_sequence_destroy(activeSequence);
		layer_destroy(sequenceLayer);
		
		switchRoom()
		
		activeAnimation = -1;
		activeSequence = -1;
		sequenceLayer = -1;
	}
}	

