package ;
import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Roy
 */
class Trigger extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0, EType:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/Tmblr.png", true, 64, 64);
	}
}