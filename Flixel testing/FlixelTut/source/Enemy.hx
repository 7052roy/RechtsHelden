package ;
import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Luuk
 */
class Enemy extends FlxSprite


{
private var speed:Float = 300.2;
public var etype(default, null):Int;
 
	public function new(X:Float=0, Y:Float=0, EType:Int)  
	{
		super(X, Y);
        etype = EType;
        loadGraphic("assets/images/enemy-" + Std.string(etype) + ".png", true, 64, 64);
        setFacingFlip(FlxObject.LEFT, false, false);
        setFacingFlip(FlxObject.RIGHT, true, false);
        animation.add("d", [0, 1, 0, 2], 6, false);
        animation.add("lr", [3, 4, 3, 5], 6, false);
        animation.add("u", [6, 7, 6, 8], 6, false);
        drag.x = drag.y = 1600;
        width = 50;
        height = 50;
        offset.x = 14;
        offset.y = 7;
	}
	
    override public function draw():Void 
    {
        if ((velocity.x != 0 || velocity.y != 0 ) && touching == FlxObject.NONE)
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