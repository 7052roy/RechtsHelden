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
class Introduction2 extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	var mission1Music:FlxSound;
	var _dad:AngryDad;
	var _kid:Mission2Kid;
	
	#if mobile
	public static var virtualPad:FlxVirtualPad;
	#end
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/traininglevel2.oel");
		_mWalls = _map.loadTilemap("assets/images/Tilesheet_Complete2.png", 64, 64, "tree");
		_mWalls.setTileProperties(0, FlxObject.ANY);
		_mWalls.setTileProperties(5, FlxObject.NONE);
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		_kid = new Mission2Kid();
		add(_kid);
		
		_dad = new AngryDad();
		add(_dad);
		
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
		else if (entityName == "mission2_angryDad")
		{
			_dad.x = Std.parseInt(entityData.get("x"));
			_dad.y = Std.parseInt(entityData.get("y"));
			_dad.playerPosition = _dad.x;
		}
		else if (entityName == "Mission2_Kid")
		{
			_kid.x = Std.parseInt(entityData.get("x"));
			_kid.y = Std.parseInt(entityData.get("y"));
			_kid.playerPosition = _kid.x;
		}
	}
	
	function introTalk()
	{
		FlxG.sound.destroy(true);
		_player.speed = 0;
		FlxG.sound.play("assets/sounds/IntroMissie/Tut3.mp3", 1, false, true, introTalk2);
	}
	
	function introTalk2()
	{
		FlxG.sound.play("assets/sounds/IntroMissie/Tut4.mp3", 1, false, true, play);
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
		FlxG.overlap(_player, _dad, dadCollision);
		FlxG.collide(_player, _mWalls);
		super.update();
	}	
	
	function dadCollision(p:Player, a:AngryDad)
	{
		if (_player.CharacterNumber == 1 && _player.ability2 == true)
		{
			FlxG.switchState(new Introduction3());
		}
	}
}