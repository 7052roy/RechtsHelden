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
class PlayState extends FlxState
{
	
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	private var _grpCoins:FlxTypedGroup<Coin>;
	private var _grpEnemies:FlxTypedGroup<Enemy>;
	var townMusic:FlxSound;
	private var _hud:HUD;
	private var _money:Int = 0;
	private var _health:Int = 3;
	private var _inCombat:Bool = false;
	private var _teacher:Teacher;
	var mission1Talk:FlxSound;
	var _interaction:Bool = false;
	public var talk:Int = 0;
	var talkAdult2:FlxSprite;
	
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
		_mWalls.setTileProperties(2, FlxObject.ANY);
		_mWalls.setTileProperties(3, FlxObject.ANY);
		_mWalls.setTileProperties(4, FlxObject.ANY);
		_mWalls.setTileProperties(5, FlxObject.ANY);
		_mWalls.setTileProperties(6, FlxObject.ANY);
		_mWalls.setTileProperties(7, FlxObject.ANY);
		_mWalls.setTileProperties(8, FlxObject.ANY);
		_mWalls.setTileProperties(9, FlxObject.ANY);
		_mWalls.setTileProperties(10, FlxObject.ANY);
		_mWalls.setTileProperties(11, FlxObject.ANY);
		_mWalls.setTileProperties(12, FlxObject.ANY);
		_mWalls.setTileProperties(13, FlxObject.ANY);
		_mWalls.setTileProperties(14, FlxObject.ANY);
		_mWalls.setTileProperties(15, FlxObject.ANY);
		_mWalls.setTileProperties(16, FlxObject.ANY);
		_mWalls.setTileProperties(17, FlxObject.ANY);
		_mWalls.setTileProperties(18, FlxObject.ANY);
		_mWalls.setTileProperties(19, FlxObject.ANY);
		_mWalls.setTileProperties(20, FlxObject.ANY);
		_mWalls.setTileProperties(21, FlxObject.ANY);
		_mWalls.setTileProperties(22, FlxObject.ANY);
		add(_mWalls);
		
		/*_mWalls.setTileProperties(3, FlxObject.NONE);
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
		add(_mWalls);*/
		
		_grpCoins = new FlxTypedGroup<Coin>();
		add(_grpCoins);
		
		_grpEnemies = new FlxTypedGroup<Enemy>();
		add(_grpEnemies);
		
		_player = new Player();
		add(_player);
		
		_teacher = new Teacher();
		add(_teacher);
		
		_map.loadEntities(placeEntities, "entities");
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		//_hud = new HUD();
		//add(_hud);
		//FlxG.sound.playMusic(AssetPaths.townMusic__wav, 1, true);
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
		else if (entityName == "coin") 
		{
			_grpCoins.add(new Coin(Std.parseInt(entityData.get("x")) + 4, Std.parseInt(entityData.get("y")) + 4));
			
		}
		else if (entityName == "enemy")
		{
			_grpEnemies.add(new Enemy(Std.parseInt(entityData.get("x"))+4, Std.parseInt(entityData.get("y")), Std.parseInt(entityData.get("etype"))));
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
		_player.speed = 600;
		FlxG.collide(_player, _mWalls);
		FlxG.overlap(_player, _grpCoins, playerTouchCoin);
		FlxG.collide(_grpEnemies, _mWalls);
		FlxG.overlap(_player, _teacher, loadMission1);
		FlxG.collide(_teacher, _mWalls);
		FlxG.collide(_player, _grpEnemies, playerEnemy);
	}	
	
	
	function loadMission1(p:Player, t:Teacher)
	{
		
		_interaction = FlxG.keys.anyPressed(["q", "Q"]);
		if (_interaction)
		{
			p.y -= 192;
			if (talkAdult2 != null)
			{
				talkAdult2.destroy();
			}
			talkAdult2 = new FlxSprite();
			talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof0.png");
			talkAdult2.x = _player.x - 300;
			talkAdult2.y = _player.y - 100;
			add(talkAdult2);
			talk = 1;
			FlxG.sound.destroy(true);
			p.speed = 0;
			FlxG.sound.play("assets/sounds/Missie1/Teacher/Teacher1.mp3", 1, false, true, teacherText);
		}
		
	}
	
	function teacherText()
	{
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof1.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 100;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Prof1-3.mp3", 1, false, true, teacherText1);
	}
	
	function teacherText1()
	{
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof2.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 100;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Teacher1-1.mp3", 1, false, true, teacherText2);
	}
	
	function teacherText2()
	{
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof3.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 100;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Teacher1-2.mp3", 1, false, true, teacherText3);
	}
	
	function teacherText3()
	{
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof4.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 100;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", 1, false, true, teacherText4);
	}
	
	function teacherText4()
	{
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof5.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 100;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", 1, false, true, teacherText5);
	}
	
	function teacherText5()
	{
		talkAdult2.destroy();
		talkAdult2 = new FlxSprite();
		talkAdult2.loadGraphic("assets/images/Missie1/intromissie1/prof6.png");
		talkAdult2.x = _player.x - 300;
		talkAdult2.y = _player.y - 100;
		add(talkAdult2);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Prof2-3.mp3", 1, false, true, mission1Load);
	}
	
	
	function mission1Load()
	{
		talkAdult2.destroy();
		FlxG.switchState(new Mission1Find());
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
	
	private function checkEnemyVision(e:Enemy):Void
{
    if (_mWalls.ray(e.getMidpoint(), _player.getMidpoint()))
    {
        e.seesPlayer = true;
        e.playerPos.copyFrom(_player.getMidpoint());
    }
    else
        e.seesPlayer = false;
}
}