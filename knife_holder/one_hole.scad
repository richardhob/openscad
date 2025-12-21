
include <defines.scad>

module one_hole(height, length, depth, wall, bottom_d=1, top_d=1) {
    h = height + (2*wall);
    l = length + (2*wall);
    d = depth  + (2*wall);

    assert(l > bottom_d);
    assert(l > top_d);

    difference() {
        cube([h, l, d]);
        translate([wall, wall, wall]) {
            cube([2*height, length, depth]);
        };

        // BOTTOM HOLES
        translate([h/2, l*(1/4), -2*wall]) {
            cylinder(h=4*wall, d=bottom_d, $fn=100);
        };
        translate([h/2, l*(3/4), -2*wall]) {
            cylinder(h=4*wall, d=bottom_d, $fn=100);
        };

        // TOP HOLES
        // (Bigger for tool access)
        translate([h/2, l*(1/4), d-2*wall]) {
            cylinder(h=4*wall, d=top_d, $fn=100);
        };
        translate([h/2, l*(3/4), d-2*wall]) {
            cylinder(h=4*wall, d=top_d, $fn=100);
        };
    }
}

one_hole(
    HEIGHT+PAD_H, 
    LENGTH+PAD_L, 
    DEPTH+PAD_D, 
    WALL,
    bottom_d=BOTTOM_HOLE_DIAMETER, 
    top_d=TOP_HOLE_DIAMETER);
