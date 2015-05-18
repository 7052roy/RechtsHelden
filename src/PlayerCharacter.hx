package ;
import openfl.display.Tilesheet;
import openfl.geom.Point;
import openfl.geom.Rectangle;

/**
 * Player character's entity.
 * @author Kirill Poletaev
 */
enum Direction {
	Left;
	Right;
	Up;
	Down;
}
 
class PlayerCharacter extends TileEntity
{
	private var faceDown:Array<Int>;
	private var faceUp:Array<Int>;
	private var faceRight:Array<Int>;
	private var faceLeft:Array<Int>;
	
	public var position:Point;
	private var direction:Array<Int>;
	
	public var movementSpeed:Int;
	private var walkAnimStepper:AnimationStepper;

	public function new(tilesheet:Tilesheet) 
	{
		faceDown = new Array<Int>();
		faceUp = new Array<Int>();
		faceRight = new Array<Int>();
		faceLeft = new Array<Int>();
		
		faceDown.push(tilesheet.addTileRect(new Rectangle(0, 32, 32, 32)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(32, 32, 32,32)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(64, 32, 32, 32)));
		
		faceUp.push(tilesheet.addTileRect(new Rectangle(0, 64, 32, 32)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(32, 64, 32, 32)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(64, 64, 32, 32)));
		
		faceLeft.push(tilesheet.addTileRect(new Rectangle(0, 96, 32,32)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(32, 96, 32, 32)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(64, 96, 32, 32)));
		
		faceRight.push(tilesheet.addTileRect(new Rectangle(0, 128, 32, 32)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(32, 128, 32, 32)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(64, 128, 32, 32)));
		
		position = new Point(128, 128);
		direction = faceDown;
		movementSpeed = 3;
		
		walkAnimStepper = new AnimationStepper([0, 1, 0, 2], 5);
	}
	
	override public function draw():Array<Float> {
		var tile:Int = direction[walkAnimStepper.getFrame()];
		return [position.x, position.y, tile];
	}
	
	public function face(dir:Direction):Void {
		switch(dir) {
			case Up: direction = faceUp;
			case Down: direction = faceDown;
			case Right: direction = faceRight;
			case Left: direction = faceLeft;
		}
	}
	
	public function resetAnim():Void {
		walkAnimStepper.reset();
	}
	
	public function animate():Void {
		walkAnimStepper.animate();
	}
	
}