/// @description Draw health
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth);
_playerHealth -= _playerHealthFrac;

for (var i = 1; i <= _playerHealthMax; i++)
{
	var _imageIndex = (i > _playerHealth);
	if (i == _playerHealth+1)
	{
		_imageIndex += (_playerHealthFrac > 0);
		_imageIndex += (_playerHealthFrac > 0.25);
		_imageIndex += (_playerHealthFrac > 0.5); 
	}
	//Drawing the sprite - 8 acts as 8 pixel margin from left; then draw health hearts 16 pixels apart; 
	draw_sprite(sHealth, _imageIndex, 8 + ((i-1) * 16), 8);
}