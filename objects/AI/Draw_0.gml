path = [ global.node[_end[0]][_end[1]] ];
while (array_length(path[0].previous) == 2 && !array_equals(path[0].previous, _start))
{
	array_insert(path, 0, global.node[ path[0].previous[0] ][ path[0].previous[1] ]);
}

x = lerp(x, path[0].x, 0.1);
y = lerp(y, path[0].y, 0.1);

draw_self();