draw_self()
//Highlight Sprite on Moussse
#region

if is_active { //Whatever visuals need to happen during dialogue
    image_alpha = 1
} else { //Inactive state
    image_alpha = 0.6

    //Mouse hover
    if collision_point(mouse_x, mouse_y, id, false, false) {
        image_alpha = 1
    }

}

#endregion

if is_active {

    //Intro Timer
    #region

    if (intro_timer > 0) {
        intro_timer--
    } else {
        if (draw_text_allowed == false)
            draw_text_allowed = true
    }

    #endregion
    //Textbox
    #region

    var _x1 = room_width * 0.1
    var _y1 = room_height * 0.6
    var _x2 = room_width * 0.9
    var _y2 = room_height * 0.99
    var _wmax = _x2 - _x1
    var _hmax = _y2 - _y1

    var _color = c_white
    textbox_alpha = lerp(textbox_alpha, 1, 1)
    var _alpha = textbox_alpha

    if (textbox_w < _wmax)
        textbox_w += _wmax * 0.2
    var _w = textbox_w

    var _h = _hmax

    draw_sprite_stretched_ext(sNineSlice1, 0, _x1, _y1, _w, _h, _color, _alpha)
    #endregion

    //Text
    draw_set_color(c_black)

    if (draw_text_allowed == true) {

        draw_text(dialog_x, dialog_y, current_replica)
        var y_start = dialog_y + string_height(current_replica)
        for (var i = 0; i < array_length(current_options); ++i) {
            var option = current_options[i]

            // workaround GM not permitting to start struct entries with "["
            if string_ends_with(option, "]") {
                option = "[" + option
            }

            draw_text(dialog_x, y_start + (i + 1) * row_height,
                string("{0}. {1}", string(i + 1), option))
        }

    }

    draw_set_color(c_white)
}
