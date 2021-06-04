/// @desc
/// @arg id

function ActivateLiftable(){
	if (global.iLifted == noone)
	{
		// *** As of GMS2.3 this script needed a second argument, due to new functionality 
		PlayerActOutAnimation(sPlayerLift, 1);
		
		spriteIdle = sPlayerCarry;
		spriteRun = sPlayerRunCarry;
		
		global.iLifted = argument[0];
		with (global.iLifted)
		{
			lifted = true;
			persistent = true;
		}
	}
}