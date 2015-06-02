package ;
import flixel.FlxSprite;

/**
 * ...
 * @author Roy
 */
class Teacher extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		loadGraphic("assets/images/enemy-1.png", true, 64, 64);
	}
	
}