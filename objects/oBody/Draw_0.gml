draw_self()

for(var i=0; i<array_length(body_parts); ++i) {
    draw_sprite_ext(body_parts[i], 0, x, y, body_parts_scale, body_parts_scale,
                    0, c_white, 1)
}
draw_sprite_ext(sBodyShirt, 0, x, y, body_parts_scale, body_parts_scale,
                0, c_white, 1)
draw_sprite_ext(sBodyBlanket, 0, x, 
                y + sprite_get_height(sBodyShirt) * body_parts_scale - 10, 
                body_parts_scale, 0.8,
                0, c_white, 1)
