package ;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxTimer;
import flixel.util.FlxVelocity;

class NightMare extends Entities
{
	public var speed:Float = 100;
	public var etype(default, null):Int;
	private var _brain:FSM;
	private var _idleTmr:Float;
	private var _moveDir:Float;
	public var seesPlayer:Bool = true;
	public var playerPos(default, null):FlxPoint;
	
	public function new() 
	{
		
		super();

		loadGraphic("assets/images/KnightmareCompleteTilesheet.png", true, 128, 128);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("d", [0, 1, 2, 3], 6, false);
		animation.add("lr", [8, 9, 10, 11], 6, false);
		animation.add("u", [4, 5, 6, 7], 6, false);
		drag.x = drag.y = 0;
		width = 128;
		height = 128;
		offset.x = 4;
		offset.y = 2;
		_brain = new FSM(chase);
		_idleTmr = 0;
		playerPos = FlxPoint.get();
	}
	
	
	override public function update():Void 
	{		
		_brain.update();
		super.update();
	}
	
	public function chase():Void
	{
		FlxVelocity.moveTowardsPoint(this, playerPos, Std.int(speed));
	}
	
	
	/*override public function draw():Void 
	{
		if (velocity.x != 0 || velocity.y != 0)
		{
			
			if (Math.abs(velocity.x) > Math.abs(velocity.y))
			{
				if (velocity.x < 0)
					facing = FlxObject.LEFT;
				else
					facing = FlxObject.RIGHT;
			}
			else
			{
				if (velocity.y < 0)
					facing = FlxObject.UP;
				else
					facing = FlxObject.DOWN;
			}
			
			switch(facing)
			{
				case FlxObject.LEFT, FlxObject.RIGHT:
					animation.play("lr");
					
				case FlxObject.UP:
					animation.play("u");
					
				case FlxObject.DOWN:
					animation.play("d");
			}
		}
			
		super.draw();
	}*/
	
	override public function destroy():Void 
	{
		super.destroy();
	}
	
}