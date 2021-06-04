
function PlayerStateFree(){

	//Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	//Update sprite index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0) 
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;
	if (_oldSprite != sprite_index) localFrame = 0;

	//Update image index
	PlayerAnimateSprite();
	
	//Attack key logic
	if (keyAttack)
	{
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
	}
		
	//Activate key logic
	if (keyActivate) 
	{
		//1. check for entity to activate, store its position in activate
		//2. if there is nothing, or something with no script
			//2a. If we are carrying something, throw it!
			//2b. Otherwise, roll!
		//3. otherwise, there is something, and it has a script, activate
		//4. if entity activated is an NPC, they should turn to face player
		
		var _activateX = x + lengthdir_x(10, direction);
		var _activateY = y + lengthdir_y(10, direction);
		var _activateSize = 4;
		var _activateList = ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX-_activateSize,
			_activateY-_activateSize,
			_activateX+_activateSize,
			_activateY+_activateSize,
			pEntity,
			false,
			true,
			_activateList,
			true
		);
		//if the first instance we find is our lifted entity, or it has no script; find the next one
		while (_entitiesFound > 0)
		{
			var _check = _activateList[| --_entitiesFound];
			if (_check != global.iLifted) && (_check.entityActivateScript != -1)
			{
				activate = _check;
				break;
			}
		}
		ds_list_destroy(_activateList);
		
		//Roll if nothing to activate
		if (activate == noone)
		{
			//Throw something if held, otherwise roll
			if (global.iLifted != noone)
			{
				PlayerThrow();	
			}
			else
			{
				state = PlayerStateRoll;
				moveDistanceRemaining = distanceRoll;	
			}
		}
		else
		{
			//Activate the entity
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);	
			
			//Make NPC face the player
			if (activate.entityNPC) 
			{
				with (activate)
				{
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR
				}
			}
		}
	}
}