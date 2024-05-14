
// 1 | TITLE
// This title glitches every once in a while, cycling between sprites

//Countdown
if (title_anim_timer > 0){
	title_anim_timer --
} else {	//When the timer reaches zero, reset it to a random value
	title_anim_timer = irandom_range((title_anim_timer_max * 0.5), title_anim_timer_max)
	xpos_title_current = xpos_title_initial
	ypos_title_current = ypos_title_initial
	title_image_index = 0
}

if (title_anim_timer < 10){
	var _range = 10
	xpos_title_current = xpos_title_initial + irandom_range(-_range, _range)
//	ypos_title_current = ypos_title_initial + irandom_range(-_range, _range)
	title_image_index = 1
}

if (title_anim_timer < 7){
	var _range = 10
	xpos_title_current = xpos_title_initial + irandom_range(-_range, _range)
//	ypos_title_current = ypos_title_initial + irandom_range(-_range, _range)	
	title_image_index = 2
}

//Draw Title Sprite
draw_sprite(sprite_title, title_image_index, xpos_title_current, ypos_title_current)

// 2 | BUTTONS


if (buttons_timer > 0){
	buttons_timer --
	
	if (buttons_timer < 2){
		draw_set_color(c_black)
		draw_rectangle(0, 0, gui_w, gui_h, 0)
		draw_set_color(c_white)
	}
	
} else {
	
	var _size = array_length(button_sprite_array)
	for (var i = 0; i < _size; i++){
		
		//SET X AND Y CENTER
		var _x = gui_w * (0.2 + (0.2 * i))
		var _y = gui_h * 0.8
		
		//SET IMAGE SCALE
		var _scale = 1
		
		//GET RECTANGLE REGION (the 24 is a buffer so we have +12px on all sides
		var _sw = sprite_get_width(button_sprite_array[i]) + 24
		var _sh = sprite_get_height(button_sprite_array[i]) + 24
		var _xtop = _x - (_sw * 0.5)
		var _ytop = _y - (_sh * 0.5)
		var _xbot = _xtop + _sw
		var _ybot = _ytop + _sh
			
		// DO SHIT IF MOUSE IS IN REGION
		var _mouse_in_rect = point_in_rectangle(mouse_x, mouse_y, _xtop, _ytop, _xbot, _ybot)
		
		if _mouse_in_rect{
			button_scale_array[i] = lerp(button_scale_array[i], 1.2, 0.2)
			_scale = button_scale_array[i]
			
			gpu_set_blendmode(bm_add)
			//BG Sprite 1
			button_rot1_array[i] = lerp(button_rot1_array[i], 8, 0.1)
			draw_sprite_ext(button_sprite_array[i], 0, _x + button_rot1_array[i], _y  + button_rot1_array[i], _scale, _scale, button_rot1_array[i], c_red, 1)
			
			//BG Sprite 2
			button_rot2_array[i] = lerp(button_rot2_array[i], -8, 0.1)			
			draw_sprite_ext(button_sprite_array[i], 0, _x + button_rot2_array[i], _y + button_rot2_array[i], _scale, _scale, button_rot2_array[i], c_blue, 1)
			gpu_set_blendmode(bm_normal)
		} else {
			//Reset the arrays for next time mouse hovers
			button_rot1_array[i] = 0
			button_rot2_array[i] = 0
			button_scale_array[i] = 1.3
		}
		

		// DRAW THE MAIN SPRITE + TEXT ABOVE EVERYTHING
		if !_mouse_in_rect{		
			draw_sprite_ext(button_sprite_array[i], 0, _x, _y, _scale, _scale, 0, c_white, 1)
			draw_set_halign(fa_middle)
			draw_set_valign(fa_center)
			draw_text_ext_transformed_color(_x, _y, button_text_array[i], 30, 150, 1, 1, 0, c_black, c_black, c_black, c_black, 1)
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
		} else if _mouse_in_rect{		
			draw_sprite_ext(button_sprite_array[i], 0, _x, _y, _scale, _scale, 0, c_black, 1)
			draw_set_halign(fa_middle)
			draw_set_valign(fa_center)
			draw_text_ext_transformed_color(_x, _y, button_text_array[i], 30, 150, _scale, _scale, 0, c_white, c_white, c_white, c_white, 1)
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
		}
		
		//Actually do something on mouse click
		
		if (_mouse_in_rect) and (mouse_check_button_pressed(mb_left)){
			switch button_text_array[i]
			{
				case "CLOCK IN":
				room_goto(rmStart)
				break;

				case "OPTIONS":
				room_goto(rmStart)
				break;

				case "CREDITS":
				room_goto(rmStart)
				break;
				
				case "CLOCK OUT":
				room_goto(rmStart)
				break;	
			}
		}
		
	
	}
}