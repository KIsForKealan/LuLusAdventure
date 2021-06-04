/// @description Update camera

//Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//Update object position (moves 15% every step towards goal)
x += (xTo - x) / 15;
y += (yTo - y) / 15;

//Keep camera centre inside room
x = clamp(x, viewWidthHalf, room_width-viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height-viewHeightHalf);

//Screenshake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

//shakeLength is how long the shake is in frames, mag is how big the shake starts
shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);