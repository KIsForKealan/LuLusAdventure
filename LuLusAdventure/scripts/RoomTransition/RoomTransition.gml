/// desc RoomTransition(type, targetroom)
///@arg Type
///@arg TargetRoom

function RoomTransition(){
	if (!instance_exists(oTransition))
	{
		with(instance_create_depth(0, 0, -9999, oTransition))
		{
			type = argument[0];
			target = argument[1];
		}
	} else show_debug_message("Trying to transition while transition is happening!");
}