// Initialise Font, W/H vars
font = font_add("Dolce Vita.ttf", 22, false, false, 0, 128)
draw_set_font(font)

gui_w = room_width
gui_h = room_height

// INIT | Title Vars
sprite_title = sTitle
xpos_title_initial = gui_w * 0.5
ypos_title_initial = gui_h * 0.5
xpos_title_current = gui_w * 0.5
ypos_title_current = gui_h * 0.5
title_anim_timer_max = 500
title_anim_timer = title_anim_timer_max * 0.1	//This is also the point where the buttons come
title_image_index = 0


// INIT | Buttons
//Coordinate button appearance with first title glitch anim
// the -10 is a manual adjustment, since the glitch starts 10 frames before title_anim_timer
buttons_timer = title_anim_timer - 10

sprite_clockin = sStartScreenButtonClockIn
sprite_options = sStartScreenButtonOptions
sprite_credits = sStartScreenButtonCredits
sprite_clockout = sStartScreenButtonClockOut

button_sprite_array = [sprite_clockin, sprite_options, sprite_credits, sprite_clockout]

text_clockin = "CLOCK IN"
text_options = "OPTIONS"
text_credits = "CREDITS"
text_clockout = "CLOCKOUT"

button_text_array = [text_clockin, text_options, text_credits, text_clockout]

//BG Sprite Rotation Arrays
//These arrays hold the rotation values for the background button sprites
//When mouse hover, BG sprites draw + rotate around slowly.
//Arrays hold the rotation values. Rot1, Rot2, Rot3 = BG1, BG2, Main Sprite
button_rot1_array = [0, 0, 0, 0]
button_rot2_array = [0, 0, 0, 0]
button_rot3_array = [0, 0, 0, 0]
button_scale_array = [1.5, 1.5, 1.5, 1.5]
button_click_array = [0, 0, 0, 0]

function clock_in(){
	room_goto(rmStart)
}


