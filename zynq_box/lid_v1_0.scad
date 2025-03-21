
include <defines.scad>

module lid(width, length, wall, strap_width, radius=1, buffer=1) {
    assert(wall > 2*radius);
    difference() {
        union() {
            // Bigger piece (the lipped section)
            rounded_cube1([width+wall, length+wall, wall], r=radius, center=true);

            // Taller piece (allows nesting)
            translate([0, 0, wall/2]) rounded_cube1([width-buffer, length-buffer, wall], r=radius, center=true);
        }

        // Strap
        translate([0, 0, -wall/2-wall/4]) rounded_cube1([width+wall+wall, strap_width, 1.1*wall], r=radius, center=true);
    }
}

lid(WIDTH, LENGTH, WALL, STRAP, RADIUS, BUFFER);
