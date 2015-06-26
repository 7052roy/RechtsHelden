package;
import flixel.FlxSprite;

/**
 * This class creates the adult boy for mission 1
 * 
 * @author Roy Leinenga
 * @author Luuk huizing
 */
class Adult2 extends Entities
{

	/**
	 * This funstion loads and creates the boy to the screen
	 * 
	 * @param	X
	 * @param	Y
	 */
	public function new(X:Float=0, Y:Float=0) 
	{
		super();
		loadGraphic("assets/images/Bald-Mission1.png", true, 63, 63);
	}
	
}