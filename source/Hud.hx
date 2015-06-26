package ;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;


/**
 * This class creates the HUD for the nightmare mode
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class HUD extends FlxTypedGroup<FlxSprite>
{
	
	private var _sprBack:FlxSprite;
	private var _txtHealth:FlxText;
	private var _txtNight:FlxText;
	private var _sprHealth:FlxSprite;
	private var _sprNight:FlxSprite;
	
	/**
	 * function that creates the hud
	 */
	public function new() 
	{
		super();
		_sprBack = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);
		_sprBack.drawRect(0, 19, FlxG.width, 1, FlxColor.WHITE);
		_txtHealth = new FlxText(16, 2, 0, "3 / 3", 8);
		_txtHealth.setBorderStyle(FlxText.BORDER_SHADOW, FlxColor.GRAY, 1, 1);
		_sprHealth = new FlxSprite(4, _txtHealth.y + (_txtHealth.height/2)  - 4, AssetPaths.health__png);
		
		_sprNight = new FlxSprite(FlxG.width - 16, _txtHealth.y + (_txtHealth.height/2)  - 4, AssetPaths.health__png);
		_txtNight = new FlxText(FlxG.width - 64, 2, 0, "3 / 3", 8);
		_txtNight.setBorderStyle(FlxText.BORDER_SHADOW, FlxColor.GRAY, 1, 1);
		_txtNight.alignment = "right";
		add(_sprBack);
		add(_sprHealth);
		add(_sprNight);
		add(_txtHealth);
		add(_txtNight);
		forEach(function(spr:FlxSprite) {
			spr.scrollFactor.set();
		});
	}
	
	
	/**
	 * function for updating the hud
	 * 
	 * @param	Health
	 * @param	healthNightmare
	 */
	public function updateHUD(Health:Int = 0, healthNightmare:Int = 0):Void
	{
		_txtHealth.text = Std.string(Health) + " / 3";
		_txtNight.text = Std.string(healthNightmare) + " / 3";
	}
	
	
	
}