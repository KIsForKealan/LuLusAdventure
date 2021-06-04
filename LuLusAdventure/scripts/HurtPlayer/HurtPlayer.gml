/// desc

function HurtPlayer(_direction, _force, _damage){
	
	//Is player invulnerable ? If yes, do nothing
	if (oPlayer.invulnerable <= 0)
	{
		//Remove damage from player health	
		global.playerHealth = max(0, global.playerHealth-_damage);
		
		//Is player health still greater than 0 after damage ?
		if (global.playerHealth > 0)
		{
			//Knockback effect
			with (oPlayer)
			{
				state = PlayerStateBonk;
				direction = _direction-180;
				moveDistanceRemaining = _force;
				ScreenShake(2, 10);
				flash = 0.7;
				invulnerable = 60;
				flashShader = shRedFlash;
			}
		}
		else 
		{
			with (oPlayer) state = PlayerStateDead;	
		}
	}
}