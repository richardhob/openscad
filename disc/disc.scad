
module profile() {
    assert(width > inner_width);
    assert(height > inner_height);

    width = 10;
    inner_width = 8;

    between_width = inner_width + (abs(width - inner_width) / 2);

    height = 3;
    inner_height = 1;

    between_height = abs(height - inner_height) / 2;

    points = [
        // [x, y]
        [0, inner_height], // a
        [inner_width, inner_height], // b
        [between_width, 0], // c
        [width, inner_height], // d
        [between_width, height], // e
        [0, height], // f
    ];

    polygon(points);
}

// from: https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/List_Comprehensions
// NOTE: There is also concat I think?
function flatten(l) = [for (a = l) for (b = a) b];

function inner_curve(start, mid, end, n=100) = [ for(i=0;i<n;i++) ];
function outer_curve(start, end) = 

module disc() {
    rotate_extrude(angle=360, convexity=10, $fn=20) profile();
}

disc();
