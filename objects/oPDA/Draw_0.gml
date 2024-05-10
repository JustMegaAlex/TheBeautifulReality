draw_sprite(sprite_index, 0, x, y)

//Replace with PDA surface
draw_sprite(sprite_index, 1, x, y)


var _hover = false
draw_set_color(c_white)
if point_in_rectangle(mouse_x, mouse_y, bbox_left, 0, bbox_right, 32) {
    draw_set_alpha(0.1)
    draw_rectangle(bbox_left, 0, bbox_right, 32, false)
    draw_set_alpha(1)

    _hover = true

}

draw_set_valign(fa_middle)
draw_set_halign(fa_center)

var _nohoveralpha = 0.25
draw_set_alpha(_nohoveralpha + (_hover * (1 - _nohoveralpha)))
draw_text(room_width - sprite_width / 2, 16, (pda_open ? "Put away PDA" : "Pull out PDA"))
draw_set_alpha(1)