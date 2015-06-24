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
class Mission2 extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	var mission1Music:FlxSound;
	private var _btnReset:FlxButton;
	private var _angryDad:AngryDad;
	private var _kid:Mission2Kid;
	#if mobile
	public static var virtualPad:FlxVirtualPad;
	#end
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/puzzle2-3.oel");
		_mWalls = _map.loadTilemap("assets/images/Tilesheet_Complete3.png", 64, 64, "tree");
		_mWalls.setTileProperties(1, FlxObject.NONE);
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		_kid = new Mission2Kid();
		add(_kid);
		
		_angryDad = new AngryDad();
		add(_angryDad);
		
		_map.loadEntities(placeEntities, "entities");
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		//_hud = new HUD();
		//add(_hud);
		FlxG.sound.playMusic(AssetPaths.Chase__mp3, 1, true);
		
		FlxG.camera.fade(FlxColor.BLACK, 2, true);
		
		#if mobile
		virtualPad = new FlxVirtualPad(FULL, NONE);	
		add(virtualPad);
		#end
		
		super.create();	
		
	}
	
	function clickReset()
	{
		FlxG.switchState(new Mission2());
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		if (entityName == "player")
		{
			_player.x = Std.parseInt(entityData.get("x"));
			_player.y = Std.parseInt(entityData.get("y"));
		}
		else if (entityName == "mission2_angryDad")
		{
			_angryDad.x = Std.parseInt(entityData.get("x"));
			_angryDad.y = Std.parseInt(entityData.get("y"));
			_angryDad.playerPosition = _angryDad.x;
		}
		else if (entityName == "Mission2_Kid")
		{
			_kid.x = Std.parseInt(entityData.get("x"));
			_kid.y = Std.parseInt(entityData.get("y"));
			_kid.playerPosition = _kid.x;
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
		FlxG.overlap(_player, _angryDad, dadCollision);
		//FlxG.collide(_kid, _mWalls);
	}	
	
	function dadCollision(p:Player, a:AngryDad)
	{
		
		if (_player.CharacterNumber == 1 && _player.ability2 == true)
		{
			FlxG.sound.destroy(true);
			FlxG.switchState(new Mission2Finish());
		}
	}
	
}