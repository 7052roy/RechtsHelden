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
class Mission3 extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	var mission1Music:FlxSound;
	private var _btnReset:FlxButton;
	private var _trigger:FlxTypedGroup<Trigger>;
	var kjrwTalk:FlxSprite;

	
	#if mobile
	public static var virtualPad:FlxVirtualPad;
	#end
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/worldmap4.oel");
		_mWalls = _map.loadTilemap("assets/images/Tilesheet_Complete.png", 64, 64, "tree");
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.NONE);
		_mWalls.setTileProperties(3, FlxObject.NONE);
		_mWalls.setTileProperties(4, FlxObject.NONE);
		_mWalls.setTileProperties(5, FlxObject.NONE);
		_mWalls.setTileProperties(6, FlxObject.NONE);
		_mWalls.setTileProperties(7, FlxObject.NONE);
		_mWalls.setTileProperties(8, FlxObject.NONE);
		_mWalls.setTileProperties(9, FlxObject.NONE);
		_mWalls.setTileProperties(10, FlxObject.NONE);
		_mWalls.setTileProperties(11, FlxObject.NONE);
		_mWalls.setTileProperties(12, FlxObject.NONE);
		_mWalls.setTileProperties(13, FlxObject.NONE);
		_mWalls.setTileProperties(14, FlxObject.NONE);
		_mWalls.setTileProperties(15, FlxObject.NONE);
		_mWalls.setTileProperties(16, FlxObject.NONE);
		_mWalls.setTileProperties(17, FlxObject.NONE);
		_mWalls.setTileProperties(18, FlxObject.NONE);
		_mWalls.setTileProperties(19, FlxObject.NONE);
		_mWalls.setTileProperties(20, FlxObject.NONE);
		_mWalls.setTileProperties(21, FlxObject.NONE);
		_mWalls.setTileProperties(22, FlxObject.NONE);
		_mWalls.setTileProperties(23, FlxObject.NONE);
		_mWalls.setTileProperties(24, FlxObject.NONE);
		_mWalls.setTileProperties(170, FlxObject.NONE);
		_mWalls.setTileProperties(171, FlxObject.NONE);
		_mWalls.setTileProperties(172, FlxObject.NONE);
		_mWalls.setTileProperties(173, FlxObject.NONE);
		_mWalls.setTileProperties(174, FlxObject.NONE);
		_mWalls.setTileProperties(175, FlxObject.NONE);
		_mWalls.setTileProperties(176, FlxObject.NONE);
		_mWalls.setTileProperties(187, FlxObject.NONE);
		_mWalls.setTileProperties(188, FlxObject.NONE);
		_mWalls.setTileProperties(189, FlxObject.NONE);
		_mWalls.setTileProperties(190, FlxObject.NONE);
		_mWalls.setTileProperties(191, FlxObject.NONE);
		_mWalls.setTileProperties(192, FlxObject.NONE);
		_mWalls.setTileProperties(193, FlxObject.NONE);
		_mWalls.setTileProperties(204, FlxObject.NONE);
		_mWalls.setTileProperties(205, FlxObject.NONE);
		_mWalls.setTileProperties(206, FlxObject.NONE);
		_mWalls.setTileProperties(207, FlxObject.NONE);
		_mWalls.setTileProperties(208, FlxObject.NONE);
		_mWalls.setTileProperties(209, FlxObject.NONE);
		_mWalls.setTileProperties(210, FlxObject.NONE);
		_mWalls.setTileProperties(221, FlxObject.NONE);
		_mWalls.setTileProperties(222, FlxObject.NONE);
		_mWalls.setTileProperties(223, FlxObject.NONE);
		_mWalls.setTileProperties(224, FlxObject.NONE);
		_mWalls.setTileProperties(225, FlxObject.NONE);
		_mWalls.setTileProperties(226, FlxObject.NONE);
		_mWalls.setTileProperties(227, FlxObject.NONE);
		_mWalls.setTileProperties(238, FlxObject.NONE);
		_mWalls.setTileProperties(239, FlxObject.NONE);
		_mWalls.setTileProperties(240, FlxObject.NONE);
		_mWalls.setTileProperties(241, FlxObject.NONE);
		_mWalls.setTileProperties(242, FlxObject.NONE);
		_mWalls.setTileProperties(243, FlxObject.NONE);
		_mWalls.setTileProperties(244, FlxObject.NONE);
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		_trigger = new FlxTypedGroup<Trigger>();
		add(_trigger);
		
		_map.loadEntities(placeEntities, "entities");
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		//_hud = new HUD();
		//add(_hud);
		mission1Music = FlxG.sound.load("assets/music/townMusic.wav");
		mission1Music.play(true);
		
		FlxG.camera.fade(FlxColor.BLACK, 2, true);
		
		kjrwText();
		
		super.create();	
		
	}
	
	function kjrwText()
	{
		if (kjrwTalk != null)
		{
			kjrwTalk.destroy();
		}
		kjrwTalk = new FlxSprite();
		kjrwTalk.loadGraphic("assets/images/Missie3/Feggit1.png");
		kjrwTalk.x = _player.x + 100;
		kjrwTalk.y = _player.y - 300;
		add(kjrwTalk);
		_player.speed = 0;
		FlxG.sound.play("assets/sounds/Missie3/Missie3-1.mp3", 1, false, true,play);
	}
	
	function play()
	{
		_player.speed = 300;
		kjrwTalk.destroy();
	}
	
	function kjrwText2(p:Player, t:Trigger)
	{
		if ( _player.CharacterNumber == 3 && _player.ability2 == true ) 
		{
			kjrwTalk = new FlxSprite();
			kjrwTalk.loadGraphic("assets/images/Missie3/Pro1.png");
			kjrwTalk.x = _player.x + 100;
			kjrwTalk.y = _player.y - 300;
			add(kjrwTalk);
			_player.speed = 0;
			FlxG.sound.play("assets/sounds/Missie3/Missie3-2.mp3", 1, false, true, kjrwText3);
			if (kjrwTalk != null)
			{
				kjrwTalk.destroy();
			}
		kjrwTalk = new FlxSprite();
		kjrwTalk.loadGraphic("assets/images/Missie3/Pro1.png");
		kjrwTalk.x = _player.x - 164;
		kjrwTalk.y = _player.y - 300;
		add(kjrwTalk);
		_player.speed = 0;
		FlxG.sound.destroy(true);
		FlxG.sound.play("assets/sounds/Missie3/Missie3-2.mp3", 1, false, true, kjrwText3);
		}
	}
	
	function kjrwText3()
	{
		
		kjrwTalk.destroy();
		kjrwTalk = new FlxSprite();
		kjrwTalk.loadGraphic("assets/images/Missie3/Feggit2.png");
		kjrwTalk.x = _player.x - 164;
		kjrwTalk.y = _player.y - 300;
		add(kjrwTalk);
		_player.speed = 0;
		FlxG.sound.play("assets/sounds/Missie3/Missie3-3.mp3", 1, false, true, kjrwText4);
		
	}
	
	function kjrwText4()
	{
		kjrwTalk.destroy();
		kjrwTalk = new FlxSprite();
		kjrwTalk.loadGraphic("assets/images/Missie3/Feggit3.png");
		kjrwTalk.x = _player.x - 164;
		kjrwTalk.y = _player.y - 300;
		add(kjrwTalk);
		_player.speed = 0;
		FlxG.sound.play("assets/sounds/Missie3/Missie3-3.1.mp3", 1, false, true, kjrwText5);
		
	}
	
	function kjrwText5()
	{
		kjrwTalk.destroy();
		kjrwTalk = new FlxSprite();
		kjrwTalk.loadGraphic("assets/images/Missie3/Pro2.png");
		kjrwTalk.x = _player.x - 164;
		kjrwTalk.y = _player.y - 300;
		add(kjrwTalk);
		_player.speed = 0;
		FlxG.sound.play("assets/sounds/Missie3/Missie3-4.mp3", 1, false, true, kjrwText6);
		
	}
	
	function kjrwText6()
	{
		kjrwTalk.destroy();
		kjrwTalk = new FlxSprite();
		kjrwTalk.loadGraphic("assets/images/Missie3/Feggit4.png");
		kjrwTalk.x = _player.x - 164;
		kjrwTalk.y = _player.y - 300;
		add(kjrwTalk);
		_player.speed = 0;
		FlxG.sound.play("assets/sounds/Missie3/Missie3-5.mp3", 1, false, true, kjrwText7);
		
	}
	
	function kjrwText7()
	{
		kjrwTalk.destroy();
		kjrwTalk = new FlxSprite();
		kjrwTalk.loadGraphic("assets/images/Missie3/Feggit5.png");
		kjrwTalk.x = _player.x - 164;
		kjrwTalk.y = _player.y - 300;
		add(kjrwTalk);
		_player.speed = 0;
		FlxG.sound.play("assets/sounds/Missie3/Missie3-5-1.mp3", 1, false, true, kjrwText8);
		
	}
	
	function kjrwText8()
	{
		kjrwTalk.destroy();
		kjrwTalk = new FlxSprite();
		kjrwTalk.loadGraphic("assets/images/Missie3/Pro3.png");
		kjrwTalk.x = _player.x - 164;
		kjrwTalk.y = _player.y - 300;
		add(kjrwTalk);
		_player.speed = 0;
		FlxG.sound.play("assets/sounds/Missie3/Missie3-6.mp3", 1, false, true, finishMission);
		
	}
	
	function play2()
	{
		_player.speed = 300;
		kjrwTalk.destroy();
		finishMission();
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
		_player.speed = 300;
		FlxG.collide(_player, _mWalls);
		FlxG.overlap(_player, _trigger, kjrwText2);
		
		
		
		
	}	
	
	function finishMission()
	{
		mission1Music.stop();
		FlxG.switchState(new Mission3Finish());
	}
	
	
}