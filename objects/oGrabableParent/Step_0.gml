just_grabbed = false

if able_grab {

    if !grabbed {

        dropped = false;

        if !global.picked_item && mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x,
            mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {

            //switch to the grabbed state
            grabbed = true
            just_grabbed = true
            global.picked_item = id

            //Get the relative mouse position to the origin
            mouse_rel_x = mouse_x - x
            mouse_rel_y = mouse_y - y

        }

    } else {

        if mouse_check_button_released(mb_left) {

            //move out of the grabbed state
            grabbed = false

            //Set Dropped to be true for this frame only.
            dropped = true
            global.picked_item = noone

        }

        x = mouse_x - mouse_rel_x
        y = mouse_y - mouse_rel_y

    }

}
