/// @desc PlayerActOutAnimation(Sprite, Endscript)
/// @arg Sprite
/// @arg EndScript
/// Give this script a second argument of 0 to proceed where blank in preGMS2.3

// Carry out an animation and optionally carry out a script when the animation ends

function PlayerActOutAnimation(){
	var _sprite = argument[0];
	var _endScript = argument[1];
	
	state = PlayerStateAct;
	sprite_index = _sprite;
	if (argument_count > 1) 
	{
		animationEndScript = _endScript;
	}
	else animationEndScript = -1;
	localFrame = 0;
	image_index = 0;
	PlayerAnimateSprite();
	
}