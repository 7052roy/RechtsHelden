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
	public var currentCharacter:Int = 1;
	
	public var position:Point;
	private var direction:Array<Int>;
	
	public var movementSpeed:Int;
	private var walkAnimStepper:AnimationStepper;
	var tileSheet:Tilesheet;

	public function new(tilesheet:Tilesheet) 
	{
		tileSheet = tilesheet;
		pat(tilesheet);
		
		position = new Point(128, 128);
		direction = faceDown;
		movementSpeed = 3;
		
		walkAnimStepper = new AnimationStepper([0, 1, 2, 3], 5);
	}
	
	public function checkCharacter()
	{
		if (currentCharacter == 1)
		{
			pat(tileSheet);
		}
		else if (currentCharacter == 2)
		{
			tec(tileSheet);
		}
		else if (currentCharacter == 3)
		{
			ion(tileSheet);
		}
		//trace(currentCharacter);
	}
	
	function tec(tilesheet:Tilesheet)
	{
		faceDown = new Array<Int>();
		faceUp = new Array<Int>();
		faceRight = new Array<Int>();
		faceLeft = new Array<Int>();
		
		faceDown.push(tilesheet.addTileRect(new Rectangle(0, 64, 64, 64)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(64, 64, 64,64)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(128, 64, 64, 64)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(192, 64, 64, 64)));
		
		faceUp.push(tilesheet.addTileRect(new Rectangle(0, 128, 64, 64)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(64, 128, 64, 64)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(128, 128, 64, 64)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(192, 128, 64, 64)));
		
		faceLeft.push(tilesheet.addTileRect(new Rectangle(0, 192, 64,64)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(64, 192, 64, 64)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(128, 192, 64, 64)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(192, 192, 64, 64)));
		
		faceRight.push(tilesheet.addTileRect(new Rectangle(0, 256, 64, 64)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(64, 256, 64, 64)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(128, 256, 64, 64)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(192, 256, 64, 64)));
	}
	
	function pat(tilesheet:Tilesheet)
	{
		faceDown = new Array<Int>();
		faceUp = new Array<Int>();
		faceRight = new Array<Int>();
		faceLeft = new Array<Int>();
		
		faceDown.push(tilesheet.addTileRect(new Rectangle(0, 320, 64, 64)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(64, 320, 64,64)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(128, 320, 64, 64)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(192, 320, 64, 64)));
		
		faceUp.push(tilesheet.addTileRect(new Rectangle(0, 384, 64, 64)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(64, 384, 64, 64)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(128, 384, 64, 64)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(192, 384, 64, 64)));
		
		faceLeft.push(tilesheet.addTileRect(new Rectangle(0, 448, 64,64)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(64, 448, 64, 64)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(128, 448, 64, 64)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(192, 448, 64, 64)));
		
		faceRight.push(tilesheet.addTileRect(new Rectangle(0, 512, 64, 64)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(64, 512, 64, 64)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(128, 512, 64, 64)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(192, 512, 64, 64)));
	}
	
	function ion(tilesheet:Tilesheet)
	{
		faceDown = new Array<Int>();
		faceUp = new Array<Int>();
		faceRight = new Array<Int>();
		faceLeft = new Array<Int>();
		
		faceDown.push(tilesheet.addTileRect(new Rectangle(320, 320, 64, 64)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(384, 320, 64,64)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(448, 320, 64, 64)));
		faceDown.push(tilesheet.addTileRect(new Rectangle(512, 320, 64, 64)));
		
		faceUp.push(tilesheet.addTileRect(new Rectangle(320, 384, 64, 64)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(384, 384, 64, 64)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(448, 384, 64, 64)));
		faceUp.push(tilesheet.addTileRect(new Rectangle(512, 384, 64, 64)));
		
		faceLeft.push(tilesheet.addTileRect(new Rectangle(320, 448, 64,64)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(384, 448, 64, 64)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(448, 448, 64, 64)));
		faceLeft.push(tilesheet.addTileRect(new Rectangle(512, 448, 64, 64)));
		
		faceRight.push(tilesheet.addTileRect(new Rectangle(320, 512, 64, 64)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(384, 512, 64, 64)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(448, 512, 64, 64)));
		faceRight.push(tilesheet.addTileRect(new Rectangle(512, 512, 64, 64)));
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