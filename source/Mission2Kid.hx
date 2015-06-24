package ;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxTimer;
import flixel.util.FlxVelocity;

class Mission2Kid extends Entities 
{
	public var speed:Float = 200.1;
	private var _brain:FSM;
	private var _idleTmr:Float;
	private var _moveDir:Float;
	public var seesPlayer:Bool = false;
	public var playerPos(default, null):FlxPoint;
	var positionx = 0;
	var positiony = 0;
	var position:FlxPoint;
	var movementAngle:Int = 0;
	var positionTest:Int = 0;
	public var playerPosition:Float;
	
	public function new() 
	{
		super();
		loadGraphic("assets/images/Emo-Kid-Mission2 (1).png", true, 64, 64);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("d", [0, 1, 2, 3], 6, false);
		animation.add("lr", [8, 9, 10, 11], 6, false);
		animation.add("u", [4, 5, 6, 7], 6, false);
		drag.x = drag.y = 0;
		width = 64;
		height = 64;
		offset.x = 4;
		offset.y = 2;
		_brain = new FSM(idle);
		_idleTmr = 0;
		playerPos = FlxPoint.get();
	}
	
	public function setSpeed()
	{
		speed = 0;
	}
	
	override public function update():Void 
	{
		_brain.update();
		super.update();
	}
	
	public function stopped1()
	{
		_brain.activeState = stopped;
	}
	
	public function stopped()
	{
		speed = 0;
	}
	
	public function idle():Void
	{
		_idleTmr -= FlxG.elapsed;
		if (positionTest == 0)
		{
			speed = 200;
			movementAngle = 180;
			FlxAngle.rotatePoint(speed * .5, 0, 0, 0, movementAngle, velocity);
		}
		if (positionTest == 0 && playerPosition - 192 >= x)
		{
			positionTest = 1;
			movementAngle = 270;
			FlxAngle.rotatePoint(speed * .5, 0, 0, 0, movementAngle, velocity);
			_idleTmr = 4;
		}
		if (positionTest == 1 && _idleTmr <= 0)
		{
			movementAngle += 90;
			if (movementAngle > 270)
			{
				movementAngle = 0;
			}
			FlxAngle.rotatePoint(speed * .5, 0, 0, 0, movementAngle, velocity);
			_idleTmr = 4;
		}
	}
	
	function moveDirection()
	{
		_moveDir = FlxRandom.intRanged(0, 8) * 45;
		
		if (_moveDir == 45 || _moveDir == 135 || _moveDir == 225 || _moveDir == 315)
		{
			moveDirection();
		}else {
			FlxAngle.rotatePoint(speed * .5, 0, 0, 0, _moveDir, velocity);
		}
		
	}
	
	/*public function chase(timer:FlxTimer)
	{
		
		if (!seesPlayer)
		{
			_brain.activeState = idle;
		}
		position = new FlxPoint(positionx, positiony);
		FlxVelocity.moveTowardsPoint(this, position, Std.int(speed));
		
		positionx += 100;
		
		
	}*/
	
	
	override public function draw():Void 
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
	}
	
}