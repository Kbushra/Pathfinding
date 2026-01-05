_start = [floor(x / global.tile_size), floor(y / global.tile_size)];
_end = [floor(End.x / global.tile_size), floor(End.y / global.tile_size)];

if (!instance_exists(FlowField))
{
	instance_create_depth(x, y, depth, FlowField,
	{
		_end: _end
	});
}