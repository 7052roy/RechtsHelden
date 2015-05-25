package ;
import openfl.display.Sprite;
import openfl.geom.Point;

/**
 * ...
 * @author Kirill Poletaev
 */
class TileCollisionDetector
{

	public static function detect(map:Array<Array<Int>>, position:Point, movementVector:Point, tileSize:Int):Void
	{
		// position coordinates on the grid
		var tileCoords:Point = new Point(0, 0);
		var approximateCoords:Point = new Point();
		
		position.y += movementVector.y;
		checkBottomCollision(tileCoords, approximateCoords, position, movementVector, tileSize, map);
		checkTopCollision(tileCoords, approximateCoords, position, movementVector, tileSize, map);
		
		position.x += movementVector.x;
		checkRightCollision(tileCoords, approximateCoords, position, movementVector, tileSize, map);
		checkLeftCollision(tileCoords, approximateCoords, position, movementVector, tileSize, map);
	}
	
	private static function checkBottomCollision(tileCoords:Point, approximateCoords:Point, position:Point, movementVector:Point, tileSize:Int, map:Array<Array<Int>>):Void {
		// Bottom collision
		if (movementVector.y >= 0) {
			approximateCoords.x = position.x / tileSize;
			approximateCoords.y = position.y / tileSize;
			tileCoords.y = Math.ceil(approximateCoords.y);
			
			tileCoords.x = Math.floor(approximateCoords.x);
			if (isBlock(tileCoords, map)) {
				position.y = (tileCoords.y - 1) * tileSize;
				movementVector.y = 0;
			}
			
			tileCoords.x = Math.ceil(approximateCoords.x);
			if (isBlock(tileCoords, map)) {
				position.y = (tileCoords.y - 1) * tileSize;
				movementVector.y = 0;
			}
		}
	}
	
	private static function checkTopCollision(tileCoords:Point, approximateCoords:Point, position:Point, movementVector:Point, tileSize:Int, map:Array<Array<Int>>):Void {
		// Top collision
		if (movementVector.y < 0) {
			approximateCoords.x = position.x / tileSize;
			approximateCoords.y = position.y / tileSize;
			
			tileCoords.y = Math.floor(approximateCoords.y);
			
			tileCoords.x = Math.floor(approximateCoords.x);
			if (isBlock(tileCoords, map)) {
				position.y = (tileCoords.y + 1) * tileSize;
				movementVector.y = 0;
			}
			
			tileCoords.x = Math.ceil(approximateCoords.x);
			if (isBlock(tileCoords, map)) {
				position.y = (tileCoords.y + 1) * tileSize;
				movementVector.y = 0;
			}
		}
	}
	
	private static function checkRightCollision(tileCoords:Point, approximateCoords:Point, position:Point, movementVector:Point, tileSize:Int, map:Array<Array<Int>>):Void {
		// Right collision
		if(movementVector.x > 0){
			approximateCoords.x = position.x / tileSize;
			approximateCoords.y = position.y / tileSize;
			
			tileCoords.x = Math.ceil(approximateCoords.x);
			
			tileCoords.y = Math.floor(approximateCoords.y);
			if (isBlock(tileCoords, map)) {
				position.x = (tileCoords.x - 1) * tileSize;
				movementVector.x = 0;
			}
			
			tileCoords.y = Math.ceil(approximateCoords.y);
			if (isBlock(tileCoords, map)) {
				position.x = (tileCoords.x - 1) * tileSize;
				movementVector.x = 0;
			}
		}
	}
	
	private static function checkLeftCollision(tileCoords:Point, approximateCoords:Point, position:Point, movementVector:Point, tileSize:Int, map:Array<Array<Int>>):Void {
		// Left collision
		if(movementVector.x <= 0){
			approximateCoords.x = position.x / tileSize;
			approximateCoords.y = position.y / tileSize;
			
			tileCoords.x = Math.floor(approximateCoords.x);
			
			tileCoords.y = Math.floor(approximateCoords.y);
			if (isBlock(tileCoords, map)) {
				position.x = (tileCoords.x + 1) * tileSize;
				movementVector.x = 0;
			}
			
			tileCoords.y = Math.ceil(approximateCoords.y);
			if (isBlock(tileCoords, map)) {
				position.x = (tileCoords.x + 1) * tileSize;
				movementVector.x = 0;
			}
		}
	}
	
	private static function  isBlock(coords:Point, map:Array<Array<Int>>):Bool {
		
		switch (map[Math.round(coords.y)][Math.round(coords.x)])
		{
		//tree collisons:
		case 1:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 1;
		//house collisions:
		case 12:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 12;
		case 13:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 13;
		case 14:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 14;
		case 15:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 15;
		//School Collisions:
		case 20:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 20;
		case 21:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 21;
		case 22:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 22;
		case 23:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 23;
		case 24:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 24;
		case 25:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 25;
		case 26:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 26;
		case 27:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 27;
		case 28:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 28;
		case 29:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 29;
		case 30:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 30;
		case 31:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 31;
		case 36:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 36;
		//water collisions:
		case 42:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 42;
		case 43:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 43;
		case 44:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 44;
		case 45:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 45;
		case 46:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 46;
		case 47:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 47;
		case 52:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 52;
		case 53:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 53;
		
		//default collisions
		default:
			return map[Math.round(coords.y)][Math.round(coords.x)] == 1;
		}
	}
}