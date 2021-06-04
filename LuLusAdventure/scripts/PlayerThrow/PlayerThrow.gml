///

function PlayerThrow(){
	
	with (global.iLifted)
	{
		lifted = false;
		persistent = false;
		thrown = true;
		z = 13; //carry height macro ??
		throwPeakHeight = z+10;
		throwDistance = entityThrowDistance;
		throwDistanceTravelled = 0;
		throwStartPercent = (13/throwPeakHeight)*0.5;
		throwPercent = throwStartPercent;
		direction = other.direction;
		xstart = x;
		ystart = y;
	}
	PlayerActOutAnimation(sPlayerLift, 1);
	global.iLifted = noone;
	
	spriteIdle = sPlayer;
	spriteRun = sPlayerRun;

}