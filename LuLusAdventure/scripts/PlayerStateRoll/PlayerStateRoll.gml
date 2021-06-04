
function PlayerStateRoll(){
	//Movement
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining-speedRoll);
	var _collided = PlayerCollision();
	
	//Update sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	//Make animation fit distance in game
	image_index = (CARDINAL_DIR*_totalFrames) + min(((1-(moveDistanceRemaining/distanceRoll))*_totalFrames), _totalFrames-1);
	
	// *** i-frames during roll ***
	invulnerable = 2;
	
	//Change state
	if (moveDistanceRemaining <= 0) 
	{
		state = PlayerStateFree;	
	}
	
	if (_collided)
	{
		state = PlayerStateBonk;
		moveDistanceRemaining = distanceBonk;
		ScreenShake(4, 30);
	}
}