
include <defines.scad>
include <connector.scad>

LENGTH_REFERENCE_INCHES = 5.25;
HEIGHT_REFERENCE_INCHES = 2.50;

CONNECTOR_A_WIDTH_INCHES = 0.30;
CONNECTOR_A_OFFSET_INCHES = 0.08;

CONNECTOR_B_WIDTH_INCHES = 0.40;
CONNECTOR_B_OFFSET_INCHES = 0.15;

LENGTH_REFERECE = LENGTH_REFERENCE_INCHES * INCHES_TO_MM;
HEIGHT_REFERECE = HEIGHT_REFERENCE_INCHES * INCHES_TO_MM;

CONNECTOR_A_WIDTH = CONNECTOR_A_WIDTH_INCHES * INCHES_TO_MM;
CONNECTOR_A_OFFSET = CONNECTOR_A_OFFSET_INCHES * INCHES_TO_MM;

CONNECTOR_B_WIDTH = CONNECTOR_B_WIDTH_INCHES * INCHES_TO_MM;
CONNECTOR_B_OFFSET = CONNECTOR_B_OFFSET_INCHES * INCHES_TO_MM;

// STRUT      
// -----       
//             
// aX -> first side or second side
//
// a1->h1 -> BASE_WIDTH  (w1)
// a1->a2 -> BASE_HEIGHT (w2)
//             
//    e ----- d _
//    f |   |   |h
// h   /   /  c |e
// ---/   /     |i
// | g   /      |h
// -----/       |g
// a    b       |t
//              _
// |--------|
//   length   
module strut(l, h) {
    w1 = BASE_WIDTH;
    w2 = BASE_HEIGHT;

    b_y = w1;
    c_z = h - BASE_WIDTH;
    e_y = l - BASE_WIDTH;

    f_y = l - BASE_WIDTH;
    f_z = (h / 3) < BASE_WIDTH ? 0.75*h : h - BASE_WIDTH;

    g_y = (l / 3) < BASE_WIDTH ? 0.25*l : w1;
    g_z = BASE_WIDTH;

    strut_points = [
        [w2, 0, 0],     // a1
        [w2, b_y, 0],   // b1
        [w2, l, c_z],   // c1
        [w2, l, h],     // d1
        [w2, e_y, h],   // e1
        [w2, f_y, f_z], // f1
        [w2, g_y, g_z], // g1
        [w2, 0, w1],    // h1

        [ 0, 0, 0],     // a2
        [ 0, b_y, 0],   // b2
        [ 0, l, c_z],   // c2
        [ 0, l, h],     // d2
        [ 0, e_y, h],   // e2
        [ 0, f_y, f_z], // f2
        [ 0, g_y, g_z], // g2
        [ 0, 0, w1],    // h2
    ];

    a1 = 0;
    b1 = 1;
    c1 = 2;
    d1 = 3;
    e1 = 4;
    f1 = 5;
    g1 = 6;
    h1 = 7;

    a2 = 8;
    b2 = 9;
    c2 = 10;
    d2 = 11;
    e2 = 12;
    f2 = 13;
    g2 = 14;
    h2 = 15;

    strut_faces = [
        [a1, a2, h2, h1],

        [a1, h1, g1, b1],
        [b1, g1, f1, c1],
        [f1, e1, d1, c1],

        [e1, e2, d2, d1], 
        [d1, d2, c2, c1], 
        [c1, c2, b2, b1], 
        [b1, b2, a2, a1], 
        [a2, b2, g2, h2],

        [b2, c2, f2, g2],
        [c2, d2, e2, f2],

        [f1, f2, e2, e1],
        [g1, g2, f2, f1],
        [h1, h2, g2, g1],
    ];

    polyhedron(points=strut_points, faces=strut_faces);
}

module short(length, height) {
    // TOP CONNECTOR
    translate([length, BASE_HEIGHT, height]) rotate([0, 0, 180]) connector(CONNECTOR_B_WIDTH, CONNECTOR_B_OFFSET, cutout_depth=3);

    translate([0, BASE_HEIGHT, 0]) rotate([0, 0, -90]) strut(length, height);

    // BOTTOM CONNECTOR
    translate([0, 0, 0]) rotate([0, -90, 0]) connector(CONNECTOR_A_WIDTH,
CONNECTOR_A_OFFSET, cutout_depth=3, side_b_base=0.8*SIDE_B_BASE);
}

short(LENGTH_REFERECE, HEIGHT_REFERECE);
