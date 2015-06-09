package ;
import flixel.FlxSprite;

/**
 * ...
 * @author Roy
 */
class Teacher extends Entities
{

	public function new(X:Float=0, Y:Float=0) 
	{
		super();
		loadGraphic("assets/images/NPCCharacterTilesheet.png", true, 63, 63);
	}
	
}