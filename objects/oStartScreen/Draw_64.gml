// 0 | Get State
state = ds_stack_top(screen_stack)

// 1 | TITLE
// This title glitches every once in a while, cycling between sprites

if (state == SCREENVIEW.NONE) or(state == SCREENVIEW.START) {
    if (title_anim_timer > 0) {
        title_anim_timer--
    } else { //When the timer reaches zero, reset it to a random value
        title_anim_timer = irandom_range((title_anim_timer_max * 0.5),
            title_anim_timer_max)
        xpos_title_current = xpos_title_initial
        ypos_title_current = ypos_title_initial
        title_image_index = 0
        audio_stop_sound(sfxGlitch1)
    }

    if (title_anim_timer < 10) {
        if !audio_is_playing(sfxGlitch1)
        audio_play_sound(sfxGlitch1, 0, false, 0.15)
        var _range = 10
        xpos_title_current = xpos_title_initial + irandom_range(-_range,
            _range)
        //	ypos_title_current = ypos_title_initial + irandom_range(-_range, _range)
        title_image_index = 1
    }

    if (title_anim_timer < 7) {
        var _range = 10
        xpos_title_current = xpos_title_initial + irandom_range(-_range,
            _range)
        //	ypos_title_current = ypos_title_initial + irandom_range(-_range, _range)	
        title_image_index = 2
    }

    var _mouse_xshift = (mouse_x - xpos_title_current) * -0.004
    var _mouse_yshift = (mouse_y - ypos_title_current) * -0.004

    //Draw Title Sprite
    draw_set_alpha(0.8)
    draw_sprite(sprite_title, 1, xpos_title_current + _mouse_xshift + 2,
        ypos_title_current + _mouse_yshift + 2)
    draw_sprite(sprite_title, title_image_index, xpos_title_current +
        _mouse_xshift, ypos_title_current + _mouse_yshift)
    draw_set_alpha(1)

}

// 2 | BUTTONS
//Count the timer down: add screen view in sync with the first glitch
if (buttons_timer > 0) {
    buttons_timer--

    if (buttons_timer == 0) {
        buttons_timer = -1 //deactivate this
        if state != SCREENVIEW.START
        ds_stack_push(screen_stack, SCREENVIEW.START)
    }

}


if state == SCREENVIEW.START {
    layer_enable_fx("LayerBlur", false)

    var _size = array_length(button_sprite_array)
    for (var i = 0; i < _size; i++) {

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
        var _mouse_in_rect = point_in_rectangle(mouse_x, mouse_y, _xtop,
            _ytop, _xbot, _ybot)

        if _mouse_in_rect {
            button_scale_array[i] = lerp(button_scale_array[i], 1.2, 0.2)
            _scale = button_scale_array[i]

            gpu_set_blendmode(bm_add)
            //BG Sprite 1
            button_rot1_array[i] = lerp(button_rot1_array[i], 8, 0.1)
            draw_sprite_ext(button_sprite_array[i], 0, _x +
                button_rot1_array[i], _y + button_rot1_array[i], _scale,
                _scale, button_rot1_array[i], c_red, 1)

            //BG Sprite 2
            button_rot2_array[i] = lerp(button_rot2_array[i], -8, 0.1)
            draw_sprite_ext(button_sprite_array[i], 0, _x +
                button_rot2_array[i], _y + button_rot2_array[i], _scale,
                _scale, button_rot2_array[i], c_blue, 1)
            gpu_set_blendmode(bm_normal)
        } else {
            //Reset the arrays for next time mouse hovers
            button_rot1_array[i] = 0
            button_rot2_array[i] = 0
            button_scale_array[i] = 1.4
        }


        // DRAW THE MAIN SPRITE + TEXT ABOVE EVERYTHING
        if !_mouse_in_rect {
            draw_sprite_ext(button_sprite_array[i], 0, _x, _y, _scale,
                _scale, 0, c_white, 0.9)
            draw_set_halign(fa_middle)
            draw_set_valign(fa_center)
            draw_text_ext_transformed_color(_x, _y, button_text_array[i],
                30, 150, 1, 1, 0, c_black, c_black, c_black, c_black, 1)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
        } else if _mouse_in_rect {
            draw_sprite_ext(button_sprite_array[i], 0, _x, _y, _scale,
                _scale, 0, c_black, 0.9)
            draw_set_halign(fa_middle)
            draw_set_valign(fa_center)
            draw_text_ext_transformed_color(_x, _y, button_text_array[i],
                30, 150, _scale, _scale, 0, c_white, c_white, c_white,
                c_white, 1)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
        }

        //Actually do something on mouse click

        if (_mouse_in_rect) and(mouse_check_button_pressed(mb_left)) {
            switch button_text_array[i] {
                case "CLOCK IN":
				sfx_play(sfxMenuClockInOut, 1)
                room_goto(rmStart)
                if audio_is_playing(bgmStartScreen)
                audio_sound_gain(bgmStartScreen, 0, 1000)

                break;

                case "OPTIONS":
                ds_stack_push(screen_stack, SCREENVIEW.OPTIONS)
				sfx_play(sfxMenuClick, 1)
                break;

                case "CREDITS":
                ds_stack_push(screen_stack, SCREENVIEW.CREDITS)
				sfx_play(sfxMenuClick, 1)
                break;

                case "CLOCK OUT":
				sfx_play(sfxMenuClockInOut, 1)
                game_end()
                break;
            }
        }


    }
}

