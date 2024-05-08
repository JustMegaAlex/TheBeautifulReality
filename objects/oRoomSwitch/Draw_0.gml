
draw_self()

if is_hint_on {
    draw_text(room_width * 0.5, room_height - 50,
              string(hint_message_template, target_name))
}

// fade screen
if fade_amount > 0 {
    draw_set_alpha(fade_amount)
    draw_rectangle(0, 0, room_width, room_height, false)
    draw_set_alpha(1)
}
