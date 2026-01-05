ispd = 10;
prog = 0;
alarm[0] = ispd;

_start = [x, y];
_end = [floor(End.x / global.tile_size), floor(End.y / global.tile_size)];
pathfinder = instance_create_depth(x, y, depth, Dijkstra,
{
	_start: _start,
	_end: _end
});