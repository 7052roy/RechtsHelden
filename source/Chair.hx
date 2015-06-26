package ;
import flixel.FlxObject;

/**
 * This class creates the chain for introduction1
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class Chair extends Entities
{

	/**
	 * This funstion loads and creates the chair to be added to the screen
	 */
	public function new() 
	{
		super();
		loadGraphic("assets/images/Push1.png", true, 64, 64);
	}

}