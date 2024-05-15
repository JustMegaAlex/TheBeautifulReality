// Enums for screen views
enum SCREENVIEW
{
	NONE,
	START,
	OPTIONS,
	CREDITS,
}

screen_stack = ds_stack_create()
ds_stack_push(screen_stack, SCREENVIEW.NONE)
state = ds_stack_top(screen_stack)


//Initialise Font, W/H vars
//font = font_add("Dolce Vita.ttf", 22, false, false, 0, 128)
//draw_set_font(font)

gui_w = room_width
gui_h = room_height

layer_enable_fx("LayerBlur", false)

// INIT | Title Vars
sprite_title = sTitle
xpos_title_initial = gui_w * 0.5
ypos_title_initial = gui_h * 0.5
xpos_title_current = gui_w * 0.5
ypos_title_current = gui_h * 0.5
title_anim_timer_max = 400
title_anim_timer = title_anim_timer_max * 0.2	//This is also the point where the buttons come
title_image_index = 0


// INIT | Title Buttons
//Coordinate button appearance with first title glitch anim
// the -7 is a manual adjustment, since the glitch starts 10 frames before title_anim_timer
buttons_timer = title_anim_timer - 7

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
button_scale_array = [1.4, 1.4, 1.4, 1.4]
button_click_array = [0, 0, 0, 0]

function clock_in(){
	room_goto(rmStart)
}




// INIT | Other Views
backbutton_sprite = sStartScreenButtonOptions
backbutton_text = "BACK"
backbutton_rot1 = 0
backbutton_rot2 = 0
backbutton_rot3 = 0
backbutton_scale = 1.4
backbutton_click = 0

options_ypos_array = [gui_h, gui_h, gui_h, gui_h, gui_h]
options_text_array = ["SOUND EFFECTS", "MUSIC", "BRIGHTNESS", "FONT SIZE", "CURSOR SIZE"]
options_value_array = [global.audio.sfxlevel, global.audio.bgmlevel, global.accessibility.brightness, global.accessibility.fontsize, global.accessibility.cursorsize]


