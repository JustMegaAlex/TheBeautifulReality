//Intro Sequence Timer (in frames)
countdown_max = 700
countdown_current = countdown_max

logo_fadeinpoint = 120	//After x frames, logo fades in.
logo_fadeintime = 120	//Duration of fade-in, frames.
logo_onscreentime = 60	//For x frames, logo stays on screen.
logo_fadeoutpoint = logo_fadeinpoint + logo_fadeintime + logo_onscreentime //After x frames, logo fades out.
logo_fadeouttime = 120	//Duration of fade-out, frames.

//Initial window size etc
window_width = room_width
window_height = room_height

sprite_logo = sHallowQuestLogo


rectangle_blink_frames = [230, 229, 228, 150, 149, 148, 120, 119, 118, 112, 111, 110, 107, 106]
