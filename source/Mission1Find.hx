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
	
	#if mobile
	public static var virtualPad:FlxVirtualPad;
	#end
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/basemap2.oel");
		_mWalls = _map.loadTilemap("assets/images/Tilesheet_Complete.png", 64, 64, "tree");
		_mWalls.setTileProperties(1, FlxObject.ANY);
		_mWalls.setTileProperties(3, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.NONE);
		_mWalls.setTileProperties(10, FlxObject.NONE);
		_mWalls.setTileProperties(16, FlxObject.NONE);
		_mWalls.setTileProperties(17, FlxObject.NONE);
		_mWalls.setTileProperties(18, FlxObject.NONE);
		_mWalls.setTileProperties(19, FlxObject.NONE);
		_mWalls.setTileProperties(20, FlxObject.NONE);
		_mWalls.setTileProperties(21, FlxObject.NONE);
		_mWalls.setTileProperties(22, FlxObject.NONE);
		_mWalls.setTileProperties(33, FlxObject.NONE);
		_mWalls.setTileProperties(34, FlxObject.NONE);
		add(_mWalls);
		
		
		
		_player = new Player();
		add(_player);
		
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
		trace("finished");
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
		FlxG.collide(_player, _grpEnemies, playerEnemy);
		FlxG.overlap(_player, _kid, loadMission1);
		FlxG.overlap(_player, _adult1, adult1Talk);
		FlxG.overlap(_player, _adult2, adult2Talk);
	}	
	
	function adult1Talk(p:Player, a:Adult1)
	{
		_interaction = FlxG.keys.anyPressed(["q", "Q"]);
		if (_interaction)
		{
			FlxG.sound.play("assets/sounds/Missie1/Gesprek1.mp3", 1, false, true, mission1Load);
		}
	}
	
	function adult2Talk(p:Player, a:Adult2)
	{
		_interaction = FlxG.keys.anyPressed(["q", "Q"]);
		if (_interaction)
		{
			FlxG.sound.play("assets/sounds/Missie1/Gesprek1.mp3", 1, false, true, mission1Load);
		}
	}
	
	function loadMission1(p:Player, k:Kid)
	{
		
		_interaction = FlxG.keys.anyPressed(["q", "Q"]);
		if (_interaction)
		{
			//FlxG.sound.destroy(true);
			//p.speed = 0;
			FlxG.sound.play("assets/sounds/Missie1/Gesprek1.mp3", 1, false, true, mission1Load);
		}
		
	}
	
	function mission1Load()
	{
		FlxG.switchState(new Mission1());
	}
	
	function playerEnemy(p:Player, e:Enemy)
	{
		p.speed = 0;
		e.speed = 0;
		e.velocity.x = 0;
		e.velocity.y = 0;
	}
	
	
	private function playerTouchCoin(P:Player, C:Coin):Void
	{
		if (P.alive && P.exists && C.alive && C.exists)
		{
			C.kill();
			_money++;
			//_hud.updateHUD(_health, _money);
		}
	}
}