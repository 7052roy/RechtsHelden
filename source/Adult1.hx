package;
import flixel.FlxSprite;

/**
 * This class creates the adult girl for mission 1
 * 
 * @author Roy Leinenga
 * @author Luuk huizing
 */
class Adult1 extends Entities
{

	/**
	 * This funstion loads and creates the girl to the screen
	 * 
	 * @param	X
	 * @param	Y
	 */
	public function new(X:Float=0, Y:Float=0) 
	{
		super();
		loadGraphic("assets/images/Girl-Mission1.png", true, 63, 63);
	}
	
}