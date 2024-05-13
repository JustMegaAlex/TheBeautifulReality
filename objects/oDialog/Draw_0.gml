draw_self()

if is_active {
    draw_text(dialog_x, dialog_y, current_replica)
    var y_start = dialog_y + string_height(current_replica)
    for (var i = 0; i < array_length(current_options); ++i) {
        draw_text(dialog_x, y_start + (i + 1) * row_height,
            string("{0}. {1}", string(i + 1), current_options[i]))
    }
}