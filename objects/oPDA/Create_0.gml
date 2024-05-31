pda_open = false
pda_spd = 32
pda_target_y[0] = 16
pda_target_y[1] = sprite_height + 50
pda_text = ""
pda_text_w = sprite_width * 0.7
pda_text_max_h = sprite_height * 0.8
pda_text_scroll = 0
pda_text_h = 0
pda_text_surf_top_gap = 32 * image_yscale
pda_text_surf_bottom_gap = 90 * image_yscale
pda_text_surface = surface_create(
    sprite_width,
    sprite_height - pda_text_surf_top_gap - pda_text_surf_bottom_gap)

open_callback = undefined
close_callback = undefined

x = room_width - (sprite_width / 2)

subscreen = 0
subscreen_option = 0

for (var i = 0; i < 5; i++) {
    option_active = false
    option_name[i] = ""
    option_eid[i] = ""
    option_desc[i] = ""
}

function Button(left, top, right, bottom, label, action=undefined) constructor {
    self.left = left
    self.top = top
    self.right = right
    self.bottom = bottom
    self.label = label
    self.hover = false
    self.visible = true
    self.action = action ?? function () {}

    step = function() {
        hover = false
        if point_in_rectangle(mouse_x, mouse_y, left, top, right, bottom) {
            hover = true
            if mouse_check_button_pressed(mb_left) {
                action()
            }
        }
    }
    
    draw = function() {
        if !visible {
            return
        }
        if hover {
            draw_set_alpha(0.1)
            draw_rectangle(left, top, right, bottom, false)
        }
        var _nohoveralpha = 0.25
        draw_set_color(c_black)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_center)
        draw_set_alpha(_nohoveralpha + (hover * (1 - _nohoveralpha)))
        var xx = (right + left) * 0.5, yy = (top + bottom) * 0.5
        draw_text(xx, yy, label)
        draw_set_alpha(1)
    }
}


pull_out_button = new Button(bbox_left, 0, bbox_right, 32, "Pull out PDA", 
    function() {
		var _sound_pda = pda_open ? sfxPDAOpen : sfxPDAClose		
		sfx_play(_sound_pda, 1)
		
        pda_open = !pda_open
        oMerry.setActive(pda_open)
        if instance_exists(oBody) {
            setText(string(oBody.info) + "\nItems needed: " + string(oBody.props_count))
        }
        label = pda_open ? "Put away PDA" : "Pull out PDA"
        if !pda_open {
            oPDA.prev_page_button.visible = false
            oPDA.next_page_button.visible = false
            if close_callback != undefined {
                close_callback()
                close_callback = undefined
            }
        } else {
            if open_callback != undefined {
                open_callback()
                open_callback = undefined
            }
        }
    }
)

var yy = pda_target_y[1] - 8
prev_page_button = new Button(bbox_left,
                              yy - 32,
                              bbox_left + sprite_width * 0.3,
                              yy, "previous",
    function() {
        id.pda_text_scroll -= 60
        id.pda_text_scroll = max(0, id.pda_text_scroll)
    }
)

next_page_button = new Button(bbox_left + sprite_width * 0.7,
                              yy - 32,
                              bbox_right,
                              yy, "next",
    function() {
        id.pda_text_scroll += 60
        id.pda_text_scroll = min(id.pda_text_scroll, id.pda_text_h)
    }
)
prev_page_button.visible = false
next_page_button.visible = false

function setCloseCallback(callback) {
    close_callback = callback
}

function setOpenCallback(callback) {
    open_callback = callback
}

function setText(text) {
	pda_text_count = 1000
    pda_text_scroll = 0
    if string_height_scribble_ext(text, pda_text_w) > pda_text_max_h {
        prev_page_button.visible = true
        next_page_button.visible = true
        pda_text_h = string_height_scribble_ext(text, pda_text_w)
    }
    pda_text = "[c_black][fa_left][fa_top][fMain]" + text
}

function interact(item) {
    if item.is_readable {
        setText(item.text)
    }
}
