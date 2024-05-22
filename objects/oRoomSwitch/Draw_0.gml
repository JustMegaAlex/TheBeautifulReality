draw_self()

if is_hint_on {
	
	var _w = 160
	var _h = 70
	var _xtop = min(mouse_x + 50, room_width - _w)
	var _ytop = min(mouse_y, room_height - _h)
//	draw_sprite_stretched(sNineSlice1, 0, _xtop, _ytop, _w, _h)
	
	var _xtextstart = _xtop + 10
	var _ytextstart = _ytop + 25
	
	draw_set_valign(fa_center)
	draw_set_halign(fa_left)
	draw_set_color(c_black)
	draw_text(_xtextstart, _ytextstart, hint_text)
	draw_set_color(c_white)
	draw_set_valign(fa_top)
	draw_set_halign(fa_middle)
}
