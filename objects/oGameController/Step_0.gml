if keyboard_check_pressed(vk_f1) {
    show_debug_overlay(!is_debug_overlay_open(), true, 1, 0.5)
}
if keyboard_check_pressed(vk_f2) {
    show_debug_log(!is_debug_overlay_open())
}

DebugDrawUpdate()
