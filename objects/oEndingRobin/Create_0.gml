audio_stop_all()

sprite_index = global.ending_version 
                    ? sEndingRobinFree : sEndingRobinTrapped

//Starting Fade-in
//Stage 1: Black BG
bg1_timer = 120
bg1_alpha = 1
//Stage 2: Only Robin
onlyrobin_timer = 120

//Stage 3: Fade in the true BG
bg2_timer = 120
bg2_alpha = 1

starting_timer = bg1_timer + onlyrobin_timer + bg2_timer
timer_current = starting_timer
//Once this timer counts down to zero, start the VO

//Ending Fade-out
fadeout = false
fadeout_timer_max = 120
fadeout_current = fadeout_timer_max
fadeout_alpha = 0

//Ending Text
endtext = false

//SFX
ad_sound = noone
