
key_any = false
mouse_moved = false
key_interact_pressed = false

if !active
	exit


key_interact_pressed = mouse_check_button_pressed(mb_left)
key_any = keyboard_check_pressed(vk_anykey)



//// Mouse
mouse_moved = mouse_x != mouse_x_prev or mouse_y != mouse_y_prev
mouse_x_prev = mouse_x
mouse_y_prev = mouse_y
