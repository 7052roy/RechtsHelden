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
 * This class creates the outro
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class Outro extends FlxState
{
	var outroImage:FlxSprite;
	var _idleTmr:Float;
	var introState:Int = 0;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.sound.play("assets/sounds/OutroVoice.mp3", 1, false, true, mainMenu);
		outro1();
		super.create();	
		
	}
	
	/**
	 * function to create an image
	 */
	function outro1()
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		outroImage = new FlxSprite();
		outroImage.loadGraphic("assets/images/Story/2.png");
		add(outroImage);
		_idleTmr = 10;
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
			case 1: outro2();
		}
	}
	
	/**
	 * function to create an image
	 */
	function outro2()
	{
		
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		outroImage.destroy();
		
		outroImage = new FlxSprite();
		outroImage.loadGraphic("assets/images/Story/1.png");
		add(outroImage);
		
		_idleTmr = 50;
		
	}
	
	
	/**
	 * function that switches to the menu
	 */
	function mainMenu()
	{
		FlxG.switchState(new MenuState());
	}
	
}