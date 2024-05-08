
key_any = false
gp_hinp_pressed = false
gp_vinp_pressed = false
mouse_moved = false
key_interact_pressed = false

if !active
	exit

var gp_hinp = gamepad_axis_value(0, gp_axislh)
var gp_hinp_left = gp_hinp < -gp_hinp_threshold
var gp_hinp_right = gp_hinp > gp_hinp_threshold

var gp_vinp = gamepad_axis_value(0, gp_axislv)
var gp_vinp_up = gp_vinp < -gp_vinp_threshold
var gp_vinp_down = gp_vinp > gp_vinp_threshold

key_interact_pressed = mouse_check_button_pressed(mb_left)

key_any = keyboard_check_pressed(vk_anykey)

gp_hinp_pressed_prev = abs(gp_hinp) > gp_hinp_threshold
if (gp_hinp_pressed_prev) {
  key_left = abs(min(gp_hinp, 0))
  key_right = max(gp_hinp, 0)
}

gp_vinp_pressed_prev = abs(gp_vinp) > gp_vinp_threshold


//// Mouse
mouse_moved = mouse_x != mouse_x_prev or mouse_y != mouse_y_prev
mouse_x_prev = mouse_x
mouse_y_prev = mouse_y
