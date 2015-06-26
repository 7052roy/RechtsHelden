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
 * A FlxState for the introduction of the game.
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class Intro extends FlxState
{
	var introMusic:FlxSound;
	var introImage:FlxSprite;
	var _idleTmr:Float;
	var introState:Int = 0;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.sound.play("assets/sounds/Intromusic.mp3", 1, false, true, startGame);
		intro1();
		super.create();	
		
	}
	
	/**
	 * function to create the first image of the intro
	 */
	function intro1()
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		introImage = new FlxSprite();
		introImage.loadGraphic("assets/images/Story/1.png");
		add(introImage);
		_idleTmr = 7;
		introState = 1;
		
	}
	
	/**
	 * function that is called every frame
	 */
	override public function  update()
	{
		_idleTmr -= FlxG.elapsed;
		if (_idleTmr <= 0)
		{
			nextImage();
		}
		super.update();
	}
	
	/**
	 * function that calls all of the different images
	 */
	function nextImage()
	{
		switch (introState)
		{
			case 1: intro2();
			case 2: intro3();
			case 3: intro4();
			case 4: intro5();
			case 5: intro6();
			case 6: intro7();
		}
	}
	
	/**
	 * function to create the second image of the intro
	 */
	function intro2()
	{
		
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		introImage.destroy();
		
		introImage = new FlxSprite();
		introImage.loadGraphic("assets/images/Story/2.png");
		add(introImage);
		
		_idleTmr = 3;
		introState = 2;
	}
	
	/**
	 * function to create the third image of the intro
	 */
	function intro3()
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		introImage.destroy();
		introImage = new FlxSprite();
		introImage.loadGraphic("assets/images/Story/3.png");
		add(introImage);
		_idleTmr = 21;
		introState = 3;
	}
	
	/**
	 * function to create the fourth image of the intro
	 */
	function intro4()
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		introImage.destroy();
		introImage = new FlxSprite();
		introImage.loadGraphic("assets/images/Story/4.png");
		add(introImage);
		_idleTmr = 16;
		introState = 4;
	}
	
	/**
	 * function to create the fifth image of the intro
	 */
	function intro5()
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		introImage.destroy();
		introImage = new FlxSprite();
		introImage.loadGraphic("assets/images/Story/Prof.png");
		add(introImage);
		_idleTmr = 14;
		introState = 5;
	}
	
	/**
	 * function to create the sixth image of the intro
	 */
	function intro6()
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		introImage.destroy();
		introImage = new FlxSprite();
		introImage.loadGraphic("assets/images/Story/Pat.png");
		add(introImage);
		_idleTmr = 11;
		introState = 6;
	}
	
	/**
	 * function to create the seventh image of the intro
	 */
	function intro7()
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		introImage.destroy();
		introImage = new FlxSprite();
		introImage.loadGraphic("assets/images/Story/Tec.png");
		add(introImage);
		_idleTmr = 12;
		introState = 7;
	}
	
	/**
	 * function to switch to the first part of the introduction
	 */
	function startGame()
	{
		FlxG.switchState(new Introduction1());
	}
	
}