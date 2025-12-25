
include <BOSL2/std.scad>

function add_all(elem, c=0) =
    c < len(elem) - 1 
    ? elem[c] + add_all(elem, c + 1) 
    : elem[c];

function reverse(elem) = [for(i = len(elem) - 1; i >= 0; i=i-1) elem[i]];

function fst(points, c=0) = [for(i=points) i[0]];
function snd(points, c=0) = [for(i=points) i[1]];

// Calculate quadratic coefficients using BOSL2's linear solver
function quadratic_coefficients(p0, p1, p2) = 
    let(
        x0 = p0[0], y0 = p0[1],
        x1 = p1[0], y1 = p1[1],
        x2 = p2[0], y2 = p2[1],
        
        // Set up the system: Ax = b
        A = [[x0*x0, x0, 1],
             [x1*x1, x1, 1],
             [x2*x2, x2, 1]],
        b = [y0, y1, y2],
        
        // Solve for [a, b, c]
        coeffs = linear_solve(A, b)
    )
    coeffs;

// Generate points along the quadratic curve
function quadratic_path(p0, p1, p2, n=20) =
    let(
        coeffs = quadratic_coefficients(p0, p1, p2),

        a = coeffs[0],
        b = coeffs[1],
        c = coeffs[2],

        x_start = p0[0],
        x_end = p2[0]
    )
    [for (i = [0:n-1])
        let(
            t = i / (n- 1),
            x = x_start + t * (x_end - x_start),
            y = a * x * x + b * x + c
        )
        [x, y]
    ];

// Example usage
// start = [0, 5];
// middle = [10, 15];
// end = [20, 8];

// path = quadratic_path(start, middle, end, 30);

// Visualize
// color("red") stroke(path, width=0.5);
// color("red") for (p = [start, middle, end]) translate(p) circle(r=0.5, $fn=20);
