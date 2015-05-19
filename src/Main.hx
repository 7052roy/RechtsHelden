package ;

import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import openfl.Assets;
import openfl.display.Tilesheet;
import openfl.events.KeyboardEvent;
import openfl.geom.Rectangle;
import openfl.geom.Point;

/**
 * Tile based game.
 * @author Kirill Poletaev
 */

class Main extends Sprite 
{
	private var inited:Bool;
	private var terrainCanvas:Sprite;
	private var entitiesCanvas:Sprite;
	private var tilesheet:Tilesheet;
	private var map:Array<Array<Int>>;
	private var tileSize:Int;
	private var entities:Array<TileEntity>;
	private var character:PlayerCharacter;
	private var keysHeld:Array<Bool>;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		
		// Tilesheet initialization
		var tilesBitmapData:BitmapData = Assets.getBitmapData("img/set.png");
		terrainCanvas = new Sprite();
		addChild(terrainCanvas);
		entitiesCanvas = new Sprite();
		addChild(entitiesCanvas);
		allTiles();
		
		// Entities
		entities = new Array<TileEntity>();
		
		// Player character creation
		character = new PlayerCharacter(tilesheet);
		entities.push(character);
		
		// Map data
		tileSize = 32;
		map = new Array<Array<Int>>();
		TileMap.create(map);
		drawTerrain();
		
		// Game loop
		stage.addEventListener(Event.ENTER_FRAME, everyFrame);
		
		// Keyboard
		keysHeld = new Array<Bool>();
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
	}
	
	public function allTiles()
	{
		var tilesBitmapData:BitmapData = Assets.getBitmapData("img/set.png");
		tilesheet = new Tilesheet(tilesBitmapData);
		
		var x = 0;
		var y = 0;
		var i = 0;
		var t = 0;
		while (i < 140)
		{
			while (t < 15)
			{
				tilesheet.addTileRect( new Rectangle( x, y, 32, 32 ) );
				x += 32;
				t ++;
			}
			y += 32;
			x = 0;
			t = 0;
			i++;
		}
	}
	
	private function everyFrame(evt:Event):Void {
		var move:Point = new Point();
		
		// Character walking
		if (keysHeld[38]) {
			character.face(Up);
			character.animate();
			move.y -= character.movementSpeed;
		} else if (keysHeld[39]) {
			character.face(Right);
			character.animate();
			move.x += character.movementSpeed;
		} else if (keysHeld[40]) {
			character.face(Down);
			character.animate();
			move.y += character.movementSpeed;
		} else if (keysHeld[37]) {
			character.face(Left);
			character.animate();
			move.x -= character.movementSpeed;
		} else if (keysHeld[49]) {
			character.currentCharacter = 1;
		} else if (keysHeld[50]) {
			character.currentCharacter = 2;
		} else if (keysHeld[51]) {
			character.currentCharacter = 3;
		} else {
			character.resetAnim();
		}
		
		character.checkCharacter();
		TileCollisionDetector.detect(map, character.position, move, tileSize);
		
		drawEntities();
	}
	
	private function drawEntities():Void {
		var tileData:Array<Float> = [];
		
		// Entities
		for (entity in entities) {
			tileData = tileData.concat(entity.draw());
		}
		
		entitiesCanvas.graphics.clear();
		tilesheet.drawTiles(entitiesCanvas.graphics, tileData);
	}
	
	private function drawTerrain():Void {
		var tileData:Array<Float> = [];
		
		// Terrain
		for (row in 0...map.length) {
			for (cell in 0...map[row].length) {
				tileData = tileData.concat([tileSize * cell, tileSize * row, map[row][cell]]);
			}
		}
		
		tilesheet.drawTiles(terrainCanvas.graphics, tileData);
	}
	
	private function keyDown(evt:KeyboardEvent):Void {
		keysHeld[evt.keyCode] = true;
	}
	
	private function keyUp(evt:KeyboardEvent):Void {
		keysHeld[evt.keyCode] = false;
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}