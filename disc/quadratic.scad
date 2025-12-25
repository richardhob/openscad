
// From: https://openscadsnippetpad.blogspot.com/2017/05/sum-all-elements-of-list.html
function add_all(elem, c=0) =
    c < len(elem) - 1 
    ? elem[c] + add_all(elem, c + 1) 
    : elem[c];

function reverse(elem) = [for(i = len(elem) - 1; i >= 0; i=i-1) elem[i]];

function fst(points, c=0) = [for(i=points) i[0]];
function snd(points, c=0) = [for(i=points) i[1]];

// From: https://www.omnicalculator.com/statistics/quadratic-regression
function solve_q(points) = let(
    n = len(points), 
    xs = fst(points),
    x2s = [for(i=xs) i*i],
    ys = fst(points),

    x_bar = add_all(xs) * (1/n),
    x2_bar = add_all(x2s) * (1/n),
    y_bar = add_all(ys) * (1/n),

    sxx = add_all([for(i=xs) pow(i - x_bar, 2)]),
    sxy = add_all([for(i=points) ((i[0] - x_bar) * (i[1] - y_bar))]),
    sxx2 = add_all([for(i=xs) ((i - x_bar) * (pow(i, 2) - x2_bar))]),
    sx2x2 = add_all([for(i=x2s) pow(i - x2_bar, 2)]),
    sx2y = add_all([for(i=points) ((i[0] - x2_bar)*(i[1] - y_bar))]),

    a = ((sx2y * sxx) - (sxy * sxx2)) / ((sxx * sx2x2) - (sxx2 * sxx2)),
    b = ((sxy * sx2x2) - (sx2y * sxx2)) / ((sxx * sx2x2) - (sxx2 * sxx2)),
    c = y_bar - (b*x_bar) - (a*x2_bar)
    ) [a, b, c];


function quadratic(start, end, a, b, c, steps=10) = 
    [for (i=start; i<end; i=i+(end-start)/steps) [i, a*i*i + b*i + c]];

function thrid_order(start, end, a, b, c, d, steps=10) =
    [for (i=start; i<end; i=i+(end-start)/steps) [i, a*i*i*i + b*i*i + c*i + d]];

module plot(points, size=0.1) {
    for (i=points) {
        translate(i) circle(size, $fn=20);
    }
}

// color("red") plot(quadratic(0, 10, -1/70, 0.01, 2, 100));
// color("blue") plot(quadratic(0, 8, -1/70, 0.01, 1.7, 100));
// color("green") plot(quadratic(8, 10, -1/60, 0.5, -2.7, 100));

points = concat(quadratic(0, 10, -1/70, 0.01, 2, 100),
    reverse(quadratic(7.92, 10, -1/60, 0.5, -2.7, 100)),
    reverse(quadratic(0, 8, -1/70, 0.01, 1.8, 100))
);

rotate_extrude(angle=360, $fn=100) polygon(points);
