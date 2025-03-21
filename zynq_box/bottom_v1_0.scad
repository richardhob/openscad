
include <defines.scad>

module bottom(width, length, height, wall, strap_width, radius=1) {
    assert(wall > 2*radius);
    difference() {
        rounded_cube1([width+wall, length+wall, height+wall+wall/4], radius, center=true);
        translate([0, 0, wall+wall]) rounded_cube1([width, length, height], radius, center=true);

        translate([0, 0, -height/2-wall]) {
            rounded_cube1([width+wall+wall, strap_width, wall], radius, center=true);
        }
    }
}

bottom(WIDTH, LENGTH, HEIGHT, WALL, STRAP, RADIUS);
