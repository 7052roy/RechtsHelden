package ;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.FlxG;

class Player extends FlxSprite
{

	public var speed:Float = 300.1;
	public var CharacterNumber = 3;
	var test = 1;
	public var ability2:Bool = false;
	public var level:Int;
	
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		loadGraphic("assets/images/ion.png", true, 64, 64);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("d",  [1, 2, 3, 0], 5, false);
		animation.add("lr", [9, 10, 11, 8], 5, false);
		animation.add("u", [5, 7, 7, 4], 5, false);
		animation.add("da", [0, 12, 13, 14,0], 5, false);
		animation.add("lra", [8, 18, 19, 20 ,8], 5, false);
		animation.add("ua", [4, 15, 16, 17,4], 5, false);
		drag.x = drag.y = 1600;
		setSize(50, 50);
		offset.set(14, 7);
		//immovable = true;
	}
	
	public function checkCharacter()
	{
		if (CharacterNumber == 1 && test != 1)
		{
			tec();
		}else if (CharacterNumber ==  2 && test != 2)
		{
			pat();
		}else if (CharacterNumber ==  3 && test != 3)
		{
			ion();
		}
	}
	
	function tec()
	{
		loadGraphic("assets/images/tec.png", true, 64, 64);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("d",  [1, 2, 3, 0], 5, false);
		animation.add("lr", [9, 10, 11, 8], 5, false);
		animation.add("u", [5, 7, 7, 4], 5, false);
		animation.add("da", [0, 12, 13, 14, 0], 5, false);
		animation.add("lra", [8, 18, 19, 20 ,8], 5, false);
		animation.add("ua", [4, 15, 16, 17,4], 5, false);
		drag.x = drag.y = 1600;
		setSize(50, 50);
		offset.set(14, 7);
		test= 1;
	}
	
	function pat()
	{
		loadGraphic("assets/images/pat.png", true, 64, 64);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		animation.add("d",  [1, 2, 3, 0], 5, false);
		animation.add("lr", [9, 10, 11, 8], 5, false);
		animation.add("u", [5, 7, 7, 4], 5, false);
		animation.add("da", [0, 12, 13, 14,0], 10, false);
		animation.add("lra", [8, 18, 19, 20 ,8], 10, false);
		animation.add("ua", [4, 15, 16, 17,4], 10, false);
		drag.x = drag.y = 1600;
		setSize(50, 50); 
		offset.set(14, 7);
		test= 2;
	}
	
	function ion()
	{
		loadGraphic("assets/images/ion.png", true, 64, 64);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("d",  [1, 2, 3, 0], 5, false);
		animation.add("lr", [9, 10, 11, 8], 5, false);
		animation.add("u", [5, 7, 7, 4], 5, false);
		animation.add("da", [0, 12, 13, 14,0], 5, false);
		animation.add("lra", [8, 18, 19, 20,8], 5, false);
		animation.add("ua", [4, 15, 16, 17,4], 5, false);
		drag.x = drag.y = 1600;
		setSize(50, 50);
		offset.set(14, 7);
		test= 3;
	}
	
	override public function draw():Void 
	{
		if (velocity.x != 0 || velocity.y != 0)
		{
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
		else if (velocity.x == 0 || velocity.y == 0 )
	     
		{
			if (ability2 == true)
			{
				switch(facing)
				{
					case FlxObject.LEFT, FlxObject.RIGHT:
						animation.play("lra");
						
					case FlxObject.UP:
						animation.play("ua");
						
					case FlxObject.DOWN:
						animation.play("da");
				}
			}
		}
			
		super.draw();
	}
	
	private function movement():Void
	{
		var _up:Bool = false;
		var _down:Bool = false;
		var _left:Bool = false;
		var _right:Bool = false;
		var _tec:Bool = false;
		var _pat:Bool = false;
		var _ion:Bool = false;
		var ability:Bool = false;
		
		_up = FlxG.keys.anyPressed(["UP", "W"]);
		_down = FlxG.keys.anyPressed(["DOWN", "S"]);
		_left = FlxG.keys.anyPressed(["LEFT", "A"]);
		_right = FlxG.keys.anyPressed(["RIGHT", "D"]);
		_tec = FlxG.keys.anyPressed(["ONE", "1"]);
		_pat = FlxG.keys.anyPressed(["TWO", "2"]);
		_ion = FlxG.keys.anyPressed(["THREE", "3"]);
		ability = FlxG.keys.anyPressed(["SPACE", "SPACE"]);

		if (ability)
		{
			ability2 = true;
		}
		else if (!ability)
		{
			ability2 = false;
		}
		if (_tec)
		{
			CharacterNumber = 1;
		}
		if (_pat)
		{
			CharacterNumber = 2;
		}
		if (_ion)
		{
			CharacterNumber = 3;
		}
		//trace(CharacterNumber);
		
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
		if (_left && _up)
			_left = false;
		if (_left && _down)
			_left = false;
		if (_right && _up)
			_right = false;
		if (_right && _down)
			_right = false;
		
		if ( _up || _down || _left || _right)
		{
			var mA:Float = 0;
			if (_up)
			{
				mA = -90;
				if (_left)
					mA -= 45;
				else if (_right)
					mA += 45;
					
				facing = FlxObject.UP;
			}
			else if (_down)
			{
				mA = 90;
				if (_left)
					mA += 45;
				else if (_right)
					mA -= 45;
				
				facing = FlxObject.DOWN;
			}
			else if (_left)
			{
				mA = 180;
				facing = FlxObject.LEFT;
			}
			else if (_right)
			{
				mA = 0;
				facing = FlxObject.RIGHT;
			}
			FlxAngle.rotatePoint(speed, 0, 0, 0, mA, velocity);
		}
	}
	
	override public function update():Void 
	{
		checkCharacter();
		movement();
		super.update();
	}
	
}