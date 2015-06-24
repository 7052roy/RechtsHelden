package;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;

/**
 * ...
 * @author Luuk
 */

class Ball extends Entities
{

	public function new() 
	{
		super();
		loadGraphic("assets/images/DodgeBall-Mission-3.png", true, 64, 64);
		velocity.x = -100;
	}
	
}