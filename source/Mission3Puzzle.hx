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
class Mission3Puzzle extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	private var _ball:Ball;
	private var _ball1:Ball1;
	private var _ball2:Ball2;
	var mission1Music:FlxSound;
	private var _btnReset:FlxButton;
	private var _trigger:FlxTypedGroup<Trigger>;

	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/puzzle3.oel");
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
		
		_ball = new Ball();
		add(_ball);
		
		_ball1 = new Ball1();
		add(_ball1);
		
		_ball2 = new Ball2();
		add(_ball2);
		
		_btnReset = new FlxButton(0, 0, "Reset", clickReset);
		_btnReset.x = (FlxG.width / 2) - _btnReset.width - 10;
		_btnReset.y = FlxG.height - _btnReset.height - 10;
		_btnReset.onUp.sound = FlxG.sound.load(AssetPaths.select__wav);
		add(_btnReset);
		
		_map.loadEntities(placeEntities, "entities");
		
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		//_hud = new HUD();
		//add(_hud);
		mission1Music = FlxG.sound.load("assets/music/townMusic.wav");
		mission1Music.play(true);
		
		FlxG.camera.fade(FlxColor.BLACK, 2, true);
		
		#if mobile
		virtualPad = new FlxVirtualPad(FULL, NONE);	
		add(virtualPad);
		#end
		
		super.create();	
		
	}
	
	function clickReset()
	{
		FlxG.switchState(new Mission1());
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		if (entityName == "player")
		{
			_player.x = Std.parseInt(entityData.get("x"));
			_player.y = Std.parseInt(entityData.get("y"));
		}
		else if (entityName == "ball1")
		{
			_ball.x = Std.parseInt(entityData.get("x"));
			_ball.y = Std.parseInt(entityData.get("y"));
		}
		
		else if (entityName == "ball2")
		{
			_ball1.x = Std.parseInt(entityData.get("x"));
			_ball1.y = Std.parseInt(entityData.get("y"));
		}
		
		else if (entityName == "ball3")
		{
			_ball2.x = Std.parseInt(entityData.get("x"));
			_ball2.y = Std.parseInt(entityData.get("y"));
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
		FlxG.overlap(_player, _ball, stopBalls);
		FlxG.overlap(_player, _ball1, stopBalls1);
		FlxG.overlap(_player, _ball2, stopBalls2);
		FlxG.overlap(_player, _trigger, finishMission);
		FlxG.collide(_ball, _mWalls, setSpeed1);
		FlxG.collide(_ball1, _mWalls, setSpeed2);
		FlxG.collide(_ball2, _mWalls, setSpeed3);
	
	}
	
	function setSpeed1(b:Ball, w:FlxTilemap)
	{
		if (_ball.x < 192)
		{
			b.velocity.x = 100;
		}
		else if (_ball.x <400)
		{
			b.velocity.x = -100;
		}
		
	}
	
	function setSpeed2(b:Ball1, w:FlxTilemap)
	{
		if (_ball.x > 192)
		{
			b.velocity.x = -100;
		}
		else if (_ball.x <400)
		{
			b.velocity.x = 100;
		}
		
	}
	function setSpeed3(b:Ball2, w:FlxTilemap)
	{
		if (_ball.x <192)
		{
			b.velocity.x = 100;
		}
		else if (_ball.x <400)
		{
			b.velocity.x = -100;
		}
		
	}
	
	function stopBalls(p:Player, b:Ball )
	{
		if (p.CharacterNumber == 1 && p.ability2 == true)
		{
			b.velocity.x = 0;
		}
	}
	
	function stopBalls1(p:Player, b:Ball1 )
	{
		if (p.CharacterNumber == 1 && p.ability2 == true)
		{
			b.velocity.x = 0;
		}
	}
	
	function stopBalls2(p:Player, b:Ball2 )
	{
		if (p.CharacterNumber == 1 && p.ability2 == true)
		{
			b.velocity.x = 0;
		}
	}
	
	
	
	function finishMission(p:Player, t:Trigger)
	{
		
		FlxG.switchState(new BeforeNightmare());
	}
	
}