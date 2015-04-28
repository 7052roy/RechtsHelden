package ;

/**
 * ...
 * @author Roy
 */
class NormWorld extends Level
{

	public function new() 
	{
		super();
	}
	
	public static function create(map:Array<Array<Int>>)
	{
		map.push([155, 49, 49,49, 49, 49, 49, 49, 156]);
		map.push([132, 103, 0, 188, 189, 184, 103, 0, 125]);
		map.push([132, 0, 0, 187, 186, 190, 0, 103, 125]);
		map.push([132, 103, 0, 185, 180, 181, 0, 0, 191]);
		map.push([132, 103, 182, 183, 179, 178, 177,  0, 125]);
		map.push([132, 0, 115, 116, 130, 131, 176,  0, 125]);
		map.push([132, 0, 103, 0, 0, 0, 0,  0, 125]);
		map.push([158, 163, 163, 163, 163, 163, 163, 163, 157]);
	}
	
}