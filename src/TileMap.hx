package ;

/**
 * Map data.
 * @author roy
 */
class TileMap
{

	public static function create(map:Array<Array<Int>>)
	{
		map.push([01, 01, 01, 01, 01, 47, 53, 53, 53, 52, 01, 01, 01, 01, 01, 01, 01, 01, 01, 11, 11, 01, 00, 00, 00]);
		map.push([01, 01, 00, 01, 00, 42, 43, 44, 45, 46, 01, 01, 20, 21, 22, 23, 24, 01, 01, 11, 11, 01, 00, 00, 00]);
		map.push([01, 00, 00, 00, 00, 00, 00, 14, 15, 03, 14, 15, 25, 26, 27, 28, 29, 01, 01, 11, 11, 01, 00, 00, 00]);
		map.push([00, 01, 00, 00, 00, 00, 00, 12, 13, 03, 12, 13, 01, 30, 31, 36, 01, 01, 01, 11, 11, 01, 00, 00, 00]);
		map.push([00, 00, 00, 00, 00, 00, 00, 02, 00, 00, 02, 00, 00, 02, 02, 02, 00, 00, 01, 11, 11, 01, 00, 00, 00]);
		map.push([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]);
		map.push([04, 06, 04, 06, 04, 06, 04, 06, 04, 06, 04, 06, 04, 06, 04, 06, 04, 06, 04, 06, 04, 06, 04, 06, 04]);
		map.push([05, 07, 05, 07, 05, 07, 05, 07, 05, 07, 05, 07, 05, 07, 05, 07, 05, 07, 05, 07, 05, 07, 05, 07, 05]);
		map.push([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]);
		map.push([00, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 01, 00, 00]);
		map.push([01, 01, 00, 01, 01, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 01, 01, 01, 00, 01, 01, 00]);
		map.push([01, 01, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01]);
		map.push([00, 00, 01, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 01, 01, 01, 01, 01, 01, 01, 00, 01]);
		map.push([00, 01, 00, 01, 01, 00, 10, 00, 00, 00, 00, 00, 00, 00, 01, 00, 01, 00, 00, 00, 00, 00, 01, 00, 01]);
		map.push([01, 00, 01, 00, 00, 01, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 01, 01, 00, 00, 00]);
	}
	
}