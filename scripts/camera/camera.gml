function CameraSetPos(id, x, y) {
    var cam = view_camera[id]
    camera_set_view_pos(cam,
        x - camera_get_view_width(cam) * 0.5,
        y - camera_get_view_height(cam) * 0.5)
}

function Camw(ind) {
    return camera_get_view_width(view_camera[ind])
}

function Camh(ind) {
    return camera_get_view_height(view_camera[ind])
}

function Camx(ind) {
    return camera_get_view_x(view_camera[ind])
}

function Camy(ind) {
    return camera_get_view_y(view_camera[ind])
}

function CamxCent(ind) {
    return camera_get_view_x(view_camera[ind]) + Camw(ind) * 0.5
}

function CamyCent(ind) {
    return camera_get_view_y(view_camera[ind]) + Camh(ind) * 0.5
}

function PointInCamera(xx, yy, ind) {
    var cx = Camx(ind),
        cy = Camy(ind)
    return (xx > cx) && (xx < (cx + Camw(ind))) &&
        (yy > cy) && (yy < (cy + Camh(ind)))
}
