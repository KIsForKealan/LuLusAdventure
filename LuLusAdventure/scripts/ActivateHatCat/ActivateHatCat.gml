/// 0 not started, 1 in progress, 2 complete; TheHatQuest;

function ActivateHatCat(){
	// this function will be called every time we interact with hatCatNPCQuesty
	// store _hasHat as 0 for false and 1 for true
	// if player is currently lifting something, AND that object being lifted matches the index for oHat
	var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == oHat);
	switch (global.questStatus[? "TheHatQuest"])
	{
		case 0: //not yet started
		{
			//player could have hat before talking to NPC
			if (_hasHat)
			{
				// complete quest without asking
				NewTextBox("Wow, I can't believe you found my hat!",2);
				NewTextBox("You are a true hero indeed!",2);
				global.questStatus[? "TheHatQuest"] = 2;
				with (oQuestNPC) sprite_index = sQuestyHat;
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer)
				{
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			}
			else
			{
				//offer quest	
				NewTextBox("Hello there! You look like a brave adventurer!\nWhat with the cape and all.",2);
				NewTextBox("Could you help me find my missing hat?",2,["4:Of course!", "5:This task is beneath me."]);
			}
		} break;
		
		case 1: //quest in progress
		{
			if (_hasHat)
			{
				// complete quest
				NewTextBox("Wow, you found my hat!",2);
				NewTextBox("Thanks for going in that scary cave.",2);
				global.questStatus[? "TheHatQuest"] = 2;
				with (oQuestNPC) sprite_index = sQuestyHat;
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer)
				{
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			}
			else 
			{
				//give reminder and clue
				NewTextBox("I think I left my hat in that\n scary cave to the north...",2);
				NewTextBox("You might need some items to get there!",2);
			}
		} break;
		
		case 2: //quest already completed
		{
			//thanks
			NewTextBox("Thank you for getting my hat\n back from that scary cave!",2);
		} break;
	}
}