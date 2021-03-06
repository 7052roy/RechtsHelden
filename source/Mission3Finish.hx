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
 * This class creates the angry dad for mission 3 finish
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class Mission3Finish extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	var mission1Music:FlxSound;
	private var _trigger:FlxTypedGroup<Trigger>;
	var judgeTalk:FlxSprite;

	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/worldmap5.oel");
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
		
		mission1Music = FlxG.sound.load("assets/music/townMusic.wav");
		mission1Music.play(true);
		
		FlxG.camera.fade(FlxColor.BLACK, 2, true);
		
		super.create();	
		
		
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function judgeText(p:Player, t:Trigger)
	{
		if ( _player.CharacterNumber == 3 && _player.ability2 == true ) 
		{
			if (judgeTalk != null)
			{
				judgeTalk.destroy();
			}
		judgeTalk = new FlxSprite();
		judgeTalk.loadGraphic("assets/images/Missie3/Pro4.png");
		judgeTalk.x = _player.x - 164;
		judgeTalk.y = _player.y - 200;
		add(judgeTalk);
		_player.speed = 0;
		FlxG.sound.destroy(true);
		FlxG.sound.play("assets/sounds/Missie3/Missie3-7.mp3", 1, false, true, judgeText1);
		}
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function judgeText1()
	{
		judgeTalk.destroy();
		judgeTalk = new FlxSprite();
		judgeTalk.loadGraphic("assets/images/Missie3/Judge1.png");
		judgeTalk.x = _player.x - 164;
		judgeTalk.y = _player.y - 300;
		add(judgeTalk);
		_player.speed = 0;
		
		FlxG.sound.play("assets/sounds/Missie3/judge1.mp3", 1, false, true, JudgeText2);
	}

	/**
	 * function that creates a textbox and play a sound file
	 */
	function JudgeText2()
	{
		judgeTalk.destroy();
		judgeTalk = new FlxSprite();
		judgeTalk.loadGraphic("assets/images/Missie3/Judge2.png");
		judgeTalk.x = _player.x - 164;
		judgeTalk.y = _player.y - 300;
		add(judgeTalk);
		_player.speed = 0;
		
		FlxG.sound.play("assets/sounds/Missie3/judge2.mp3", 1, false, true, JudgeText3);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function JudgeText3()
	{
		judgeTalk.destroy();
		judgeTalk = new FlxSprite();
		judgeTalk.loadGraphic("assets/images/Missie3/Pro6.png");
		judgeTalk.x = _player.x - 164;
		judgeTalk.y = _player.y - 300;
		add(judgeTalk);
		_player.speed = 0;
		
		FlxG.sound.play("assets/sounds/Missie3/Missie3-9.mp3", 1, false, true, JudgeText4);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function JudgeText4()
	{
		judgeTalk.destroy();
		judgeTalk = new FlxSprite();
		judgeTalk.loadGraphic("assets/images/Missie3/Pro7.png");
		judgeTalk.x = _player.x - 164;
		judgeTalk.y = _player.y - 300;
		add(judgeTalk);
		_player.speed = 0;
		
		FlxG.sound.play("assets/sounds/Missie3/Missie3-10.mp3", 1, false, true, JudgeText5);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function JudgeText5()
	{
		judgeTalk.destroy();
		judgeTalk = new FlxSprite();
		judgeTalk.loadGraphic("assets/images/Missie3/Mom2.png");
		judgeTalk.x = _player.x - 164;
		judgeTalk.y = _player.y - 300;
		add(judgeTalk);
		_player.speed = 0;
		
		FlxG.sound.play("assets/sounds/Missie3/missie3-11.mp3", 1, false, true, JudgeText6);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function JudgeText6()
	{
		judgeTalk.destroy();
		judgeTalk = new FlxSprite();
		judgeTalk.loadGraphic("assets/images/Missie3/Pro8.png");
		judgeTalk.x = _player.x - 164;
		judgeTalk.y = _player.y - 300;
		add(judgeTalk);
		_player.speed = 0;
		
		FlxG.sound.play("assets/sounds/Missie3/Missie3-12.mp3", 1, false, true, JudgeText7);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function JudgeText7()
	{
		judgeTalk.destroy();
		judgeTalk = new FlxSprite();
		judgeTalk.loadGraphic("assets/images/Missie3/Mom3.png");
		judgeTalk.x = _player.x - 164;
		judgeTalk.y = _player.y - 300;
		add(judgeTalk);
		_player.speed = 0;
		
		FlxG.sound.play("assets/sounds/Missie3/missie3-13.mp3", 1, false, true, JudgeText8);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function JudgeText8()
	{
		judgeTalk.destroy();
		judgeTalk = new FlxSprite();
		judgeTalk.loadGraphic("assets/images/Missie3/Prof9.png");
		judgeTalk.x = _player.x - 164;
		judgeTalk.y = _player.y - 300;
		add(judgeTalk);
		_player.speed = 0;
		
		FlxG.sound.play("assets/sounds/Missie3/Missie3-14.mp3", 1, false, true, finishMission);
	}
	
	/**
	 * Function that places the entities on their set locations
	 * 
	 * @param	entityName
	 * @param	entityData
	 */
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
		FlxG.collide(_player, _mWalls);
		FlxG.overlap(_player, _trigger, judgeText);
	
	}	
	
	/**
	 * function that loads the next state
	 */
	function finishMission()
	{
		FlxG.switchState(new Mission3Puzzle());
	}
	
}