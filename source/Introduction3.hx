package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.ui.FlxVirtualPad;
import flixel.util.FlxAngle;
import flixel.util.FlxColor;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxTimer;
import lime.audio.AudioManager;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class Introduction3 extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	var mission1Music:FlxSound;
	private var _trigger:FlxTypedGroup<Trigger>;
	
	#if mobile
	public static var virtualPad:FlxVirtualPad;
	#end
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/traininglevel3.oel");
		_mWalls = _map.loadTilemap("assets/images/Tilesheet_Complete2.png", 64, 64, "tree");
		_mWalls.setTileProperties(0, FlxObject.ANY);
		_mWalls.setTileProperties(5, FlxObject.NONE);
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		_trigger = new FlxTypedGroup<Trigger>();
		add(_trigger);
		
		_map.loadEntities(placeEntities, "entities");
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		FlxG.camera.fade(FlxColor.BLACK, 2, true);
		
		introTalk();
		
		super.create();	
		
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		if (entityName == "player")
		{
			_player.x = Std.parseInt(entityData.get("x"));
			_player.y = Std.parseInt(entityData.get("y"));
		}
		else if (entityName == "Tumblr")
		{
			_trigger.add(new Trigger(Std.parseInt(entityData.get("x"))+4, Std.parseInt(entityData.get("y")), Std.parseInt(entityData.get("etype"))));
		}
	}
	
	function introTalk()
	{
		FlxG.sound.destroy(true);
		_player.speed = 0;
		FlxG.sound.play("assets/sounds/IntroMissie/Tut5.mp3", 1, false, true, play);
	}
	
	function play()
	{
		FlxG.sound.playMusic(AssetPaths.KJRWHouse__wav, 1, true);
		_player.speed = 300;
	}
	
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		FlxG.overlap(_player, _trigger, speaking);
		FlxG.collide(_player, _mWalls);
	}	
	
	function speaking(p:Player, t:Trigger)
	{
		if (p.CharacterNumber == 3 && p.ability2 == true)
		{
			FlxG.sound.destroy(true);
			FlxG.switchState(new PlayState());
		}
	}
}