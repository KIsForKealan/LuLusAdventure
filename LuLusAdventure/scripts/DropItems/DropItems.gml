///Desc DropItems (x, y, [items])
///@arg0 x 
///@arg1 y 
///@arg2 [items]  array of items to drop

function DropItems(_argX, _argY, _argItems){
	var _items = array_length(_argItems);
	
	if (_items > 1)
	{
		var _anglePerItem = 360/_items;
		var _angle = random(360);
		for (var i=0; i < _items; i++)
		{
			with (instance_create_layer(_argX, _argY, "Instances", _argItems[i]))
			{
				direction = _angle;
				spd = 0.75 + (_items*0.1) + random(0.1);
			}
			_angle += _anglePerItem;
		}
	} else instance_create_layer(_argX, _argY, "Instances", _argItems[0]);
} 