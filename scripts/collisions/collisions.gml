function Move(sp, dir) {
    x += lengthdir_x(sp, dir)
    y += lengthdir_y(sp, dir)
}

function MoveCoord(hsp, vsp) {
    x += hsp
    y += vsp
}

function MoveCoordContactObj(hsp, vsp, obj) {
    MoveCoord(hsp, vsp)
    var contact = instance_place(x, y, obj)
    while (contact) {
        // compute relative movement
        var dir = point_direction(0, 0, hsp, vsp)
        // move out of an object
        while (place_meeting(x, y, contact)) {
            x -= lengthdir_x(1, dir)
            y -= lengthdir_y(1, dir)
        }
        var new_contact = instance_place(x, y, obj)
        if (!new_contact) {
            return contact
        }
        contact = new_contact
    }
    return contact
}

function MoveContactObj(sp, dir, obj) {
    Move(sp, dir)
    //collision
    var contact = instance_place(x, y, obj)
    while (contact) {
        // compute relative movement
        // move out of an object
        while (place_meeting(x, y, contact)) {
            x -= lengthdir_x(1, dir)
            y -= lengthdir_y(1, dir)
        }
        var new_contact = instance_place(x, y, obj)
        if (!new_contact) {
            return contact
        }
        contact = new_contact
    }
    return contact
}

tiles_cell_size = 64
/// @arg xx - relative x
/// @arg yy - relative y
function CollidingTiles(xx, yy) {
    var tilemap = layer_tilemap_get_id("Tiles")
    var right = (bbox_right + xx) div global.tiles_cell_size
    var top = (bbox_top + yy) div global.tiles_cell_size
    var left = (bbox_left + xx) div global.tiles_cell_size
    var bottom = (bbox_bottom + yy) div global.tiles_cell_size

    // top and bottom bounds
    for (var i = left; i <= right; ++i) {
        if (tilemap_get(tilemap, i, top) ||
            tilemap_get(tilemap, i, bottom)) {
            return true
        }

    }
    // left and right bounds
    for (var i = top; i <= bottom; ++i) {
        if (tilemap_get(tilemap, left, i) ||
            tilemap_get(tilemap, right, i)) {
            return true
        }
    }
    return false
}

function PointCollisionTiles(xx, yy) {
    var tilemap = layer_tilemap_get_id("Tiles")
    return tilemap_get(tilemap, xx div global.tiles_cell_size, yy div global.tiles_cell_size)
}

function ResolveTileCollision(hsp, vsp) {
    var dir = point_direction(0, 0, hsp, vsp)
    var collided = false
    while (CollidingTiles(0, 0)) {
        x -= lengthdir_x(1, dir)
        y -= lengthdir_y(1, dir)
        collided = true
    }
    return collided
}

//// ToDo: redo this algo, as it can give mistakes
function LineCollidingTiles(x0, y0, x1, y1) {
    /*
    Check all inner points of a line
    with step = tiles_size. There can be double checks,
    and in some corner cases collision can be missed
    */
    var dir = point_direction(x0, y0, x1, y1)
    var dist = point_distance(x0, y0, x1, y1)
    var steps = dist div global.tiles_cell_size
        // if there's fracture remainder add one step
        +
        (dist mod global.tiles_cell_size != 0)
    var dx = lengthdir_x(global.tiles_cell_size, dir)
    var dy = lengthdir_y(global.tiles_cell_size, dir)
    repeat(steps) {
        if (PointCollisionTiles(x0, y0)) {
            return true
        }
        x0 += dx
        y0 += dy
    }
    return PointCollisionTiles(x1, y1)
}