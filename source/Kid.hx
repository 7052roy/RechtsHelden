package ;
import flixel.FlxObject;

/**
 * ...
 * @author Roy
 */
class Kid extends Entities
{

	public function new(X:Float=0, Y:Float=0) 
	{
		super();
		loadGraphic("assets/images/SWAG-Kid-Walk-Kopie.png", true, 64, 64);
		/*animation.add("d", [0, 1, 0, 2], 6, false);
		animation.add("lr", [6, 7, 6, 8], 6, false);
		animation.add("u", [3, 4, 3, 5], 6, false);*/
	}
	
	public function kidMovement()
	{
		if (velocity.x < 400 && velocity.x > 50 && velocity.y < 250 && velocity.y > -250)
		{
			velocity.x = 200;
			velocity.y = 0;
		}else if (velocity.y < 400 && velocity.y > 50 && velocity.x < 250 && velocity.x > -250)
		{
			velocity.x = 0;
			velocity.y = 200;
		}
		
		else if (velocity.x > -400 && velocity.x < -50 && velocity.y > -250 && velocity.y < 250)
		{
			velocity.x = -200;
			velocity.y = 0;
		}
		
		else if (velocity.y > -400 && velocity.y < -50 && velocity.x > -250 && velocity.x < 250)
		{
			velocity.x = 0;
			velocity.y = -200;
		}
	}
}