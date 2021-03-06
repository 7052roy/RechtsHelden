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
 * A FlxState which creates mission2 finish.
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class Mission2Finish extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	var talkDad:FlxSprite;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/puzzle2-2.oel");
		_mWalls = _map.loadTilemap("assets/images/Tilesheet_Complete3.png", 64, 64, "tree");
		_mWalls.setTileProperties(1, FlxObject.ANY);
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		_map.loadEntities(placeEntities, "entities");
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		FlxG.camera.fade(FlxColor.BLACK, 2, true);
		
		dadText();
		
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
		
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function dadText()
	{
		if (talkDad != null)
			{
				talkDad.destroy();
			}
		talkDad = new FlxSprite();
		talkDad.loadGraphic("assets/images/Missie2/emo1.10.png");
		talkDad.x = _player.x - 200;
		talkDad.y = _player.y - 200;
		add(talkDad);
		FlxG.sound.play("assets/sounds/Missie2/Dad2.mp3", 1, false, true, dadText1);
		
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function dadText1()
	{
		talkDad.destroy();
		talkDad = new FlxSprite();
		talkDad.loadGraphic("assets/images/Missie2/emo1.10.png");
		talkDad.x = _player.x - 200;
		talkDad.y = _player.y - 200;
		add(talkDad);
		FlxG.sound.play("assets/sounds/Missie2/Dad3.mp3", 1, false, true, dadText2);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function dadText2()
	{
		talkDad.destroy();
		talkDad = new FlxSprite();
		talkDad.loadGraphic("assets/images/Missie2/emo1.11.png");
		talkDad.x = _player.x - 200;
		talkDad.y = _player.y - 200;
		add(talkDad);
		FlxG.sound.play("assets/sounds/Missie2/Kid3.mp3", 1, false, true, goToNew);
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
	
	/**
	 * function that loads the next state
	 */
	function goToNew()
	{
		FlxG.switchState(new Mission3());
	}
	
	
	
}