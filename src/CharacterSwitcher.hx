package ;
import openfl.Lib;

/**
 * ...
 * @author Luuk
 */
class CharacterSwitcher
{
	var ChooseTec
	var ChoosePat
	var ChooseIon
	private var KeyPress:Array;

	public function new() 
	{
		keys = [96];
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	private function onKeyDown(evt:KeyboardEvent):Void 
	{
	  trace("Char code: " + evt.charCode);
	  trace("Key code: " + evt.keyCode);
    }
}