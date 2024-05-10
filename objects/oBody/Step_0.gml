event_inherited()

//State Machine

switch (body_state) {
    case PBodyState.conveyer:

        able_grab = false

        if x < target_x {
            x = clamp(x + oConveyerBelt.conveyerSpeed, x, target_x)
        }
        else {
            body_state = PBodyState.ready
        }
        break

    case PBodyState.ready:

        able_grab = true

        if dropped {
            if instance_place(x, y, oTable) {
                body_state = PBodyState.table

                x = oTable.x
                y = oTable.y
            }
            else {
                x = target_x
                y = room_height / 2
            }
        }
        break

    case PBodyState.table:

        able_grab = false
        break

    default:
        able_grab = true
        break
}