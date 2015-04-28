package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Tilesheet;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Roy
 */

class Main extends Sprite 
{
	var inited:Bool;
	var tilesheet:Tilesheet;
	private var tileSize:Int = 32;
	public var map:Array<Array<Int>>;
	private var entitiesCanvas:Sprite;
	private var terrainCanvas:Sprite;

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
		tiles();
		drawMap();
	}
	
	public function drawMap()
	{
		// Map data
		map = new Array<Array<Int>>();
		NormWorld.create(map);
		// draws the terrain
		drawTerrain();
	}
	
	public function tiles()
	{
	
		terrainCanvas = new Sprite();
		addChild(terrainCanvas);
		entitiesCanvas = new Sprite();
		addChild(entitiesCanvas);
		allTiles();
	}
		// (your code here)
		
	private function allTiles()
	{
		var tilesBitmapData:BitmapData = Assets.getBitmapData("img/tileMap.png");
		tilesheet = new Tilesheet(tilesBitmapData);/*create var*/
		
		var x = 0;
		var y = 0;
		var i = 0;
		var t = 0;
		while (i < 257)
		{
			while (t < 16)
			{
				tilesheet.addTileRect( new Rectangle (x, y, 32, 32));
				x += 32;
				t ++;
			}
			y += 32;
			x = 0;
			t = 0;
			i++;
		}
	}
	
	function drawTerrain()
	{
		var tileData:Array<Float> = [];
		
		// draws the Terrain
		for (row in 0...map.length) {
			for (cell in 0...map[row].length) {
				tileData = tileData.concat([tileSize * cell, tileSize * row, map[row][cell]]);
			}
		}
		tilesheet.drawTiles(terrainCanvas.graphics, tileData);
	}
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
	

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
