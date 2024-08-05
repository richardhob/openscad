
LITTLE_CAN_DIAMETER = 53; // mm
BIG_CAN_DIAMETER = 66; // mm
BIG_CAN_HEIGHT = 66; // mm

diameter = BIG_CAN_DIAMETER + 4; // mm
second_diameter = LITTLE_CAN_DIAMETER + 3; // mm
wall_width = 5; // mm
rope_diameter= 6; // mm
height = ((2/3)* BIG_CAN_HEIGHT) + 2 * wall_width; // mm

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

module cupholder(diameter, second_diameter, height, wall, rope) {
    half = (height/2) - (rope/2);
    outer_diameter = diameter + wall;
    difference() {
        shell(1.25*outer_diameter, outer_diameter, height, 2*wall);
        
        // Main hole (for the normal size can)
        translate([0, 0, 2*rope]) hole(diameter, height);
        
        // Smaller hole (for Red Bulls!)
        translate([0, 0, 1.5*rope]) hole(second_diameter, height);
        
        // Slot on the bottom for the rope
        translate([0, 0, rope]) slot(outer_diameter, height, rope);
        
        // Side slots
        rotate ([0, 0, 90]) translate([0, 0, 1.50 * rope]) twist(outer_diameter, half+0.1, rope, 1);
        
        rotate ([0, 0, 240]) translate([0, 0, rope+height/2]) twist(outer_diameter, half+0.1, rope, -1);
    }
}

module twist(diameter, height, rope, dir) {
    linear_extrude(height=height, convexity=10, twist=dir*30, $fn=1000) square([rope, 2*diameter], center=true);
}

cupholder(diameter, second_diameter, height, wall_width, rope_diameter);
