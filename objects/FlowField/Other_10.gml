function alg()
{
	queue = [_start];

	for (var i = 0; i < room_width/global.tile_size - 0.5; i++)
	{
		for (var j = 0; j < room_height/global.tile_size - 0.5; j++)
		{
			global.node[i][j] =
			{
				x: global.tile_size/2 + i*global.tile_size,
				y: global.tile_size/2 + j*global.tile_size,
				weight: -1,
				previous: []
			};
		}
	}
	
	global.node[_start[0]][_start[1]].weight = 0;

	var count = 0;
	while (array_length(queue) > 0 && count < 100)
	{
		var new_nodes = [];
	
		for (var i = 0; i < array_length(queue); i++)
		{
			var inds = queue[i];
			var nbs = neighbours(global.node, inds[0], inds[1]);
			var changed_nbs = set_weights(global.node, inds[0], inds[1], nbs);
			new_nodes = array_concat(new_nodes, changed_nbs);
		}
	
		queue = new_nodes;
		count++;
	}

	path = [ global.node[_end[0]][_end[1]] ];
	while (!array_equals(path[0].previous, _start))
	{
		array_insert(path, 0, global.node[ path[0].previous[0] ][ path[0].previous[1] ]);
	}
}