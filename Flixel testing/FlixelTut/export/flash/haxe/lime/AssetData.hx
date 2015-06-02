package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level_1.oel", "assets/data/level_1.oel");
			type.set ("assets/data/level_1.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level_2.oel", "assets/data/level_2.oel");
			type.set ("assets/data/level_2.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level_3.oel", "assets/data/level_3.oel");
			type.set ("assets/data/level_3.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level_4.oel", "assets/data/level_4.oel");
			type.set ("assets/data/level_4.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/reachtshelden.oep", "assets/data/reachtshelden.oep");
			type.set ("assets/data/reachtshelden.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/room-001.oel", "assets/data/room-001.oel");
			type.set ("assets/data/room-001.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/coin.png", "assets/images/coin.png");
			type.set ("assets/images/coin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemy-0.png", "assets/images/enemy-0.png");
			type.set ("assets/images/enemy-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemy-1.png", "assets/images/enemy-1.png");
			type.set ("assets/images/enemy-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemy-2.png", "assets/images/enemy-2.png");
			type.set ("assets/images/enemy-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/health.png", "assets/images/health.png");
			type.set ("assets/images/health.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/ion.png", "assets/images/ion.png");
			type.set ("assets/images/ion.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pat.png", "assets/images/pat.png");
			type.set ("assets/images/pat.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player.png", "assets/images/player.png");
			type.set ("assets/images/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pointer.png", "assets/images/pointer.png");
			type.set ("assets/images/pointer.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tec.png", "assets/images/tec.png");
			type.set ("assets/images/tec.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Tilesheet_Complete.png", "assets/images/Tilesheet_Complete.png");
			type.set ("assets/images/Tilesheet_Complete.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/townMusic.wav", "assets/music/townMusic.wav");
			type.set ("assets/music/townMusic.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/beep.mp3", "assets/sounds/beep.mp3");
			type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/flixel.mp3", "assets/sounds/flixel.mp3");
			type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
