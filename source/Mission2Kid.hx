package ;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxTimer;
import flixel.util.FlxVelocity;

class Mission2Kid extends FlxSprite
{
	public var speed:Float = 200.1;
	public var etype(default, null):Int;
	private var _brain:FSM;
	private var _idleTmr:Float;
	private var _moveDir:Float;
	public var seesPlayer:Bool = false;
	public var playerPos(default, null):FlxPoint;
	var positionx = 0;
	var positiony = 0;
	var position:FlxPoint;
	var movementAngle:Int = 0;
	
	public function new(X:Float=0, Y:Float=0, EType:Int) 
	{
		
		super(X, Y);
		etype = EType;
		loadGraphic("assets/images/AngryDadMission2.png", true, 64, 64);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("d", [0, 1, 0, 2], 6, false);
		animation.add("lr", [6, 7, 6, 8], 6, false);
		animation.add("u", [3, 4, 3, 5], 6, false);
		drag.x = drag.y = 0;
		width = 64;
		height = 64;
		offset.x = 4;
		offset.y = 2;
		_brain = new FSM(idle);
		_idleTmr = 0;
		playerPos = FlxPoint.get();
		//immovable = true;
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
		if (_idleTmr <= 0)
		{
			speed = 200.1;
			var randomMovement = 0; //FlxRandom.intRanged(0, 2);
			if (randomMovement == 0)
			{
				FlxAngle.rotatePoint(speed * .5, 0, 0, 0, movementAngle, velocity);
				movementAngle += 90;
				if (movementAngle > 270)
				{
					movementAngle = 0;
				}
			}else if (randomMovement == 1)
			{
				FlxAngle.rotatePoint(speed * .5, 0, 0, 0, movementAngle, velocity);
				movementAngle += 180;
				if (movementAngle > 270)
				{
					movementAngle = 0;
				}
			}else if (randomMovement == 2)
			{
				movementAngle = 90;
				FlxAngle.rotatePoint(speed * .5, 0, 0, 0, movementAngle, velocity);
				movementAngle += 180;
				if (movementAngle > 270)
				{
					movementAngle = 90;
				}
			}
			_idleTmr = 4;
		}
		else
			_idleTmr -= FlxG.elapsed;
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