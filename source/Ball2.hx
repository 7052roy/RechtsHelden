package;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;

/**
 * This class creates the third ball for mission 3
 * 
 * @author Roy Leinenga
 * @author Luuk huizing
 */

class Ball2 extends Entities
{

	/**
	 * This function loads and creates the ball to be used on the screen
	 */
	public function new() 
	{
		super();
		loadGraphic("assets/images/BeachBall-Mission3.png", true, 64, 64);
		velocity.x = -100;
	}
	
}