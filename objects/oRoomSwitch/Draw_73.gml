// fade screen
if fade_amount > 0 {
    draw_set_color(c_black)
    draw_set_alpha(fade_amount)
    draw_rectangle(0, 0, room_width, room_height, false)
    draw_set_alpha(1)
    draw_set_color(c_white)
}
