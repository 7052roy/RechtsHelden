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
 * This class creates the angry dad for mission 2 talk
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class Mission2Talk extends FlxState
{
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	private var _trigger:FlxTypedGroup<Trigger>;
	var conversation:FlxSprite;

	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new FlxOgmoLoader("assets/data/Final Maps/puzzle2-1.oel");
		_mWalls = _map.loadTilemap("assets/images/Tilesheet_Complete3.png", 64, 64, "tree");
		_mWalls.setTileProperties(0, FlxObject.ANY);
		_mWalls.setTileProperties(1, FlxObject.NONE);
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		_trigger = new FlxTypedGroup<Trigger>();
		add(_trigger);
		
		_map.loadEntities(placeEntities, "entities");
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		FlxG.camera.fade(FlxColor.BLACK, 2, true);
		
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
		FlxG.collide(_player, _trigger, talkKid);
		FlxG.collide(_player, _mWalls);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function talkKid(p:Player, t:Trigger)
	{
		if (conversation != null)
			{
				conversation.destroy();
			}
			conversation = new FlxSprite();
			conversation.loadGraphic("assets/images/Missie2/emo1.3.png");
			conversation.x = _player.x - 300;
			conversation.y = _player.y - 300;
			add(conversation);
			FlxG.sound.destroy(true);
			_player.speed = 0;
			FlxG.sound.play("assets/sounds/Missie2/Prof2.mp3", 1, false, true, talkKid2);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function talkKid2()
	{
		conversation.destroy();
		conversation = new FlxSprite();
		conversation.loadGraphic("assets/images/Missie2/emo1.4.png");
		conversation.x = _player.x - 300;
		conversation.y = _player.y - 300;
		add(conversation);
		FlxG.sound.play("assets/sounds/Missie2/Kid1.mp3", 1, false, true, talkKid3);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function talkKid3()
	{
		conversation.destroy();
		conversation = new FlxSprite();
		conversation.loadGraphic("assets/images/Missie2/emo1.5.png");
		conversation.x = _player.x - 300;
		conversation.y = _player.y - 300;
		add(conversation);
		FlxG.sound.play("assets/sounds/Missie2/Prof3.mp3", 1, false, true, talkKid4);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function talkKid4()
	{
		conversation.destroy();
		conversation = new FlxSprite();
		conversation.loadGraphic("assets/images/Missie2/emo1.6.png");
		conversation.x = _player.x - 300;
		conversation.y = _player.y - 300;
		add(conversation);
		FlxG.sound.play("assets/sounds/Missie2/Kid2.mp3", 1, false, true, talkKid5);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function talkKid5()
	{
		conversation.destroy();
		conversation = new FlxSprite();
		conversation.loadGraphic("assets/images/Missie2/emo1.7.png");
		conversation.x = _player.x - 300;
		conversation.y = _player.y - 300;
		add(conversation);
		FlxG.sound.play("assets/sounds/Missie2/Prof4.mp3", 1, false, true, newMap);
	}
	
	/**
	 * function that creates a new map
	 */
	function newMap()
	{
		remove(_mWalls,true);
		remove(_player, true);
		conversation.destroy();
		_map = new FlxOgmoLoader("assets/data/Final Maps/puzzle2-1-1.oel");
		_mWalls = _map.loadTilemap("assets/images/Tilesheet_Complete3.png", 64, 64, "tree");
		_mWalls.setTileProperties(0, FlxObject.ANY);
		_mWalls.setTileProperties(1, FlxObject.NONE);
		add(_mWalls);
		
		_player = new Player();
		add(_player);
		
		_map.loadEntities(placeEntities, "entities");
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, null, 1);
		
		talkKid6();
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function talkKid6()
	{
		
		conversation = new FlxSprite();
		conversation.loadGraphic("assets/images/Missie2/emo1.8.png");
		conversation.x = _player.x - 300;
		conversation.y = _player.y - 200;
		add(conversation);
		FlxG.sound.play("assets/sounds/Missie2/Dad1.mp3", 1, false, true, talkKid7);
	}
	
	/**
	 * function that creates a textbox and play a sound file
	 */
	function talkKid7()
	{
		conversation.destroy();
		conversation = new FlxSprite();
		conversation.loadGraphic("assets/images/Missie2/emo1.9.png");
		conversation.x = _player.x - 300;
		conversation.y = _player.y - 200;
		add(conversation);
		FlxG.sound.play("assets/sounds/Missie2/Prof5.mp3", 1, false, true, finishMissionBier);
	}
	
	/**
	 * function that loads the next state
	 */
	function finishMissionBier()
	{	
		FlxG.switchState(new Mission2());
	}

	
}