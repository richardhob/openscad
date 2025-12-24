
include <defines.scad>

module trapezoid(l1, l2, width, height) {
    assert(l1 > l2);

    c_y = abs((l2 - l1))/2;
    d_y = c_y;

    f_y = l1 - c_y;
    g_y = f_y;

    trapezoid_points = [
        [0, 0, 0],            // a
        [width, 0, 0],        // b
        [0, c_y, height],     // c
        [width, d_y, height], // d
        [width, l1, 0],       // e
        [width, f_y, height], // f
        [0, g_y, height],     // g
        [0, l1, 0]            // h
    ];

    a = 0;
    b = 1;
    c = 2;
    d = 3;
    e = 4;
    f = 5;
    g = 6;
    h = 7;

    trapezoid_faces = [
        [a, b, e, h],
        [a, c, d, b],
        [a, h, g, c],
        [d, f, e, b],
        [c, g, f, d],
        [h, e, f, g],
    ];

    polyhedron(points=trapezoid_points, faces=trapezoid_faces);
}

module trapezoid2(base_width, base_length, top_width, top_length, height) {
    assert(base_width > top_width);
    assert(base_length > top_length);

    width_diff = abs(base_width - top_width) / 2;
    length_diff = abs(base_length - top_length) / 2;

    b_x = base_width;

    c_x = width_diff;
    c_y = length_diff;

    d_x = base_width - width_diff;
    d_y = c_y;

    e_x = base_width;
    e_y = base_length;

    f_x = base_width - width_diff;
    f_y = base_length - length_diff;

    g_x = width_diff;
    g_y = base_length - length_diff;

    h_y = base_length;

    trapezoid_points = [
        [0, 0, 0],          // a
        [b_x, 0, 0],        // b
        [c_x, c_y, height], // c
        [d_x, d_y, height], // d
        [e_x, e_y, 0],      // e
        [f_x, f_y, height], // f
        [g_x, g_y, height], // g
        [0, h_y, 0]         // h
    ];

    a = 0;
    b = 1;
    c = 2;
    d = 3;
    e = 4;
    f = 5;
    g = 6;
    h = 7;

    trapezoid_faces = [
        [a, b, e, h],
        [a, c, d, b],
        [a, h, g, c],
        [d, f, e, b],
        [c, g, f, d],
        [h, e, f, g],
    ];

    polyhedron(points=trapezoid_points, faces=trapezoid_faces);
}

module connector(cutout_width, cutout_offset, cutout_depth=1) {
    cube([BASE_WIDTH, BASE_HEIGHT, BASE_DEPTH]);

    move_x = abs(SIDE_A_BASE - BASE_WIDTH) / 2;
    move_y = abs(SIDE_B_BASE - BASE_HEIGHT) / 2;


    translate([move_x, move_y, BASE_DEPTH]) {
        difference() {
            // Main connector
            union() {
                trapezoid2(SIDE_A_BASE, SIDE_B_BASE, SIDE_A_TOP, SIDE_B_TOP, SIDE_A_HEIGHT);
                translate([0, SIDE_B_BASE-TAB_WIDTH/2, SIDE_A_HEIGHT-TAB_DEPTH])
                    rotate([0, 0, -90])
                        trapezoid(SIDE_A_BASE, SIDE_A_TOP, TAB_WIDTH, TAB_DEPTH);
            }

            cutout_x = (SIDE_A_BASE - SIDE_A_TOP) / 2;
            cutout_y = SIDE_B_TOP - cutout_depth + (SIDE_B_BASE - SIDE_B_TOP) / 2;
            
            translate([cutout_x + cutout_offset, cutout_y, 0]) {
                cube([cutout_width, 10, SIDE_A_HEIGHT + 2]);
            }
        }
    }

}

connector(10, 1);
