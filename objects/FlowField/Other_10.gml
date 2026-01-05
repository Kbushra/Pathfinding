function alg()
{
	queue = [_end];

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
				next: []
			};
		}
	}
	
	global.node[_end[0]][_end[1]].weight = 0;

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
		array_sort(queue, function(current, next)
		{
			var c = global.node[current[0]][current[1]];
			var n = global.node[next[0]][next[1]];
			return c.priority - n.priority;
		});
		
		count++;
	}
	
	for (var i = 0; i < room_width/global.tile_size - 0.5; i++)
	{
		for (var j = 0; j < room_height/global.tile_size - 0.5; j++)
		{
			var lowest_weight = -1;
			var nbs = neighbours(global.node, i, j);
			goto_ind = [i, j];
	
			for (var k = 0; k < array_length(nbs); k++)
			{
				var curr_node = global.node[nbs[k][0]][nbs[k][1]];
				if (curr_node.weight >= lowest_weight && lowest_weight != -1) { continue; }
		
				lowest_weight = curr_node.weight;
				goto_ind = [curr_node.x, curr_node.y];
			}
			
			global.node[i][j].next = goto_ind;
		}
	}
}