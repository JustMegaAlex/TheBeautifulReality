image_speed = 0
instance_create_depth(0, 0, depth - 1, oBody)
conveyerSpeed = 2
y = room_height / 2
x = 0 - (sprite_width * 0.3)

if oGameState.checkEventHappened(NarrativeEvents.bart_treat_talk)
        && oGameState.checkEventHappened(NarrativeEvents.bart_gave_treat)
        && !instance_exists(oDogTreat) {
    instance_create_layer(0, y, layer, oDogTreat)
}
