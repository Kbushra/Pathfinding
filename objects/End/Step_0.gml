x += (keyboard_check(vk_right) - keyboard_check(vk_left)) * spd;
y += (keyboard_check(vk_down) - keyboard_check_direct(vk_up)) * spd;
x = clamp(x, global.tile_size/2, room_width - global.tile_size/2);
y = clamp(y, global.tile_size/2, room_height - global.tile_size/2);