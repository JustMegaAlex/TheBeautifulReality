

if (countdown_current > 0){
	countdown_current --
} else {
	instance_destroy()
	instance_create_layer(0, 0, "Instances", oStartScreen)
}


/// 1 | BLACK RECTANGLE
// Starts as a black screen
// After 30 frames, fade the logo in
var _alpha = 1
var _color = c_black

//Glitch/blink this rectangle out at specific frames (from the array)
for (var i = 0; i < array_length(rectangle_blink_frames); i++){
	if countdown_current = rectangle_blink_frames[i]{
		_alpha = choose(0.6, 0.9)
		_color = choose(c_green, c_teal, c_maroon)
		
		repeat(choose(6, 10)){
			var _x1 = random_range(0, window_width)
			var _y1 = random_range(0, window_height)
			var _x2 = random_range(0, window_width)
			var _y2 = random_range(0, window_height)
			
			draw_set_color(choose(c_green, c_red, c_black))
			draw_rectangle(_x1, _y1, _x2, _y2, 0)
			draw_set_color(c_white)
		}
		
	}
}

//Draw Rectangle
draw_set_alpha(_alpha)
draw_set_color(_color)
draw_rectangle(0, 0, room_width, room_height, 0)
draw_set_alpha(_alpha)
draw_set_color(c_white)


// 2 | HALLOWQUEST LOGO
// After 30 frames, fade the logo in. Logo fade-in time: 30 frames
// Then stay for 30 frames.
// Finally, fade out for 30 frames.

//Get screen midpoints
var _xmid = window_width * 0.5
var _ymid = window_height * 0.5

var _alpha = 0	//alpha of the logo sprite



//2.1 FADE IN (glitch shader in the future though)
//Fade in when: the countdown reaches 30 frames after start.
if (countdown_current < (countdown_max - logo_fadeinpoint)) {
	var _alpha_zero = (countdown_max - logo_fadeinpoint)	//At this point alpha should be 0
	var _alpha_one = (countdown_max - logo_fadeinpoint - logo_fadeintime)	//At this point alpha should be 1	
	// Maths to convert the above bit into a 0-to-1 scale
	_alpha = (1 - (countdown_current - _alpha_one)/(_alpha_zero - _alpha_one))
}

//2.2 STAY
//Do nothing

//2.3 FADE OUT
//Fade out when: the countdown reaches 90 frames after start.
//Reversing the same code above. Just overwriting _alpha.
if (countdown_current < (countdown_max - logo_fadeoutpoint)) {
	var _alpha_one = (countdown_max - logo_fadeoutpoint)	//At this point alpha should be 1
	var _alpha_zero = (countdown_max - logo_fadeoutpoint - logo_fadeouttime)	//At this point alpha should be 0
	// Maths to convert the above bit into a 0-to-1 scale
	_alpha = ((countdown_current - _alpha_zero)/(_alpha_one - _alpha_zero))
}

//Draw Logo Sprite
draw_set_alpha(_alpha)
draw_sprite(sprite_logo, 0, _xmid, _ymid)
draw_set_alpha(1)


draw_text_ext_transformed(5, 5, countdown_current, 10, 100, 0.5, 0.5, 0)