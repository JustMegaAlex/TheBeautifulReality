// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sfx_play(_sfx, _gain){
	
	var _final_gain = _gain * global.audio.sfxlevel
	
	audio_play_sound(_sfx, 0, false, _gain)

}