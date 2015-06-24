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
 * A FlxState which can be used for the actual gameplay.
 */
class Mission1Find extends FlxState
{
	
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	private var _grpEnemies:FlxTypedGroup<Enemy>;
	var townMusic:FlxSound;
	private var _money:Int = 0;
	private var _health:Int = 3;
	private var _inCombat:Bool = false;
	private var _teacher:Teacher;
	var mission1Talk:FlxSound;
	var _interaction:Bool = false;
	public var talk:Int = 0;
	var _kid:Kid;
	var _adult1:Adult1;
	var _adult2:Adult2;
	var talkAdult1:FlxSprite;
	var talkAdult2:FlxSprite;
	
	#if mobile
	public static var virtualPad:FlxVirtualPad;
	#end
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/worldmap2.oel");
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
		_player.speed = 600;
		
		_adult1 = new Adult1();
		add(_adult1);
		
		_adult2 = new Adult2();
		add(_adult2);
		
		_kid = new Kid();
		add(_kid);
		
		_map.loadEntities(placeEntities, "entities");
		
		
		
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		//_hud = new HUD();
		//add(_hud);
		//townMusic = FlxG.sound.load("assets/music/townMusic.wav");
		//townMusic.play(true);
		FlxG.sound.playMusic(AssetPaths.townMusic__wav, 1, true);
		FlxG.camera.fade(FlxColor.BLACK, 2, true);
		
		#if mobile
		virtualPad = new FlxVirtualPad(FULL, NONE);		
		add(virtualPad);
		#end
		
		super.create();	
		
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		if (entityName == "player")
		{
			_player.x = Std.parseInt(entityData.get("x"));
			_player.y = Std.parseInt(entityData.get("y"));
		}
		else if (entityName == "mission1_Kid")
		{
			_kid.x = Std.parseInt(entityData.get("x"));
			_kid.y = Std.parseInt(entityData.get("y"));
		}
		else if (entityName == "mission1_Adult1")
		{
			_adult1.x = Std.parseInt(entityData.get("x"));
			_adult1.y = Std.parseInt(entityData.get("y"));
		}
		else if (entityName == "mission1_Adult2")
		{
			_adult2.x = Std.parseInt(entityData.get("x"));
			_adult2.y = Std.parseInt(entityData.get("y"));
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
		//_player.speed = 600;
		FlxG.collide(_player, _mWalls);
		//FlxG.collide(_player, _grpEnemies, playerEnemy);
		FlxG.overlap(_player, _kid, kidTalk);
		FlxG.overlap(_player, _adult1, adult1Talk1);
		FlxG.overlap(_player, _adult2, adult2Talk);
	}	
	
	function adult1Talk1(p:Player, a:Adult1)
	{
		_interaction = FlxG.keys.anyPressed(["space", "space"]);
		if (_interaction && _player.CharacterNumber == 3)
		{
			_player.speed = 0;
			if(talkAdult1 != null)
			{
				talkAdult1.destroy();
			}
			FlxG.sound.destroy(true);
			talkAdult1 = new FlxSprite();
			talkAdult1.loadGraphic("assets/images/kind1.1.png");
			talkAdult1.x = _player.x - 400;
			talkAdult1.y = _player.y - 100;
			add(talkAdult1);
			
			FlxG.sound.play("assets/sounds/Missie1/Kind2/Prof1-1.mp3", 1, false, true, adult1Talk2);
		}
	}
	
	function adult1Talk2()
	{
		talkAdult1.destroy();
		talkAdult1 = new FlxSprite();
		talkAdult1.loadGraphic("assets/images/kind1.2.png");
		talkAdult1.x = _player.x - 400;
		talkAdult1.y = _player.y - 200;
		add(talkAdult1);
		
		FlxG.sound.play("assets/sounds/Missie1/Kind2/Kind2-1.mp3", 1, false, true, adult1Talk3);
	}
	function adult1Talk3()
	{
		talkAdult1.destroy();
		talkAdult1 = new FlxSprite();
		talkAdult1.loadGraphic("assets/images/kind1.3.png");
		talkAdult1.x = _player.x - 300;
		talkAdult1.y = _player.y - 150;
		add(talkAdult1);
		FlxG.sound.play("assets/sounds/Missie1/Kind2/Prof2-1.mp3", 1, false, true, adult1Talk4);
	}
	function adult1Talk4()
	{
		talkAdult1.destroy();
		talkAdult1 = new FlxSprite();
		talkAdult1.loadGraphic("assets/images/kind1.4.png");
		talkAdult1.x = _player.x - 400;
		talkAdult1.y = _player.y - 200;
		add(talkAdult1);
		FlxG.sound.play("assets/sounds/Missie1/Kind2/Kind2-2.mp3", 1, false, true, adult1Talk5);
	}
	function adult1Talk5()
	{
		talkAdult1.destroy();
		talkAdult1 = new FlxSprite();
		talkAdult1.loadGraphic("assets/images/kind1.5.png");
		talkAdult1.x = _player.x - 400;
		talkAdult1.y = _player.y - 200;
		add(talkAdult1);
		FlxG.sound.play("assets/sounds/Missie1/Kind2/Prof3-1.mp3", 1, false, true, musicPlay);
	}
	
