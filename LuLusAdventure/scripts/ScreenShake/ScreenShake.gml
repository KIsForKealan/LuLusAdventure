/// @desc ScreenShake(magnitude,frames)
/// @arg Magnitude sets the length of the shake (distance range)
/// @arg Frames sets the length of the shake in frames (60 = 1 second)

function ScreenShake(_magnitude, _length){
	with (global.iCamera)
	{
		if (argument0 > shakeRemain)
		{
			shakeMagnitude= _magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = _length;
		}
	}
}
