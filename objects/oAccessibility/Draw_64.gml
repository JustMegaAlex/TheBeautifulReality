draw_set_color(c_black)
draw_set_alpha((10 - global.accessibility.brightness) / 10)
draw_rectangle(0, 0, room_width, room_height, 0)
draw_set_color(c_white)
draw_set_alpha(1)

var _scale = (global.accessibility.cursorsize * 0.1) + 0.5

if point_in_rectangle(mouse_x, mouse_y, 0, 0, room_width, room_height)
    draw_sprite_ext(sCursor, 0, mouse_x, mouse_y, _scale, _scale, 0, c_white, 1)

audio_master_gain(global.audio.bgmlevel / 10)
