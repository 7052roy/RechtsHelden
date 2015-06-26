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

/**
 * This class creates the playstate
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class PlayState extends FlxState
{
	
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	var townMusic:FlxSound;
	private var _hud:HUD;
	private var _money:Int = 0;
	private var _health:Int = 3;
	private var _inCombat:Bool = false;
	private var _teacher:Teacher;
	var mission1Talk:FlxSound;
	var _interaction:Bool = false;
	var talkAdult2:FlxSprite;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/worldmap1.oel");
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
		
		_teacher = new Teacher();
		add(_teacher);
		
		_map.loadEntities(placeEntities, "entities");
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		FlxG.camera.fade(FlxColor.BLACK, 2, true);
		
		introTalk();
		
		super.create();	
		
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
		else if (entityName == "mission1_Teacher")
		{
			_teacher.x = Std.parseInt(entityData.get("x"));
			_teacher.y = Std.parseInt(entityData.get("y"));
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
		FlxG.overlap(_player, _teacher, loadMission1);
	}	
	
	/**
	 * function that plays a sound file
	 */
	function introTalk()
	{
		_player.speed = 0;
		FlxG.sound.play("assets/sounds/IntroMissie/Tut7.mp3", 1, false, true, play);
	}
	
	/**
	 * function that plays music and lets the player walk
	 */
	function play()
	{
		FlxG.sound.playMusic(AssetPaths.townMusic__wav, 1, true);
		_player.speed = 300;
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function loadMission1(p:Player, t:Teacher)
	{
		
		_interaction = FlxG.keys.anyPressed(["space", "space"]);
		if (_interaction && _player.CharacterNumber == 3)
		{
			p.speed = 0;
			if (talkAdult2 != null)
			{
				talkAdult2.destroy();
			}
			talkAdult2 = new FlxSprite();
			talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof0.png");
			talkAdult2.x = _player.x - 300;
			talkAdult2.y = _player.y - 100;
			talkAdult2.y = _player.y - 300;
			add(talkAdult2);
			FlxG.sound.destroy(true);
			p.speed = 0;
			FlxG.sound.play("assets/sounds/Missie1/Teacher/Teacher1.mp3", 1, false, true, teacherText);
		}
		
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function teacherText()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof1.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 300;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Prof1-3.mp3", 1, false, true, teacherText1);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function teacherText1()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof2.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 300;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Teacher1-1.mp3", 1, false, true, teacherText2);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function teacherText2()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof3.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 300;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Teacher1-2.mp3", 1, false, true, teacherText3);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function teacherText3()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof4.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 300;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", 1, false, true, teacherText4);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function teacherText4()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof5.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 300;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Teacher1-4.mp3", 1, false, true, teacherText5);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function teacherText5()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof6.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 300;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Prof2-3.mp3", 1, false, true, mission1Load);
	}
	
	/**
	 * function that switches to the next state
	 */
	function mission1Load()
	{
		talkAdult2.destroy();
		FlxG.switchState(new Mission1Find());
	}
}