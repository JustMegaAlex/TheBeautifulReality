draw_self()

if is_hint_on {
    draw_text(room_width * 0.5, room_height - 50,
        string(hint_message_template, target_name))
}
