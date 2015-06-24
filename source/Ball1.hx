package;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;

/**
 * ...
 * @author Luuk
 */

class Ball1 extends Entities
{

	public function new() 
	{
		super();
		loadGraphic("assets/images/Football-Mission-3.png", true, 64, 64);
		velocity.x = 100;
	}
	
}