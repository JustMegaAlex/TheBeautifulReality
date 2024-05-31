//No draw self - draw sprite
draw_sprite(sprite_index, image_index, x, y)


//Starting Fade-In
//Main Countdown
if (timer_current > 0){
	timer_current --

	if (timer_current > (starting_timer - bg1_timer)){

		draw_set_alpha(bg1_alpha)
		draw_set_color(c_black)
		draw_rectangle(0, 0, room_width, room_height, 0)
		draw_set_alpha(1)
		draw_set_color(c_white)

	} else if (timer_current > 0){
	
		draw_set_alpha(bg2_alpha)
		draw_set_color(c_black)
		draw_rectangle(0, 0, room_width, room_height, 0)
		draw_set_alpha(1)
		draw_set_color(c_white)
	
		if (timer_current < bg2_timer){
			bg2_alpha = timer_current/bg2_timer
		}
	
		draw_sprite(sprite_index, image_index, x, y)	
	}
}


//SFX Cues
if (timer_current == bg2_timer){
	ad_sound = sfx_play(sfxSomniumAdVO, 0.75)
}






//Fade-out
if (timer_current == 0){
	if !audio_is_playing(ad_sound)
	fadeout = true
}


if (fadeout == true){
	
	draw_set_alpha(fadeout_alpha)
	draw_set_color(c_black)
	draw_rectangle(0, 0, room_width, room_height, 0)
	draw_set_alpha(1)
	draw_set_color(c_white)	
	
	fadeout_alpha = (1 - (fadeout_current/fadeout_timer_max))
	
	if (fadeout_current > 0){
		fadeout_current --
	} else {
		endtext = true
	}

}

if (endtext == true){
	
	draw_set_alpha(1)
	draw_set_color(c_black)
	draw_rectangle(0, 0, room_width, room_height, 0)
	draw_set_alpha(1)
	draw_set_color(c_white)		
	
	scribble("Thank you for playing.").draw(300, 300)
	
}