
module sensor(sensor_diameter, thickness, height)
{
    difference() {
        cylinder(d=sensor_diameter + 2*thickness, h=height, $fn=50);
        sensor_hole(sensor_diameter, height);
    }
}

module sensor_hole(sensor_diameter, height) {
    translate([0, 0, -height/2]) cylinder(d=sensor_diameter, h=height+height, $fn=50);
}

module fan_mount(fan_width, screw_diameter, screw_distance, thickness, height) {
    difference() {
        cube([fan_width, thickness, height]);
        rotate([0, 90, -90]) {
            translate([-height/2, screw_distance, -thickness*1.5]) cylinder(d=screw_diameter, h=thickness+thickness, $fn=10);
            translate([-height/2, fan_width-screw_distance, -thickness*1.5]) cylinder(d=screw_diameter, h=thickness+thickness, $fn=10);
        }
    }
}

module mount(sensor_diameter, fan_width, screw_diameter, screw_distance, thickness, height) {
    fan_mount(fan_width, screw_diameter, screw_distance, thickness, height);
    
    sd2 = (sensor_diameter/2);
    t2 = (thickness/2);
    translate([-(sd2+t2+t2), -(sd2), 0]) sensor(sensor_diameter, thickness, height);
    // Piece that connects fan mount to sensor holder
    difference() {
        translate([-(sd2+t2+t2), -(sd2), 0]) cube([sd2+t2+t2, sd2+t2+t2, height]);
        translate([-(sd2+t2+t2), -(sd2), 0]) sensor_hole(sensor_diameter, height);
    }
}

mount(18, 40, 2.5, 4, 4, 5);
