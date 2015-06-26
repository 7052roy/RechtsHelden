package ;
import flixel.FlxSprite;

/**
 * This class creates the teacher
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class Teacher extends Entities
{

	/**
	 * This function loads the image
	 */
	public function new(X:Float=0, Y:Float=0) 
	{
		super();
		loadGraphic("assets/images/NPCCharacterTilesheet.png", true, 63, 63);
	}
	
}