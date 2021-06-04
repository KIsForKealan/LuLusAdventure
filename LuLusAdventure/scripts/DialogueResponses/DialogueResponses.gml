/// @arg Response

function DialogueResponses(_response){
	switch (_response)
	{
		case 0: break;
		case 1: NewTextBox("You gave response A!", 1); break;
		case 2: NewTextBox("You gave response B! Any further response?", 1, ["3:Yes!", "4:No."]); break;	
		case 3: NewTextBox("Thanks for your responses!", 0); break;
		case 4: 
		{
			NewTextBox("Thanks!",2);
			NewTextBox("I think I left it in that scary cave to the north east...",2);
			global.questStatus[? "TheHatQuest"] = 1;
		} break;
		case 5: NewTextBox(":(",2); break;
		default: break;
	}
}