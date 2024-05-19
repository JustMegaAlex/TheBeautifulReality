
EnsureSingleton()

function check(_room, events, exclude_events) {
	if room != _room {
		return false
	}
	for (var i = 0; i < array_length(events); ++i) {
		if !oGameState.checkEvent(events[i]) {
			return false	
		}
	}
	for (var i = 0; i < array_length(exclude_events); ++i) {
		if oGameState.checkEvent(exclude_events[i]) {
			return false	
		}
	}
	return true
}


function update() {
	if check(rmWork, [NarrativeEvents.bart_treat_talk], [NarrativeEvents.bart_gave_treat]) {
		instance_create_layer(0, oConveyerBelt.y, "Instances", oDogTreat)
	}
}
