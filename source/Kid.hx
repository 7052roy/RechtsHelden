package ;
import flixel.FlxObject;

/**
 * This class creates the adult kid for mission 1
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class Kid extends Entities
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
		loadGraphic("assets/images/SWAG-Kid-Walk-Kopie.png", true, 64, 64);
	}
}