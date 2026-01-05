_start = [floor(x / global.tile_size), floor(y / global.tile_size)];
_end = [floor(End.x / global.tile_size), floor(End.y / global.tile_size)];
pathfinder = instance_create_depth(x, y, depth, AStar,
{
	_start: _start,
	_end: _end
});