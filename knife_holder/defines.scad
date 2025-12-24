
// External measurements from the magnetic knife holder (in inches)

LENGTH_INCHES  = 13 + 3/4;
HEIGHT_INCHES  = 2 + 1/4;
DEPTH_INCHES   = 13/16;
SPACING_INCHES = 13/16;

INCHES_TO_MM = 25.4 / 1; // mm per inch

// Below here is in mm
// Interface to the Block

LENGTH  = LENGTH_INCHES * INCHES_TO_MM;
HEIGHT  = HEIGHT_INCHES * INCHES_TO_MM;
DEPTH   = DEPTH_INCHES * INCHES_TO_MM;
SPACING = SPACING_INCHES * INCHES_TO_MM;

MOUNT_LENGTH = SPACING;

PAD_H = 0.9; // What to pad HEIGHT by
PAD_L = 0.8; // What to pad LENGTH by
PAD_D = 0.8; // What to pad DEPTH by

WALL = 1.5; // Wall thickness

// Custom section
// Screw mount bits

CUSTOM = SPACING; 
HOLE =  5; // Diameter of the screw holes
HEAD = 12; // Diameter of the screw holes head (for chamfer0