	function adult2Talk(p:Player, a:Adult2)
	{
		_interaction = FlxG.keys.anyPressed(["space", "space"]);
		if (_interaction && _player.CharacterNumber == 3)
		{
			_player.speed = 0;
			if (talkAdult2 != null)
			{
				talkAdult2.destroy();
			}
			talkAdult2 = new FlxSprite();
			talkAdult2.loadGraphic("assets/images/kind2.1.png");
			talkAdult2.x = _player.x - 100;
			talkAdult2.y = _player.y - 300;
			add(talkAdult2);
			FlxG.sound.destroy(true);
			FlxG.sound.play("assets/sounds/Missie1/Kind1/Prof1-4.mp3", 1, false, true, adult2Talk1);
		}
	}
	
	function adult2Talk1()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/kind2.2.png");
		talkAdult2.x = _player.x - 100;
		talkAdult2.y = _player.y - 300;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Kind1/Kind1-1.mp3", 1, false, true, adult2Talk2);
	}
	function adult2Talk2()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/kind2.3.png");
		talkAdult2.x = _player.x - 100;
		talkAdult2.y = _player.y - 300;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Kind1/Prof2-4.mp3", 1, false, true, adult2Talk3);
	}
	
	function adult2Talk3()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/kind2.4.png");
		talkAdult2.x = _player.x - 100;
		talkAdult2.y = _player.y - 300;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Kind1/Kind1-2.mp3", 1, false, true, adult2Talk4);
	}
	
	function adult2Talk4()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/kind2.5.png");
		talkAdult2.x = _player.x - 100;
		talkAdult2.y = _player.y - 300;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Kind1/Prof3-4.mp3", 1, false, true, musicPlay);
	}
	
	function musicPlay()
	{
		if(talkAdult1 != null)
		{
			talkAdult1.destroy();
		}
		if(talkAdult2 != null)
		{
			talkAdult2.destroy();
		}
		_player.speed = 600;
		FlxG.sound.playMusic(AssetPaths.townMusic__wav, 1, true);
	}
	
	function kidTalk(p:Player, k:Kid)
	{
		_interaction = FlxG.keys.anyPressed(["space", "space"]);
		
		if (_interaction && _player.CharacterNumber == 3)
		{
			_player.speed = 0;
			if(talkAdult2 != null)
			{
				talkAdult2.destroy();
			}
			FlxG.sound.destroy(true);
			talkAdult2 = new FlxSprite();
			talkAdult2.loadGraphic("assets/images/kind3.1.png");
			talkAdult2.x = _player.x - 600;
			talkAdult2.y = _player.y;
			add(talkAdult2);
			FlxG.sound.play("assets/sounds/Missie1/Kind3/Prof1-2.mp3", 1, false, true, kidTalk1);
		}
	}
	
	function kidTalk1()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/kind3.2.png");
		talkAdult2.x = _player.x - 600;
		talkAdult2.y = _player.y;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Kind3/Kind3-1.mp3", 1, false, true, kidTalk2);
	}
	function kidTalk2()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/kind3.3.png");
		talkAdult2.x = _player.x - 600;
		talkAdult2.y = _player.y;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Kind3/Prof2-2.mp3", 1, false, true, kidTalk3);
	}
	function kidTalk3()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/kind3.4.png");
		talkAdult2.x = _player.x - 600;
		talkAdult2.y = _player.y;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Kind3/Kind3-2.mp3", 1, false, true, kidTalk4);
	}
	function kidTalk4()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/kind3.5.png");
		talkAdult2.x = _player.x - 600;
		talkAdult2.y = _player.y;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Kind3/Prof3-2.mp3", 1, false, true, kidTalk5);
	}
	
	function kidTalk5()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/kind3.6.png");
		talkAdult2.x = _player.x - 600;
		talkAdult2.y = _player.y;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Kind3/Kind3-3.mp3", 1, false, true, kidTalk6);
	}
	
	function kidTalk6()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/kind3.7.png");
		talkAdult2.x = _player.x - 600;
		talkAdult2.y = _player.y;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Kind3/Prof4-2.mp3", 1, false, true, mission1Load);
	}
	
	function mission1Load()
	{
		FlxG.switchState(new Mission1());
	}
	
}