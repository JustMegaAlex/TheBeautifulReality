//Initial Movement On the Conveyer Belt


event_inherited()

target_x = 240 - (sprite_width / 2)
y = random_range(180, 320)

body_state = PBodyState.conveyer
is_inventory = false
is_readable = false

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
