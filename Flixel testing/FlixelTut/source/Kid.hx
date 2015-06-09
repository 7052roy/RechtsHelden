package ;

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
	}
	
	public function kidMovement()
	{
		if (velocity.x < 400 && velocity.x > 50 && velocity.y < 250 && velocity.y > -250)
		{
			velocity.x = 50;
			velocity.y = 0;
		}else if (velocity.y < 400 && velocity.y > 50 && velocity.x < 250 && velocity.x > -250)
		{
			velocity.x = 0;
			velocity.y = 50;
		}
		
		else if (velocity.x > -400 && velocity.x < -50 && velocity.y > -250 && velocity.y < 250)
		{
			velocity.x = -50;
			velocity.y = 0;
		}
		
		else if (velocity.y > -400 && velocity.y < -50 && velocity.x > -250 && velocity.x < 250)
		{
			velocity.x = 0;
			velocity.y = -50;
		}
	}
	
}