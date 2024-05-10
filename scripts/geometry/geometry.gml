function Point(_x, _y) constructor {
    x_ = _x
    y_ = _y

    static add = function(dx, dy) {
        return new Point(self.x_ + dx, self.y_ + dy)
    }
}

function Vec2d(xx, yy, is_polar = false) constructor {
    X = xx
    Y = yy

    add_coords = function(xx, yy) {
        self.X += xx
        self.Y += yy
        return self
    }

    add_coords_ = function(xx, yy) {
        return new Vec2d(self.X + xx, self.Y + yy)
    }

    add = function(vec) {
        self.X += vec.X
        self.Y += vec.Y
        return self
    }

    add_ = function(vec) {
        return new Vec2d(self.X + vec.X, self.Y + vec.Y)
    }

    sub = function(vec) {
        self.X -= vec.X
        self.Y -= vec.Y
        return self
    }

    sub_ = function(vec) {
        return new Vec2d(self.X - vec.X, self.Y - vec.Y)
    }

    dir = function() {
        return point_direction(0, 0, X, Y)
    }

    len = function() {
        return point_distance(0, 0, X, Y)
    }

    normalize = function(len) {
        if len == undefined
        len = 1
        var l = self.len()
        if l == 0
        return self
        self.X *= len / l
        self.Y *= len / l
        return self
    }

    set = function(xx, yy) {
        self.X = xx
        self.Y = yy
        return self
    }

    set_polar = function(l, dir) {
        self.X = lengthdir_x(l, dir)
        self.Y = lengthdir_y(l, dir)
        return self
    }

    add_polar = function(l, dir) {
        self.X += lengthdir_x(l, dir)
        self.Y += lengthdir_y(l, dir)
        return self
    }

    add_polar_ = function(l, dir) {
        return new Vec2d(self.X, self.Y).add_polar(l, dir)
    }

    rotated = function(angle) {
        return new Vec2d(self.len(), self.dir() + angle, true)
    }

    rotate = function(angle) {
        self.set_polar(self.len(), self.dir() + angle)
        return self
    }

    copy = function() {
        return new Vec2d(self.X, self.Y)
    }

    eq = function(vec) {
        return (self.X == vec.X) and(self.Y == vec.Y)
    }

    move_to_vec = function(vec, sp_mag) {
        var delta = vec.sub_(self)
        if delta.len() < sp_mag
        return self.set(vec.X, vec.Y)
        var sp = delta.normalize(sp_mag)
        return self.add(sp)
    }

    approach = function(to, sp) {
        X = global.approach(X, to.X, sp.X)
        Y = global.approach(Y, to.Y, sp.Y)
        return self
    }

    absolutize = function() {
        X = abs(X)
        Y = abs(Y)
        return self
    }

    mult = function(n) {
        X *= n
        Y *= n
        return self
    }

    mult_ = function(n) {
        return new Vec2d(X * n, Y * n)
    }

    if is_polar == true
    self.set_polar(xx, yy)
}


function Line(_xst, _yst, _xend, _yend) constructor {
    xst = _xst
    yst = _yst
    xend = _xend
    yend = _yend

    static mult = function(m) {
        xend = xst + (xend - xst) * m
        yend = yst + (yend - yst) * m
    }

    static set = function(_xst, _yst, _xend, _yend) {
        xst = _xst
        yst = _yst
        xend = _xend
        yend = _yend
    }

    static setst = function(_xst, _yst) {
        xst = _xst
        yst = _yst
    }

    static setend = function(_xend, _yend) {
        xend = _xend
        yend = _yend
    }

    static draw = function() {
        draw_line(xst, yst, xend, yend)
    }

    static get_point_on = function(m) {
        var xx = xst + (xend - xst) * m
        var yy = yst + (yend - yst) * m
        return new Vec2d(xx, yy)
    }

    static len = function() {
        return point_distance(xst, yst, xend, yend)
    }
}

function geom_draw_multiline(points, w = 1, c = c_white) {
    for (var i = 0; i < array_length(points) - 1; ++i) {
        var p = points[i]
        var pp = points[i + 1]
        draw_line_width_color(p.X, p.Y, pp.X, pp.Y, w, c, c)
    }
}

function geometry_draw_line(line, col = c_white) {
    draw_line_color(line.xst, line.yst, line.xend, line.yend, col, col)
}