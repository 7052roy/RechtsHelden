package;

import flash.system.System;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxDestroyUtil;
using flixel.util.FlxSpriteUtil;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var _txtTitle:FlxText;
	private var _btnOptions:FlxButton;
	private var _btnPlay:FlxButton;
	var menuBackground:FlxSprite;
	private var _btnExit:FlxButton;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		if (FlxG.sound.music == null) // don't restart the music if it's alredy playing
		{
			#if flash
			//FlxG.sound.playMusic(AssetPaths.HaxeFlixel_Tutorial_Game__mp3, 1, true);
			#else
			//FlxG.sound.playMusic(AssetPaths.HaxeFlixel_Tutorial_Game__ogg, 1, true);
			#end
		}
		
		menuBackground = new FlxSprite();
		menuBackground.loadGraphic("assets/images/Story/1StartingScreeeeeeen.png");
		add(menuBackground);
		
		_btnPlay = new FlxButton(0, 0, null, clickPlay);
		_btnPlay.loadGraphic("assets/images/Story/startbutton.png");
		_btnPlay.x = (FlxG.width / 2) - (_btnPlay.width / 2);
		_btnPlay.y = FlxG.height - _btnPlay.height - 10;
		_btnPlay.onUp.sound = FlxG.sound.load(AssetPaths.select__wav);
		add(_btnPlay);
		
		_btnExit = new FlxButton(FlxG.width - 64, 8, null, clickExit);
		_btnExit.loadGraphic("assets/images/Story/xbutton.png");
		add(_btnExit);
		
		FlxG.sound.playMusic(AssetPaths.Startscreen__mp3, 1, true);
		
		FlxG.camera.fade(FlxColor.BLACK, .33, true);
		
		super.create();
	}
	
	private function clickExit():Void
	{
		System.exit(0);
	}
	
	private function clickPlay():Void
	{
		FlxG.sound.destroy(true);
		FlxG.camera.fade(FlxColor.BLACK,.33, false, function() {
			FlxG.switchState(new NightmareMode());
		});
	}
	
	private function clickOptions():Void
	{
		FlxG.camera.fade(FlxColor.BLACK,.33, false, function() {
			FlxG.switchState(new OptionsState());
		});
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		_txtTitle = FlxDestroyUtil.destroy(_txtTitle);
		_btnPlay = FlxDestroyUtil.destroy(_btnPlay);
		_btnOptions = FlxDestroyUtil.destroy(_btnOptions);
		_btnExit = FlxDestroyUtil.destroy(_btnExit);
	}
}