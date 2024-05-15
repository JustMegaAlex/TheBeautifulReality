draw_set_color(c_black)
draw_set_alpha((10 - global.accessibility.brightness)/10)
draw_rectangle(0, 0, room_width, room_height, 0)
draw_set_color(c_white)
draw_set_alpha(1)

var _mouse_x = display_mouse_get_x()
var _mouse_y = display_mouse_get_y()
var _scale = (global.accessibility.cursorsize * 0.1) + 0.5

draw_sprite_ext(sCursor, 0, _mouse_x, _mouse_y, _scale, _scale, 0, c_white, 1)


