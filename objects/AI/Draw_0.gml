path = [ global.node[_end[0]][_end[1]] ];
while (!array_equals(path[0].previous, _start))
{
	array_insert(path, 0, global.node[ path[0].previous[0] ][ path[0].previous[1] ]);
}

prog = clamp(prog, 0, array_length(path) - 1);
x = lerp(x, path[prog].x, 0.1);
y = lerp(y, path[prog].y, 0.1);

draw_self();