package ;
import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * This class creates the trigger
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class Trigger extends FlxSprite
{

	/**
	 * This function loads the image
	 * its empty for an invisable trigger
	 */
	public function new(X:Float=0, Y:Float=0, EType:Int) 
	{
		super(X, Y);
		loadGraphic("assets/images/Tmblr.png", true, 64, 64);
	}
}