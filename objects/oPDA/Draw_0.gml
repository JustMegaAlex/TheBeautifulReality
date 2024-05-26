//draw_sprite(sprite_index, 0, x, y)

////Replace with PDA surface
//draw_sprite(sprite_index, 1, x, y)

draw_self()

surface_set_target(pda_text_surface)
draw_sprite_ext(sprite_index, 0, sprite_xoffset, sprite_yoffset - pda_text_surf_top_gap,
                image_xscale, image_yscale, 0, c_white, 1)
draw_text_scribble_ext(20, 20 - pda_text_scroll, pda_text, pda_text_w)
surface_reset_target()


draw_surface(pda_text_surface, bbox_left, bbox_top + pda_text_surf_top_gap)

//// temp info drawing
// if instance_exists(oBody) {
// }

pull_out_button.draw()
prev_page_button.draw()
next_page_button.draw()

draw_set_valign(fa_middle)
draw_set_halign(fa_center)

draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
