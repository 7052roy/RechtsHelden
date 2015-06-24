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
class NightmareMode extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	var talk:FlxSprite;
	var _nightmare:NightMare;
	var _timer:Float = 3;
	var _attack:NightmareAttack;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/NightmareMap.oel");
		_mWalls = _map.loadTilemap("assets/images/Knightmare_Tilesheet_Complete.png", 64, 64, "tree");
		var e:Int = 1;
		
		for (i in 0...245)
		{
			_mWalls.setTileProperties(e, FlxObject.NONE);
			e++;
		}
		
		_mWalls.setTileProperties(47, FlxObject.ANY);
		_mWalls.setTileProperties(67, FlxObject.ANY);
		_mWalls.setTileProperties(26, FlxObject.ANY);
		_mWalls.setTileProperties(27, FlxObject.ANY);
		_mWalls.setTileProperties(60, FlxObject.ANY);
		_mWalls.setTileProperties(61, FlxObject.ANY);
		_mWalls.setTileProperties(51, FlxObject.ANY);
		_mWalls.setTileProperties(52, FlxObject.ANY);
		_mWalls.setTileProperties(53, FlxObject.ANY);
		
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		_nightmare = new NightMare();
		add(_nightmare);
		
		_map.loadEntities(placeEntities, "entities");
		
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		//_hud = new HUD();
		//add(_hud);
		
		FlxG.sound.playMusic(AssetPaths.Knightmare__mp3, 1, true);
		
		FlxG.camera.fade(FlxColor.BLACK, 2, true);
		
		nightmarTalk();
		
		super.create();	
	}
	
	function nightmarTalk()
	{
		if (talk != null)
		{
		talk.destroy();
		}
		_player.speed = 0;
		_nightmare.speed = 0;
		talk = new FlxSprite();
		talk.loadGraphic("assets/images/Knightmare Fight/Text2.png");
		talk.x = _player.x - 300;
		talk.y = _player.y - 300;
		add(talk);
		FlxG.sound.destroy(true);
		FlxG.sound.play("assets/sounds/Knightmare/Knightmare1.mp3", 1, false, true, nightmareTalk2);
	}
	
	function nightmareTalk2()
	{
		talk.destroy();
		talk = new FlxSprite();
		talk.loadGraphic("assets/images/Knightmare Fight/Text1.png");
		talk.x = _player.x - 300;
		talk.y = _player.y - 300;
		add(talk);
		FlxG.sound.play("assets/sounds/Knightmare/Luuk1.mp3", 1, false, true, play);
	}
	
	function play()
	{
		talk.destroy();
		_player.speed = 300;
		_nightmare.speed = 100;
		FlxG.sound.playMusic(AssetPaths.Knightmare__mp3, 1, true);
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		if (entityName == "player")
		{
			_player.x = Std.parseInt(entityData.get("x"));
			_player.y = Std.parseInt(entityData.get("y"));
		}
		else if (entityName == "Nightmare")
		{
			_nightmare.x = Std.parseInt(entityData.get("x"));
			_nightmare.y = Std.parseInt(entityData.get("y"));
		}
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
		if (_timer < 0)
		{
			_attack = new NightmareAttack();
			add(_attack);
			_attack.playerPos.copyFrom(_player.getMidpoint());
			_attack.chase();
		}
		_nightmare.playerPos.copyFrom(_player.getMidpoint());
		super.update();
		_player.speed = 300;
		FlxG.collide(_player, _mWalls);
		_timer -= FlxG.elapsed();
	
	}	
	
	
}