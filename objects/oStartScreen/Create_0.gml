// Enums for screen views
enum SCREENVIEW {
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
title_anim_timer = title_anim_timer_max *
    0.2 //This is also the point where the buttons come
title_image_index = 0


// INIT | Title Buttons
//Coordinate button appearance with first title glitch anim
// the -7 is a manual adjustment, since the glitch starts 10 frames before title_anim_timer
buttons_timer = title_anim_timer - 7

sprite_clockin = sStartScreenButtonClockIn
sprite_options = sStartScreenButtonOptions
sprite_credits = sStartScreenButtonCredits
sprite_clockout = sStartScreenButtonClockOut

button_sprite_array = [sprite_clockin, sprite_options, sprite_credits,
    sprite_clockout
]

text_clockin = "CLOCK IN"
text_options = "OPTIONS"
text_credits = "CREDITS"
text_clockout = "CLOCK OUT"

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

function clock_in() {
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
backbutton_entrytimer_max = 12
backbutton_entrytimer = backbutton_entrytimer_max
backbutton_visible = false

options_ypos_array = [gui_h, gui_h, gui_h, gui_h, gui_h]

options_text_array = ["SOUND EFFECTS", "MUSIC", "BRIGHTNESS", "FONT SIZE",
    "CURSOR SIZE"
]
options_value_array = [global.audio.sfxlevel, global.audio.bgmlevel, global
    .accessibility.brightness, global.accessibility.fontsize, global
    .accessibility.cursorsize
]


function button_back(){
	//BACK BUTTON
	
	if (backbutton_entrytimer > 0){
		backbutton_entrytimer --
	} else {
		if (backbutton_visible < 1)
		backbutton_visible += 0.2	
	}
	
	//SET X AND Y CENTER
	var _x = gui_w * 0.8
	var _y = gui_h * 0.8
		
	//SET IMAGE SCALE
	var _scale = backbutton_visible
		
	//GET RECTANGLE REGION (the 24 is a buffer so we have +12px on all sides
	var _sw = sprite_get_width(backbutton_sprite) + 24
	var _sh = sprite_get_height(backbutton_sprite) + 24
	var _xtop = _x - (_sw * 0.5)
	var _ytop = _y - (_sh * 0.5)
	var _xbot = _xtop + _sw
	var _ybot = _ytop + _sh
			
	// DO SHIT IF MOUSE IS IN REGION
	var _mouse_in_rect = point_in_rectangle(mouse_x, mouse_y, _xtop, _ytop, _xbot, _ybot)
		
	if _mouse_in_rect{
		backbutton_scale = lerp(backbutton_scale, 1.2, 0.2)
		_scale = backbutton_scale
			
		gpu_set_blendmode(bm_add)
		//BG Sprite 1
		backbutton_rot1 = lerp(backbutton_rot1, 8, 0.1)
		draw_sprite_ext(backbutton_sprite, 0, _x + backbutton_rot1, _y  + backbutton_rot1, _scale, _scale, backbutton_rot1, c_red, 1)
			
		//BG Sprite 2
		backbutton_rot2 = lerp(backbutton_rot2, -8, 0.1)			
		draw_sprite_ext(backbutton_sprite, 0, _x + backbutton_rot2, _y + backbutton_rot2, _scale, _scale, backbutton_rot2, c_blue, 1)
		gpu_set_blendmode(bm_normal)
	} else {
		//Reset the arrays for next time mouse hovers
		backbutton_rot1 = 0
		backbutton_rot2 = 0
		backbutton_scale = 1.4
	}
		

	// DRAW THE MAIN SPRITE + TEXT ABOVE EVERYTHING
	if !_mouse_in_rect{		
		draw_sprite_ext(backbutton_sprite, 0, _x, _y, _scale, _scale, 0, c_white, 0.9)
		draw_set_halign(fa_middle)
		draw_set_valign(fa_center)
		if (backbutton_visible == 1)
		draw_text_ext_transformed_color(_x, _y, backbutton_text, 30, 150, 1, 1, 0, c_black, c_black, c_black, c_black, 1)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
	} else if _mouse_in_rect{		
		draw_sprite_ext(backbutton_sprite, 0, _x, _y, _scale, _scale, 0, c_black, 0.9)
		draw_set_halign(fa_middle)
		draw_set_valign(fa_center)
		if (backbutton_visible == 1)
		draw_text_ext_transformed_color(_x, _y, backbutton_text, 30, 150, _scale, _scale, 0, c_white, c_white, c_white, c_white, 1)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
	}
		
	//Actually do something on mouse click
		
	if (_mouse_in_rect) and (mouse_check_button_pressed(mb_left)){
		options_ypos_array = [gui_h, gui_h, gui_h, gui_h, gui_h]
		ds_stack_pop(screen_stack)
		title_anim_timer = 11
		backbutton_entrytimer = backbutton_entrytimer_max
		backbutton_visible = 0
	}
	
}

// Credits Arrays & Vars

credits_names = ["Adelle Thompson", "Gavrik", "Uneven Pixel", "flatwhitecanvas", 
"Ranarh", "Angela Hinz-Marica", "Paul Shelley", "coinbirdface"]
credits_roles = ["Narrative, Game Design", "Programming, Game Design", 
"Programming, Game Design", "Character Art", "Environmental Art, UI", 
"Composition", "Sound Effects", "Project Management"] 
credits_box1 = sStartScreenButtonOptions
credits_box2 = sNineSlice1
credits_glitch_timer = [6, 6, 6, 6, 6, 6, 6, 6] 
credits_highlighted = [false, false, false, false, false, false, false, false] 

credits_bios = 
["Part time raccoon, full time gamer and cat mom. A narrative designer with lots of love for creating engaging interactive stories.",
"Alex Gavrik \nProgrammer-artist who loves to code games",
"",
"Flat White Canvas: \ncharacter artist \nwild magic sorcerer \npress Y to honk",
"Ranarh is a 2D illustrator and game art generalist with an emphasis on conceptual and environment work. No genre is left untouched from horror to children's entertainment, and from FPS to visual novels.",
"Composes music for games because every epic quest needs a soundtrack as dramatic as my coffee addiction!",
"Freelance technical game sound designer with a violin making background and passion for accessibility in games",
"Loves games."]

credits_bios_box_rot1 = [0, 0, 0, 0, 0, 0, 0, 0]
credits_bios_box_rot2 = [0, 0, 0, 0, 0, 0, 0, 0]
credits_bios_box_scale = [1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2]

