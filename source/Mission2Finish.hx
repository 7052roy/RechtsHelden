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
class Mission2Finish extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	var mission1Music:FlxSound;
	private var _btnReset:FlxButton;
	var talkDad:FlxSprite;

	#if mobile
	public static var virtualPad:FlxVirtualPad;
	#end
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/puzzle2-2.oel");
		_mWalls = _map.loadTilemap("assets/images/Tilesheet_Complete3.png", 64, 64, "tree");
		_mWalls.setTileProperties(1, FlxObject.NONE);
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		
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
		
		dadText();
		
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
		
	}
	
	function dadText()
	{
		talkDad.destroy();
		talkDad = new FlxSprite();
		talkDad.loadGraphic("assets/images/Missie1/intromissie1/prof1.png");
		talkDad.x = _player.x - 300;
		talkDad.y = _player.y - 100;
		add(talkDad);
		FlxG.sound.play("assets/sounds/Missie1/Teacher/Prof1-3.mp3", 1, false, true);
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
	}
	
	
}