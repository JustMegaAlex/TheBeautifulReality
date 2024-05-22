if mouse_check_button_pressed(mb_left) {
    if point_in_rectangle(mouse_x, mouse_y, bbox_left, 0, bbox_right, 32) {
        pda_open = !pda_open
		oMerry.setActive(pda_open)
    }
}


if y < pda_target_y[pda_open] {
    y = min(y + pda_spd, pda_target_y[pda_open])
}
if y > pda_target_y[pda_open] {
    y = max(y - pda_spd, pda_target_y[pda_open])
}