if state == SCREENVIEW.OPTIONS {
    layer_enable_fx("LayerBlur", true)

    //UPDATE THE VALUES FOR EACH OPTION
    options_value_array = [global.audio.sfxlevel,
        global.audio.bgmlevel,
        global.accessibility.brightness,
        global.accessibility.fontsize,
        global.accessibility.cursorsize
    ]

    //LOOP
    for (var i = 0; i < 5; i++) {
        var _xmid = gui_w * 0.27
        var _ymidfinal = gui_h * 0.25 + (gui_h * 0.12 * i)
        options_ypos_array[i] = lerp(options_ypos_array[i], _ymidfinal, 0.2)
        var _ymid = options_ypos_array[i]

        var _sw = sprite_get_width(sprite_options)
        var _sh = sprite_get_height(sprite_options)

        draw_sprite_ext(sprite_options, 0, _xmid, _ymid, 1, 1, 0, c_black,
            0.9)
        draw_set_halign(fa_middle)
        draw_set_valign(fa_center)
        if ((_ymid - _ymidfinal) < 5)
            draw_text_ext_transformed_color(_xmid, _ymid,
                options_text_array[i], 30, 150, 1, 1, 0, c_white, c_white,
                c_white, c_white, 1)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)

        if ((_ymid - _ymidfinal) < 3) {
            for (var j = 0; j < 10; j++) {

                var _xtop = _xmid + (_sw * 0.5) + 20 + (j * 25)
                var _ytop = _ymid - (_sh * 0.25)
                var _xbot = _xtop + 22
                var _ybot = _ytop + (_sh * 0.25)

                var _mouse_in_rect = point_in_rectangle(mouse_x, mouse_y,
                    _xtop - 1, _ytop, _xbot + 1, _ybot)

                var _color = c_black
                if (options_value_array[i] > j)
                    _color = c_white
                if (_mouse_in_rect)
                    _color = c_red

                draw_set_alpha(0.7)
                draw_set_color(_color)
                draw_rectangle(_xtop, _ytop, _xbot, _ybot, 0)
                draw_set_alpha(1)
                draw_set_color(_color)

                if (_mouse_in_rect) and mouse_check_button(mb_left) {
					sfx_play(sfxMenuClick, 1)
                    switch options_text_array[i] {
                        case "SOUND EFFECTS":
                        global.audio.sfxlevel = j + 1
                        break;

                        case "MUSIC":
                        global.audio.bgmlevel = j + 1
                        break;

                        case "BRIGHTNESS":
                        global.accessibility.brightness = j + 1
                        break;

                        case "FONT SIZE":
                        global.accessibility.fontsize = j + 1
                        break;

                        case "CURSOR SIZE":
                        global.accessibility.cursorsize = j + 1
                        break;
                    }
                }
            }
        }
    }

    button_back()
}

