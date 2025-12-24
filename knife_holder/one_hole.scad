
include <defines.scad>

module one_hole(height, length, depth, wall, hole, head) {
    h = height + (2*wall);
    l = length + (2*wall);
    d = depth  + (2*wall);

    assert(l > hole);
    assert(l > head);

    difference() {
        cube([h, l, d]);
        translate([wall, wall, wall]) {
            cube([height, 2*length, depth]);
        };

        translate([2*wall, -4*wall, 2*wall]) {
            cube([height-(2*wall), length, depth-(2*wall)]);
        };

        // BOTTOM HOLES
        translate([h*(1/4), l*(1/2), -2*wall]) {
            cylinder(h=4*wall, d=hole, $fn=100);
        };
        translate([h*(3/4), l*(1/2), -2*wall]) {
            cylinder(h=4*wall, d=hole, $fn=100);
        };

        // TOP HOLES
        // (Bigger for tool access)
        translate([h*(1/4), l*(1/2), d-2*wall]) {
            cylinder(h=4*wall, d=head, $fn=100);
        };
        translate([h*(3/4), l*(1/2), d-2*wall]) {
            cylinder(h=4*wall, d=head, $fn=100);
        };
    }
}

one_hole(
    HEIGHT+PAD_H, 
    MOUNT_LENGTH+PAD_L, 
    DEPTH+PAD_D, 
    WALL,
    HOLE,
    HEAD
);
