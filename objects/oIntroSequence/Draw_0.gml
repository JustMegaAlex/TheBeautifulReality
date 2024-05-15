if keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left)
countdown_current = 2

if (countdown_current > 0){
	countdown_current --
} else {
	instance_destroy()
	instance_create_layer(0, 0, "Instances", oStartScreen)
	emitter1_bus.effects[0].bypass = true;
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

//Cut out this rectangle at 100 frames remaining.
if (countdown_current < 100)
_alpha = 0

//Draw Rectangle
draw_set_alpha(_alpha)
draw_set_color(_color)
draw_rectangle(0, 0, room_width, room_height, 0)
draw_set_alpha(_alpha)
draw_set_color(c_white)

// ADDITION: Momentary Title Sprite | Hardcoded, sorry. 
if (countdown_current < 178) and (countdown_current > 170){
	gpu_set_blendmode(bm_add)	
	draw_set_alpha(0.2)
	draw_sprite(sTitle, 2, window_width * 0.5, window_height * 0.5)
	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)
}

if (countdown_current < 167) and (countdown_current > 163){
	draw_set_alpha(0.2)
	gpu_set_blendmode(bm_add)

	repeat(4){
		var _x = window_width * 0.5 + random_range(-15, 15)
		var _y = window_height * 0.5 + random_range(-15, 15)
		draw_sprite(sTitle, 2, _x, _y)
	}
	
	gpu_set_blendmode(bm_normal)
	draw_set_alpha(1)
}

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

// FINAL | Final Rect + Title Fade In
// In the last 100 frames, after everything else is done.

if (countdown_current < 100){
	// Draw another black rectangle, fade out in the last 6 frames (just to ease the eyes)
	
	var _alpha = min(1, (countdown_current/6))
	
	draw_set_alpha(_alpha)
	draw_set_color(c_black)
	draw_rectangle(0, 0, room_width, room_height, 0)
	draw_set_color(c_white)
	draw_set_alpha(1)

	//Get screen midpoints
	var _xmid = window_width * 0.5
	var _ymid = window_height * 0.5

	// With 100 frames left, convert to a 0-to-1 alpha, times 0.5 
	//(to reach a max of 0.5 alpha)
	var _alpha = ((100 - countdown_current) / 100) * 1

	draw_set_alpha(_alpha)
	draw_sprite(sTitle, 0, _xmid, _ymid)
	draw_set_alpha(1)	
	
	//Audio test | ignore for now
	audio_sound_gain(bgm_play_lpf, countdown_current/100, 1)
	audio_sound_gain(bgm_play_regular, (100 - countdown_current)/100, 1)	
}
