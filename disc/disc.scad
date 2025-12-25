
// Guess width: 12 cm
// Guess height: 3 cm

include <quad2.scad>
include <BOSL2/std.scad>

a = [0, 3];
b = [12, 2];
c = [15, 1.5];

d = [15, 1.5];
e = [13, 0.75];
f = [12, 0];

g = [12, 1.5];
h = [10, 1.75];
i = [0, 2.5];

module profile() {
    points = concat(
        quadratic_path(a, b, c, 50),
        quadratic_path(d, e, f, 50),
        quadratic_path(g, h, i)
    );

    polygon(points);
}

module disc() {
    rotate_extrude(angle=360, convexity=10, $fn=50) profile();
}

// profile();
disc();