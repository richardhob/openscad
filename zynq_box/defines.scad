
// Externally measured from box. This is the Internal dimensions reqiured for
// the box more or less

LENGTH = 130; // mm
WIDTH  =  90; // mm
HEIGHT =  38; // mm
WALL   =   3; // mm
STRAP  =  12; // mm
RADIUS =   1; // mm

BUFFER = 0.5; // mm - Buffer amount for the lid to make it fit proper

// The wall width must be smaller than the height

module rounded_cube1(dim, r, center=false) {
    scalar = [2*r, 2*r, 2*r];
    assert(dim > scalar);

    minkowski() {
        cube(dim-scalar, center=center);
        sphere(r, $fn=20);
    }
}
