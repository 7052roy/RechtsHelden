package;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;

/**
 * This class creates the first ball for mission 3
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */

class Ball extends Entities
{

	/**
	 * This function loads and creates the ball to be used on the screen
	 */
	public function new() 
	{
		super();
		loadGraphic("assets/images/DodgeBall-Mission-3.png", true, 64, 64);
		velocity.x = -100;
	}
}