//Initial Movement On the Conveyer Belt

if !oGameState.checkEventHappened(NarrativeEvents.first_talk)
		or oGameState.checkEvent(NarrativeEvents.cake_canban) {
	instance_destroy()		
}

event_inherited()

target_x = 240 - (sprite_width / 2)
y = random_range(180, 320)

body_state = PBodyState.conveyer
is_inventory = false

grabb_x = x
grabb_y = y
