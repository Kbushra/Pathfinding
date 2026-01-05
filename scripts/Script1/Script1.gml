global.tile_size = 64;

function neighbours(arr, x, y)
{
	var new_arr = [];
	
	for (var i = -1; i <= 1; i++)
	{
		for (var j = -1; j <= 1; j++)
		{
			if (i == 0 && j == 0) { continue; }
			
			var coll = place_meeting(global.tile_size/2 + (x + i)*global.tile_size,
			global.tile_size/2 + (y + j)*global.tile_size, Block);
			
			if ( x + i >= 0 && x + i < array_length(arr) &&
			y + j >= 0 && y + j < array_length(arr[x + i]) && !coll )
			{
				array_push(new_arr, [x + i, y + j]);
			}
		}
	}
	
	return new_arr;
}

function set_weights(arr, x, y, nbs, use_astar = false)
{
	var changed_nbs = [];
	
	for (var i = 0; i < array_length(nbs); i++)
	{
		var inds = nbs[i];
		var x_dist = inds[0] - x;
		var y_dist = inds[1] - y;
		var dist = sqrt(power(x_dist, 2) + power(y_dist, 2));
		
		var final_weight = arr[x][y].weight + dist;
		var targ_node = arr[inds[0]][inds[1]];
		if (targ_node.weight == -1 || targ_node.weight > final_weight)
		{
			var to_end = sqrt(power(_end[0] - targ_node.x, 2) + power(_end[1] - targ_node.y, 2));
			if (!use_astar) { to_end = 0; }
			
			targ_node.weight = final_weight;
			targ_node.priority = final_weight + to_end;
			targ_node.previous = [x, y];
			array_push(changed_nbs, inds);
			
			if (array_equals(inds, _end)) { set_end = true; }
		}
	}
	
	return changed_nbs;
}