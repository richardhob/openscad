
module shell(d1, d2, height, wall) {
    cylinder(d1=d1, d2=d2, h=wall, $fn=100);
    cylinder(h=height, d=d2, $fn=100);
}

module hole(diameter, height) {
    cylinder(height, d=diameter, $fn=100);
}

module slot(diameter, height, rope) {
    offset = (height)/2;
    union() {
        rotate([0, 90, 0]) cylinder(d=rope, h=diameter*1.5, center=true, $fn=50);
        translate([0, 0, rope/4]) cube([diameter*1.5, rope, 0.1+rope/2], center=true);
    }
}

module cupholder(diameter, height, wall, rope) {
    half = (height/2) - (rope/2);
    difference() {
        shell(1.25*diameter, diameter, height, 2*wall);
        translate([0, 0, 1.5*rope]) hole(diameter-wall, height);
        translate([0, 0, rope]) slot(diameter, height, rope);
        rotate ([0, 0, 90]) translate([0, 0, 1.50 * rope]) twist(diameter, half+0.1, rope, 1);
        rotate ([0, 0, 240]) translate([0, 0, rope+height/2]) twist(diameter, half+0.1, rope, -1);
    }
}

module twist(diameter, height, rope, dir) {
    linear_extrude(height=height, convexity=10, twist=dir*30, $fn=1000) square([rope, 2*diameter], center=true);
}

cupholder(66, 66, 5, 5);