package ;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxTimer;
import flixel.util.FlxVelocity;

/**
 * This class creates the nightmare attack
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class NightmareAttack extends Entities
{
	public var speed:Float = 400;
	public var etype(default, null):Int;
	private var _brain:FSM;
	private var _idleTmr:Float;
	private var _moveDir:Float;
	public var seesPlayer:Bool = true;
	public var playerPos(default, null):FlxPoint;
	
	
	/**
	 * This function loads the image
	 */
	public function new() 
	{
		
		super();

		loadGraphic("assets/images/AttackCircle128x64.png", true, 64, 64);
		_brain = new FSM(chase);
		width = 64;
		height = 64;
		playerPos = FlxPoint.get();
	}
	
	/**
	 * function that is called every frame
	 */
	override public function update():Void 
	{		
		_brain.update();
		super.update();
	}
	
	/**
	 * function that moves the attack towards the player
	 */
	public function chase():Void
	{
		FlxVelocity.moveTowardsPoint(this, playerPos, Std.int(speed));
	}
	
	/**
	 * function to destroy the entity
	 */
	override public function destroy():Void 
	{
		super.destroy();
	}
	
}