function alg()
{
	queue = [_start];
	set_end = false;

	for (var i = 0; i < room_width/global.tile_size - 0.5; i++)
	{
		for (var j = 0; j < room_height/global.tile_size - 0.5; j++)
		{
			global.node[i][j] =
			{
				x: global.tile_size/2 + i*global.tile_size,
				y: global.tile_size/2 + j*global.tile_size,
				weight: -1,
				priority: -1,
				previous: [],
				next: [] //Unused
			};
		}
	}
	
	global.node[_start[0]][_start[1]].weight = 0;

	var count = 0;
	while (array_length(queue) > 0 && !set_end && count < 100)
	{
		var new_nodes = [];
	
		for (var i = 0; i < array_length(queue); i++)
		{
			var inds = queue[i];
			var nbs = neighbours(global.node, inds[0], inds[1]);
			var changed_nbs = set_weights(global.node, inds[0], inds[1], nbs, true);
			new_nodes = array_concat(new_nodes, changed_nbs);
			
			if (set_end) { break; }
		}
		
		queue = new_nodes;
		array_sort(queue, function(current, next)
		{
			var c = global.node[current[0]][current[1]];
			var n = global.node[next[0]][next[1]];
			return c.priority - n.priority;
		});
		
		count++;
	}
	
	var path = [ global.node[_end[0]][_end[1]] ];
	while (array_length(path[0].previous) == 2 && !array_equals(path[0].previous, _start))
	{
		array_insert(path, 0, global.node[ path[0].previous[0] ][ path[0].previous[1] ]);
	}
	
	goto_ind = [path[0].x, path[0].y];
}