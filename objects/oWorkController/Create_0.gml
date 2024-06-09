
need_to_process = choose(2, 3, 4)
processed = 0

draw_x = 120
draw_y = room_height * 0.84

function jobDone() {
    return processed >= need_to_process
}
