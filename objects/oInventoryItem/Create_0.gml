/// @description Insert description here
// You can write your code in this editor
//Initial Movement On the Conveyer Belt
event_inherited()

target_x = 240 - (sprite_width / 2)
if place_meeting(x, y, oConveyerBelt) {
    y = random_range(180, 320)
}

body_state = PBodyState.conveyer
is_inventory = false
is_conveyor_out = false
is_on_table = false
is_readable = false

can_be_processed = true

grabb_x = x
grabb_y = y

function onInventoryDrop() {
    // override
}

function onPDADrop() {
    // override
}

if !active_from_start {
    setActive(false)
}

