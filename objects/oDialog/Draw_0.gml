draw_self()

if is_active {
	
	var _x1 = room_width * 0.1
	var _y1 = room_height * 0.6
	var _x2 = room_width * 0.9
	var _y2 = room_height * 0.99
	var _wmax = _x2 - _x1
	var _hmax = _y2 - _y1
	
	var _color = c_white
	textbox_alpha = lerp(textbox_alpha, 1, 1)
	var _alpha = textbox_alpha
	
	if (textbox_w < _wmax) {
		textbox_w += _wmax * 0.2
	}
	var _w = textbox_w
	
	var _h = _hmax
	
	draw_sprite_stretched_ext(sNineSlice1, 0, _x1, _y1, _w, _h, _color, _alpha)
	
	draw_set_color(c_black)
	
	if (draw_text_allowed == true){
	
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
