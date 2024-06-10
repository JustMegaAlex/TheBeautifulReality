//target_room = noone
//target_name = "TELL DEVS TO PUT A NAME HERE"
hint_message_template = "Go to {0}"
is_hint_on = false
is_switching_room = false
fade_ratio = 0.03
fade_time = 1 / fade_ratio
fade_time_base = fade_time
fade_amount = 0
hint_text = string(hint_message_template, target_name)
transition_struct = undefined

function switchRoom(time=fade_time_base) {
    if room == rmWork and !oWorkController.jobDone() {
        oRobinReplicas.startDialog(oRobinReplicas.dialog_not_enogh_bodies)
    } else if (room == rmWork) {
        transition_struct = new transitionFromWork()
    } else {
        transition_struct = new transition(true)
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

function transition(is_switching_room) constructor {
    finished = false
    self.id_ = other.id
    self.is_switching_room = is_switching_room
    fade_time = 30
    fade_ratio = 1 / fade_time
    fade_amount_prev = 0
    fade_amount = is_switching_room ? 0 : 1
    self.target_room = id_.target_room

    step = function() {
        fade_amount_prev = fade_amount
        fade_amount += is_switching_room ? fade_ratio : -fade_ratio
        fade_amount = clamp(fade_amount, 0, 1)
        if fade_amount == 1 {
            room_goto(target_room)
        }
        if (fade_amount_prev > 0) and (fade_amount <= 0) {
            id_.onTransitionEnd()
			finished = true
        }
    }
}

//// Note: inheritance is broken in html
function transitionToWork() constructor {
    finished = false
    self.id_ = other.id
    self.target_room = id_.target_room

    fade_time = 90
    fade_ratio = 1 / fade_time
    fade_amount = 1
    sequence = seqElevatorOpen
    sequence_layer = layer_create(-99999)
    active_sequence = layer_sequence_create(sequence_layer, 0, 0, sequence)
    layer_sequence_speedscale(sequence, 0)
	self.target_room = target_room

    step = function() {
        fade_amount_prev = fade_amount
        fade_amount -= fade_ratio
        fade_amount = clamp(fade_amount, 0, 1)
        if fade_amount == 0 {
            layer_sequence_speedscale(sequence, 1)
            // sfx_play(sfxElevator, 1)
        }
        if (layer_sequence_is_finished(active_sequence)) {
            layer_sequence_destroy(active_sequence)
            layer_destroy(sequence_layer)
            finished = true
            id_.onTransitionEnd()
        }
    }
}

function transitionFromWork() constructor {
    finished = false
    self.id_ = other.id

    fade_time = 90
    fade_ratio = 1 / fade_time
    fade_amount = 0
    is_transition = false

    sequence = seqElevatorClose
    sequence_layer = layer_create(-99999)
    active_sequence = layer_sequence_create(sequence_layer, 0, 0, sequence)
    // sfx_play(sfxElevator, 1)

	step = function() {
        if (layer_sequence_is_finished(active_sequence)) {
            is_transition = true
			layer_sequence_speedscale(active_sequence, 0)
        }
        if is_transition {
            fade_amount_prev = fade_amount
            fade_amount += fade_ratio
            fade_amount = clamp(fade_amount, 0, 1)
            if fade_amount == 1 {
                room_goto(self.id_.target_room)
            }
        }
    }
}