if state == SCREENVIEW.CREDITS
{
	layer_enable_fx("LayerBlur", true)
	
	var _xtop = gui_w * 0.2
	var _ytop = gui_h * 0.2

	var _size = array_length(credits_names)
	for (var i = 0; i < _size; i++){
		
		var _alpha = 0.6
		var _color = c_black
		var _scale = 1
		var _xoffset = 0
		
		//Get Rectangle
		var _x1 = _xtop - 20
		var _y1 = _ytop + (i * 40) - 20
		var _x2 = _xtop + 220
		var _y2 = _ytop + ((i + 1) * 40) - 20
		var _w_nineslice = _x2 - _x1
		var _h_nineslice = _y2 - _y1
		
		if point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2){
		
		draw_sprite_stretched(credits_box1, 0, _x1, _y1, _w_nineslice, _h_nineslice)
		
		_scale = 1.2	
		_alpha = 1
		credits_highlighted[i] = true	
			if credits_glitch_timer[i] > 0{
				credits_glitch_timer[i] --			
				_xoffset = irandom_range(-9, 3)
				_color = choose(c_lime, c_blue, c_purple)
			}
		
		} else {
			credits_glitch_timer[i] = 6
			credits_highlighted[i] = false
		}
		
		draw_set_valign(fa_center)
		draw_set_color(c_black)
		draw_text_transformed_color(_xtop + _xoffset, _ytop + (i * 40), 
		credits_names[i], _scale, _scale,0, _color, _color, _color, _color, _alpha)
		draw_set_color(c_white)
		draw_set_valign(fa_top)
		
		if (credits_highlighted[i] == true){
			
			var _xtop_bio = gui_w * 0.5
			var _ytop_bio = _ytop
			var _scale = 1
			var _angle = 0
			var _color = c_white
			var _alpha = 1	
			var _sep = 18
			var _width = 350
			
			credits_bios_box_rot1[i] = lerp(credits_bios_box_rot1[i], 1, 0.2)
			_alpha = credits_bios_box_rot1[i]
			
			credits_bios_box_scale[i] = lerp(credits_bios_box_scale[i], 1, 0.2)
			_scale = credits_bios_box_scale[i]
			
			if credits_bios_box_rot2[i] > 0{
				credits_bios_box_rot2[i] --
			}
			
			draw_sprite_stretched_ext(sNineSlice1, 0, _xtop_bio - 10, _ytop_bio - 20, 
			_width + 20, 300, c_black, 0.85)
			
			draw_text_ext_transformed_color(_xtop_bio, _ytop_bio, credits_bios[i],
			_sep, _width, _scale, _scale, _angle, _color, _color, _color, _color, _alpha)
			
		} else {
			credits_bios_box_rot1[i] = 0
			credits_bios_box_rot2[i] = 10
			credits_bios_box_scale[i] = 1.2
		}
		
		
	}
	
	button_back()
}


// BG Parallax
#region

var _xmid = gui_w * 0.5
var _ymid = gui_h * 0.5

var _mouse_xshift = (mouse_x - _xmid) * 0.002
var _mouse_yshift = (mouse_y - _ymid) * 0.002

layer_x("BackgroundLeft", -20 + _mouse_xshift)
layer_y("BackgroundLeft", -20 + _mouse_yshift)

layer_x("BackgroundRight", -20 + _mouse_xshift)
layer_y("BackgroundRight", -20 + _mouse_yshift)

#endregion

