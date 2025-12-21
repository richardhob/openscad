
include <defines.scad>

module screw_hole(x, y, z, d1, d2, depth, wall=1) {
    // Cone
    translate([x, y, (depth/2)+(wall/2)]) {
        cylinder(d1=d1, d2=d2, h=(depth/2)+wall, $fn=100);
    }

    // Hole
    translate([x, y, -wall]) {
        cylinder(d=d1, h=(depth/2)+2*wall, $fn=100);
    }
}

module one_hole2(height, length, depth, wall, extension, hole, head) {
    h = height + (2*wall);
    l = length + (2*wall);
    d = depth  + (2*wall);

    difference() {
        translate([0, -extension, 0]) {
            cube([h, l+extension, d]);
        }

        translate([wall, wall, wall]) {
            cube([height, 2*length, depth]);
        }

        screw_hole(0.75*h, -extension/2, d, hole, head, depth=d);
        screw_hole(0.25*h, -extension/2, d, hole, head, depth=d);
    }
}

one_hole2(
    HEIGHT+PAD_H, 
    MOUNT_LENGTH+PAD_L, 
    DEPTH+PAD_D, 
    WALL,
    CUSTOM,
    HOLE,
    HEAD
);

