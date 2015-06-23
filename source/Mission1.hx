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
class Mission1 extends FlxState
{
	
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	var mission1Music:FlxSound;
	private var _kid:Kid;
	private var _trigger:FlxTypedGroup<Trigger>;
	private var _btnReset:FlxButton;
	
	#if mobile
	public static var virtualPad:FlxVirtualPad;
	#end
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/puzzle1.oel");
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
		
		_kid = new Kid();
		add(_kid);
		
		_trigger = new FlxTypedGroup<Trigger>();
		add(_trigger);
		
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
		else if (entityName == "mission1_Kid")
		{
			_kid.x = Std.parseInt(entityData.get("x"));
			_kid.y = Std.parseInt(entityData.get("y"));
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
		if (_player.CharacterNumber == 2 && _player.ability2 == true)
		{
			if (_player.facing == FlxObject.RIGHT && _player.x > _kid.x-80)
			{
				_kid.velocity.x = 300;
			}
			else if (_player.facing == FlxObject.LEFT && _player.x < _kid.x+80) 
			{
				_kid.velocity.x = -300;
			}
			else if (_player.facing == FlxObject.DOWN && _player.y > _kid.y-80) 
			{
				_kid.velocity.y = 300;
			}
			else if (_player.facing == FlxObject.UP && _player.y < _kid.y+80) 
			{
				_kid.velocity.y = -300;
			}
		}
		
		FlxG.overlap(_player, _kid);
		FlxG.collide(_kid, _mWalls );
		FlxG.overlap(_kid, _trigger, finishMission);
	}	
	
	function finishMission(k:Kid, t:Trigger)
	{
		mission1Music.stop();
		FlxG.switchState(new Mission1Finish());
	}
}