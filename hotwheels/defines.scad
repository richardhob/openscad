
// External measurements from the magnetic knife holder (in inches)

// SIDE A
//
//   TOP
// |------|
//         
//  ------    -
// / TABS \   |
// --------   |height
// /      \   |
// --------   -
//         
// |------|
//   BASE   
SIDE_A_BASE_INCHES = 0.9;
SIDE_A_TOP_INCHES = 0.7;
SIDE_A_HEIGHT_INCHES = 0.60;

TAB_WIDTH_INCHES = 0.28;
TAB_DEPTH_INCHES = 0.08;

// SIDE B
//       
//   TOP
// |------|
//         
//  ------    -
// /      \   |height
// --------   -
//         
// |------|
//   BASE   
// 

// BASE is different between connectors in addittion to the tab location
SIDE_B_BASE_INCHES = 0.46; 
SIDE_B_TOP_INCHES = 0.32;
SIDE_B_HEIGHT_INCHES = SIDE_A_HEIGHT_INCHES;

// BASE (Just a square)
// 
// Measured as 1.30" by 0.71", butttt the corners should be rounded. I'm going
// to shrink things a bit so that we don't have to round the corners?
BASE_WIDTH_INCHES = 1.25; 
BASE_HEIGHT_INCHES = 0.65;

INCHES_TO_MM = 25.4 / 1; // mm per inch

// Below here is in mm

SIDE_A_BASE = SIDE_A_BASE_INCHES * INCHES_TO_MM;
SIDE_A_TOP = SIDE_A_TOP_INCHES * INCHES_TO_MM;
SIDE_A_HEIGHT = SIDE_A_HEIGHT_INCHES * INCHES_TO_MM;

SIDE_B_BASE = SIDE_B_BASE_INCHES * INCHES_TO_MM;
SIDE_B_TOP = SIDE_B_TOP_INCHES * INCHES_TO_MM;
SIDE_B_HEIGHT = SIDE_B_HEIGHT_INCHES * INCHES_TO_MM;

BASE_WIDTH = BASE_WIDTH_INCHES * INCHES_TO_MM;
BASE_HEIGHT = BASE_HEIGHT_INCHES * INCHES_TO_MM;
BASE_DEPTH = 1.0;

TAB_WIDTH = TAB_WIDTH_INCHES * INCHES_TO_MM;
TAB_DEPTH = TAB_DEPTH_INCHES * INCHES_TO_MM;
