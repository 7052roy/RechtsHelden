#if !lime_hybrid


package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if (flash || js)
import openfl.display.Loader;
import openfl.events.Event;
import openfl.net.URLLoader;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("assets/data/BaseMap.oel", "assets/data/BaseMap.oel");
		type.set ("assets/data/BaseMap.oel", AssetType.TEXT);
		path.set ("assets/data/basemap1.oel", "assets/data/basemap1.oel");
		type.set ("assets/data/basemap1.oel", AssetType.TEXT);
		path.set ("assets/data/basemap2.oel", "assets/data/basemap2.oel");
		type.set ("assets/data/basemap2.oel", AssetType.TEXT);
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		path.set ("assets/data/Final Maps/worldmap1.oel", "assets/data/Final Maps/worldmap1.oel");
		type.set ("assets/data/Final Maps/worldmap1.oel", AssetType.TEXT);
		path.set ("assets/data/Final Maps/worldmap2.oel", "assets/data/Final Maps/worldmap2.oel");
		type.set ("assets/data/Final Maps/worldmap2.oel", AssetType.TEXT);
		path.set ("assets/data/kid_dad-testing.oel", "assets/data/kid_dad-testing.oel");
		type.set ("assets/data/kid_dad-testing.oel", AssetType.TEXT);
		path.set ("assets/data/level_1.oel", "assets/data/level_1.oel");
		type.set ("assets/data/level_1.oel", AssetType.TEXT);
		path.set ("assets/data/level_2.oel", "assets/data/level_2.oel");
		type.set ("assets/data/level_2.oel", AssetType.TEXT);
		path.set ("assets/data/level_3.oel", "assets/data/level_3.oel");
		type.set ("assets/data/level_3.oel", AssetType.TEXT);
		path.set ("assets/data/level_4.oel", "assets/data/level_4.oel");
		type.set ("assets/data/level_4.oel", AssetType.TEXT);
		path.set ("assets/data/Mission1.oel", "assets/data/Mission1.oel");
		type.set ("assets/data/Mission1.oel", AssetType.TEXT);
		path.set ("assets/data/Mission1_0.oel", "assets/data/Mission1_0.oel");
		type.set ("assets/data/Mission1_0.oel", AssetType.TEXT);
		path.set ("assets/data/Mission1_1.oel", "assets/data/Mission1_1.oel");
		type.set ("assets/data/Mission1_1.oel", AssetType.TEXT);
		path.set ("assets/data/reachtshelden.oep", "assets/data/reachtshelden.oep");
		type.set ("assets/data/reachtshelden.oep", AssetType.TEXT);
		path.set ("assets/data/room-001.oel", "assets/data/room-001.oel");
		type.set ("assets/data/room-001.oel", AssetType.TEXT);
		path.set ("assets/data/testingmap.oel", "assets/data/testingmap.oel");
		type.set ("assets/data/testingmap.oel", AssetType.TEXT);
		path.set ("assets/female/kind2-1.mp3", "assets/female/kind2-1.mp3");
		type.set ("assets/female/kind2-1.mp3", AssetType.MUSIC);
		path.set ("assets/female/kind2-2.mp3", "assets/female/kind2-2.mp3");
		type.set ("assets/female/kind2-2.mp3", AssetType.MUSIC);
		path.set ("assets/female/moeder1.mp3", "assets/female/moeder1.mp3");
		type.set ("assets/female/moeder1.mp3", AssetType.MUSIC);
		path.set ("assets/female/moeder2.mp3", "assets/female/moeder2.mp3");
		type.set ("assets/female/moeder2.mp3", AssetType.MUSIC);
		path.set ("assets/images/1StartingScreeeeeeen.png", "assets/images/1StartingScreeeeeeen.png");
		type.set ("assets/images/1StartingScreeeeeeen.png", AssetType.IMAGE);
		path.set ("assets/images/AngryDadMission2.png", "assets/images/AngryDadMission2.png");
		type.set ("assets/images/AngryDadMission2.png", AssetType.IMAGE);
		path.set ("assets/images/AsianDad.png", "assets/images/AsianDad.png");
		type.set ("assets/images/AsianDad.png", AssetType.IMAGE);
		path.set ("assets/images/AsianDad.psd", "assets/images/AsianDad.psd");
		type.set ("assets/images/AsianDad.psd", AssetType.BINARY);
		path.set ("assets/images/Attack128x64.png", "assets/images/Attack128x64.png");
		type.set ("assets/images/Attack128x64.png", AssetType.IMAGE);
		path.set ("assets/images/Bald-Mission1.png", "assets/images/Bald-Mission1.png");
		type.set ("assets/images/Bald-Mission1.png", AssetType.IMAGE);
		path.set ("assets/images/Bald-Mission1.psd", "assets/images/Bald-Mission1.psd");
		type.set ("assets/images/Bald-Mission1.psd", AssetType.BINARY);
		path.set ("assets/images/BaldMission1.png", "assets/images/BaldMission1.png");
		type.set ("assets/images/BaldMission1.png", AssetType.IMAGE);
		path.set ("assets/images/Banner.psd", "assets/images/Banner.psd");
		type.set ("assets/images/Banner.psd", AssetType.BINARY);
		path.set ("assets/images/BeachBall-Mission3.png", "assets/images/BeachBall-Mission3.png");
		type.set ("assets/images/BeachBall-Mission3.png", AssetType.IMAGE);
		path.set ("assets/images/bigass HOUSE.png", "assets/images/bigass HOUSE.png");
		type.set ("assets/images/bigass HOUSE.png", AssetType.IMAGE);
		path.set ("assets/images/button.png", "assets/images/button.png");
		type.set ("assets/images/button.png", AssetType.IMAGE);
		path.set ("assets/images/CharacterTilesheet768x768.png", "assets/images/CharacterTilesheet768x768.png");
		type.set ("assets/images/CharacterTilesheet768x768.png", AssetType.IMAGE);
		path.set ("assets/images/coin.png", "assets/images/coin.png");
		type.set ("assets/images/coin.png", AssetType.IMAGE);
		path.set ("assets/images/CollectingSpirit Kopie.png", "assets/images/CollectingSpirit Kopie.png");
		type.set ("assets/images/CollectingSpirit Kopie.png", AssetType.IMAGE);
		path.set ("assets/images/DodgeBall-Mission-3.png", "assets/images/DodgeBall-Mission-3.png");
		type.set ("assets/images/DodgeBall-Mission-3.png", AssetType.IMAGE);
		path.set ("assets/images/Emo-Kid-Mission2 (1).png", "assets/images/Emo-Kid-Mission2 (1).png");
		type.set ("assets/images/Emo-Kid-Mission2 (1).png", AssetType.IMAGE);
		path.set ("assets/images/Emo-Kid-Mission3).png", "assets/images/Emo-Kid-Mission3).png");
		type.set ("assets/images/Emo-Kid-Mission3).png", AssetType.IMAGE);
		path.set ("assets/images/EmoKidMission2.png", "assets/images/EmoKidMission2.png");
		type.set ("assets/images/EmoKidMission2.png", AssetType.IMAGE);
		path.set ("assets/images/emokidMission3.png", "assets/images/emokidMission3.png");
		type.set ("assets/images/emokidMission3.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-0.png", "assets/images/enemy-0.png");
		type.set ("assets/images/enemy-0.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-1.png", "assets/images/enemy-1.png");
		type.set ("assets/images/enemy-1.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-2.png", "assets/images/enemy-2.png");
		type.set ("assets/images/enemy-2.png", AssetType.IMAGE);
		path.set ("assets/images/feggit.png", "assets/images/feggit.png");
		type.set ("assets/images/feggit.png", AssetType.IMAGE);
		path.set ("assets/images/floor.png", "assets/images/floor.png");
		type.set ("assets/images/floor.png", AssetType.IMAGE);
		path.set ("assets/images/Football-Mission-3.png", "assets/images/Football-Mission-3.png");
		type.set ("assets/images/Football-Mission-3.png", AssetType.IMAGE);
		path.set ("assets/images/Furniture.png", "assets/images/Furniture.png");
		type.set ("assets/images/Furniture.png", AssetType.IMAGE);
		path.set ("assets/images/Girl-Mission1.png", "assets/images/Girl-Mission1.png");
		type.set ("assets/images/Girl-Mission1.png", AssetType.IMAGE);
		path.set ("assets/images/girlMission1.png", "assets/images/girlMission1.png");
		type.set ("assets/images/girlMission1.png", AssetType.IMAGE);
		path.set ("assets/images/HATSNewRoadTiles.png", "assets/images/HATSNewRoadTiles.png");
		type.set ("assets/images/HATSNewRoadTiles.png", AssetType.IMAGE);
		path.set ("assets/images/HATSNewRoadTiles.psd", "assets/images/HATSNewRoadTiles.psd");
		type.set ("assets/images/HATSNewRoadTiles.psd", AssetType.BINARY);
		path.set ("assets/images/health.png", "assets/images/health.png");
		type.set ("assets/images/health.png", AssetType.IMAGE);
		path.set ("assets/images/HOLE.png", "assets/images/HOLE.png");
		type.set ("assets/images/HOLE.png", AssetType.IMAGE);
		path.set ("assets/images/HOUSE.psd", "assets/images/HOUSE.psd");
		type.set ("assets/images/HOUSE.psd", AssetType.BINARY);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/images/ion.png", "assets/images/ion.png");
		type.set ("assets/images/ion.png", AssetType.IMAGE);
		path.set ("assets/images/Judge-Mission-3.png", "assets/images/Judge-Mission-3.png");
		type.set ("assets/images/Judge-Mission-3.png", AssetType.IMAGE);
		path.set ("assets/images/Judge.png", "assets/images/Judge.png");
		type.set ("assets/images/Judge.png", AssetType.IMAGE);
		path.set ("assets/images/kind1.1.png", "assets/images/kind1.1.png");
		type.set ("assets/images/kind1.1.png", AssetType.IMAGE);
		path.set ("assets/images/kind1.2.png", "assets/images/kind1.2.png");
		type.set ("assets/images/kind1.2.png", AssetType.IMAGE);
		path.set ("assets/images/kind1.3.png", "assets/images/kind1.3.png");
		type.set ("assets/images/kind1.3.png", AssetType.IMAGE);
		path.set ("assets/images/kind1.4.png", "assets/images/kind1.4.png");
		type.set ("assets/images/kind1.4.png", AssetType.IMAGE);
		path.set ("assets/images/kind1.5.png", "assets/images/kind1.5.png");
		type.set ("assets/images/kind1.5.png", AssetType.IMAGE);
		path.set ("assets/images/kind2.1.png", "assets/images/kind2.1.png");
		type.set ("assets/images/kind2.1.png", AssetType.IMAGE);
		path.set ("assets/images/kind2.2.png", "assets/images/kind2.2.png");
		type.set ("assets/images/kind2.2.png", AssetType.IMAGE);
		path.set ("assets/images/kind2.3.png", "assets/images/kind2.3.png");
		type.set ("assets/images/kind2.3.png", AssetType.IMAGE);
		path.set ("assets/images/kind2.4.png", "assets/images/kind2.4.png");
		type.set ("assets/images/kind2.4.png", AssetType.IMAGE);
		path.set ("assets/images/kind2.5.png", "assets/images/kind2.5.png");
		type.set ("assets/images/kind2.5.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.1.png", "assets/images/kind3.1.png");
		type.set ("assets/images/kind3.1.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.2.png", "assets/images/kind3.2.png");
		type.set ("assets/images/kind3.2.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.3.png", "assets/images/kind3.3.png");
		type.set ("assets/images/kind3.3.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.4.png", "assets/images/kind3.4.png");
		type.set ("assets/images/kind3.4.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.5.png", "assets/images/kind3.5.png");
		type.set ("assets/images/kind3.5.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.6.png", "assets/images/kind3.6.png");
		type.set ("assets/images/kind3.6.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.7.png", "assets/images/kind3.7.png");
		type.set ("assets/images/kind3.7.png", AssetType.IMAGE);
		path.set ("assets/images/KJRW-Tutotial-3.png", "assets/images/KJRW-Tutotial-3.png");
		type.set ("assets/images/KJRW-Tutotial-3.png", AssetType.IMAGE);
		path.set ("assets/images/Knightmare Fight/Text1.png", "assets/images/Knightmare Fight/Text1.png");
		type.set ("assets/images/Knightmare Fight/Text1.png", AssetType.IMAGE);
		path.set ("assets/images/Knightmare.png", "assets/images/Knightmare.png");
		type.set ("assets/images/Knightmare.png", AssetType.IMAGE);
		path.set ("assets/images/KnightmareAttackTilesheet.png", "assets/images/KnightmareAttackTilesheet.png");
		type.set ("assets/images/KnightmareAttackTilesheet.png", AssetType.IMAGE);
		path.set ("assets/images/KnightmareCompleteTilesheet.png", "assets/images/KnightmareCompleteTilesheet.png");
		type.set ("assets/images/KnightmareCompleteTilesheet.png", AssetType.IMAGE);
		path.set ("assets/images/KnightmareDash.png", "assets/images/KnightmareDash.png");
		type.set ("assets/images/KnightmareDash.png", AssetType.IMAGE);
		path.set ("assets/images/KnightmareShield4.png", "assets/images/KnightmareShield4.png");
		type.set ("assets/images/KnightmareShield4.png", AssetType.IMAGE);
		path.set ("assets/images/KnightmareText.png", "assets/images/KnightmareText.png");
		type.set ("assets/images/KnightmareText.png", AssetType.IMAGE);
		path.set ("assets/images/KRJW-Tutorial.png", "assets/images/KRJW-Tutorial.png");
		type.set ("assets/images/KRJW-Tutorial.png", AssetType.IMAGE);
		path.set ("assets/images/KRJW-Tutorial.psd", "assets/images/KRJW-Tutorial.psd");
		type.set ("assets/images/KRJW-Tutorial.psd", AssetType.BINARY);
		path.set ("assets/images/Missie1/intromissie1/prof0.png", "assets/images/Missie1/intromissie1/prof0.png");
		type.set ("assets/images/Missie1/intromissie1/prof0.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof1.png", "assets/images/Missie1/intromissie1/prof1.png");
		type.set ("assets/images/Missie1/intromissie1/prof1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof2.png", "assets/images/Missie1/intromissie1/prof2.png");
		type.set ("assets/images/Missie1/intromissie1/prof2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof3.png", "assets/images/Missie1/intromissie1/prof3.png");
		type.set ("assets/images/Missie1/intromissie1/prof3.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof4.png", "assets/images/Missie1/intromissie1/prof4.png");
		type.set ("assets/images/Missie1/intromissie1/prof4.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof5.png", "assets/images/Missie1/intromissie1/prof5.png");
		type.set ("assets/images/Missie1/intromissie1/prof5.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof6.png", "assets/images/Missie1/intromissie1/prof6.png");
		type.set ("assets/images/Missie1/intromissie1/prof6.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.1.png", "assets/images/Missie2/emo1.1.png");
		type.set ("assets/images/Missie2/emo1.1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.10.png", "assets/images/Missie2/emo1.10.png");
		type.set ("assets/images/Missie2/emo1.10.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.11.png", "assets/images/Missie2/emo1.11.png");
		type.set ("assets/images/Missie2/emo1.11.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.2.png", "assets/images/Missie2/emo1.2.png");
		type.set ("assets/images/Missie2/emo1.2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.3.png", "assets/images/Missie2/emo1.3.png");
		type.set ("assets/images/Missie2/emo1.3.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.4.png", "assets/images/Missie2/emo1.4.png");
		type.set ("assets/images/Missie2/emo1.4.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.5.png", "assets/images/Missie2/emo1.5.png");
		type.set ("assets/images/Missie2/emo1.5.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.6.png", "assets/images/Missie2/emo1.6.png");
		type.set ("assets/images/Missie2/emo1.6.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.7.png", "assets/images/Missie2/emo1.7.png");
		type.set ("assets/images/Missie2/emo1.7.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.8.png", "assets/images/Missie2/emo1.8.png");
		type.set ("assets/images/Missie2/emo1.8.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.9.png", "assets/images/Missie2/emo1.9.png");
		type.set ("assets/images/Missie2/emo1.9.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Feggit1.png", "assets/images/Missie3/Feggit1.png");
		type.set ("assets/images/Missie3/Feggit1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Feggit2.png", "assets/images/Missie3/Feggit2.png");
		type.set ("assets/images/Missie3/Feggit2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Feggit3.png", "assets/images/Missie3/Feggit3.png");
		type.set ("assets/images/Missie3/Feggit3.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Feggit4.png", "assets/images/Missie3/Feggit4.png");
		type.set ("assets/images/Missie3/Feggit4.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Feggit5.png", "assets/images/Missie3/Feggit5.png");
		type.set ("assets/images/Missie3/Feggit5.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Judge1.png", "assets/images/Missie3/Judge1.png");
		type.set ("assets/images/Missie3/Judge1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Judge2.png", "assets/images/Missie3/Judge2.png");
		type.set ("assets/images/Missie3/Judge2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Mom1.png", "assets/images/Missie3/Mom1.png");
		type.set ("assets/images/Missie3/Mom1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Mom2.png", "assets/images/Missie3/Mom2.png");
		type.set ("assets/images/Missie3/Mom2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Mom3.png", "assets/images/Missie3/Mom3.png");
		type.set ("assets/images/Missie3/Mom3.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro1.png", "assets/images/Missie3/Pro1.png");
		type.set ("assets/images/Missie3/Pro1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro2.png", "assets/images/Missie3/Pro2.png");
		type.set ("assets/images/Missie3/Pro2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro3.png", "assets/images/Missie3/Pro3.png");
		type.set ("assets/images/Missie3/Pro3.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro4.png", "assets/images/Missie3/Pro4.png");
		type.set ("assets/images/Missie3/Pro4.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro5.png", "assets/images/Missie3/Pro5.png");
		type.set ("assets/images/Missie3/Pro5.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro6.png", "assets/images/Missie3/Pro6.png");
		type.set ("assets/images/Missie3/Pro6.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro7.png", "assets/images/Missie3/Pro7.png");
		type.set ("assets/images/Missie3/Pro7.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro8.png", "assets/images/Missie3/Pro8.png");
		type.set ("assets/images/Missie3/Pro8.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Prof9.png", "assets/images/Missie3/Prof9.png");
		type.set ("assets/images/Missie3/Prof9.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Thumbs2.db", "assets/images/Missie3/Thumbs2.db");
		type.set ("assets/images/Missie3/Thumbs2.db", AssetType.BINARY);
		path.set ("assets/images/Mission1Girl.png", "assets/images/Mission1Girl.png");
		type.set ("assets/images/Mission1Girl.png", AssetType.IMAGE);
		path.set ("assets/images/Mission2Football.png", "assets/images/Mission2Football.png");
		type.set ("assets/images/Mission2Football.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3 Dodgeball.png", "assets/images/Mission3 Dodgeball.png");
		type.set ("assets/images/Mission3 Dodgeball.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3 Dodgeball.psd", "assets/images/Mission3 Dodgeball.psd");
		type.set ("assets/images/Mission3 Dodgeball.psd", AssetType.BINARY);
		path.set ("assets/images/Mission3-Mother.png", "assets/images/Mission3-Mother.png");
		type.set ("assets/images/Mission3-Mother.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid1.png", "assets/images/Mission3Kid1.png");
		type.set ("assets/images/Mission3Kid1.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid2.png", "assets/images/Mission3Kid2.png");
		type.set ("assets/images/Mission3Kid2.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid3.png", "assets/images/Mission3Kid3.png");
		type.set ("assets/images/Mission3Kid3.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid4.png", "assets/images/Mission3Kid4.png");
		type.set ("assets/images/Mission3Kid4.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid5.png", "assets/images/Mission3Kid5.png");
		type.set ("assets/images/Mission3Kid5.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid6.png", "assets/images/Mission3Kid6.png");
		type.set ("assets/images/Mission3Kid6.png", AssetType.IMAGE);
		path.set ("assets/images/Mom.png", "assets/images/Mom.png");
		type.set ("assets/images/Mom.png", AssetType.IMAGE);
		path.set ("assets/images/Mother-Mission-3.psd", "assets/images/Mother-Mission-3.psd");
		type.set ("assets/images/Mother-Mission-3.psd", AssetType.BINARY);
		path.set ("assets/images/NEWTilesheet_Complete.png", "assets/images/NEWTilesheet_Complete.png");
		type.set ("assets/images/NEWTilesheet_Complete.png", AssetType.IMAGE);
		path.set ("assets/images/NEW_Tilesheet_Complete.png", "assets/images/NEW_Tilesheet_Complete.png");
		type.set ("assets/images/NEW_Tilesheet_Complete.png", AssetType.IMAGE);
		path.set ("assets/images/NEW_Tilesheet_Complete.psd", "assets/images/NEW_Tilesheet_Complete.psd");
		type.set ("assets/images/NEW_Tilesheet_Complete.psd", AssetType.BINARY);
		path.set ("assets/images/NPCCharacterTilesheet.png", "assets/images/NPCCharacterTilesheet.png");
		type.set ("assets/images/NPCCharacterTilesheet.png", AssetType.IMAGE);
		path.set ("assets/images/pat.png", "assets/images/pat.png");
		type.set ("assets/images/pat.png", AssetType.IMAGE);
		path.set ("assets/images/player.png", "assets/images/player.png");
		type.set ("assets/images/player.png", AssetType.IMAGE);
		path.set ("assets/images/pointer.png", "assets/images/pointer.png");
		type.set ("assets/images/pointer.png", AssetType.IMAGE);
		path.set ("assets/images/Principle.png", "assets/images/Principle.png");
		type.set ("assets/images/Principle.png", AssetType.IMAGE);
		path.set ("assets/images/Principle.psd", "assets/images/Principle.psd");
		type.set ("assets/images/Principle.psd", AssetType.BINARY);
		path.set ("assets/images/resetbutton.png", "assets/images/resetbutton.png");
		type.set ("assets/images/resetbutton.png", AssetType.IMAGE);
		path.set ("assets/images/SChool modified.png", "assets/images/SChool modified.png");
		type.set ("assets/images/SChool modified.png", AssetType.IMAGE);
		path.set ("assets/images/Speechbubble.png", "assets/images/Speechbubble.png");
		type.set ("assets/images/Speechbubble.png", AssetType.IMAGE);
		path.set ("assets/images/Speechbubble.psd", "assets/images/Speechbubble.psd");
		type.set ("assets/images/Speechbubble.psd", AssetType.BINARY);
		path.set ("assets/images/Starting Screen.jpg", "assets/images/Starting Screen.jpg");
		type.set ("assets/images/Starting Screen.jpg", AssetType.IMAGE);
		path.set ("assets/images/Story/1.png", "assets/images/Story/1.png");
		type.set ("assets/images/Story/1.png", AssetType.IMAGE);
		path.set ("assets/images/Story/2.png", "assets/images/Story/2.png");
		type.set ("assets/images/Story/2.png", AssetType.IMAGE);
		path.set ("assets/images/Story/3.png", "assets/images/Story/3.png");
		type.set ("assets/images/Story/3.png", AssetType.IMAGE);
		path.set ("assets/images/Story/4.png", "assets/images/Story/4.png");
		type.set ("assets/images/Story/4.png", AssetType.IMAGE);
		path.set ("assets/images/Story/Introscreen.png", "assets/images/Story/Introscreen.png");
		type.set ("assets/images/Story/Introscreen.png", AssetType.IMAGE);
		path.set ("assets/images/Story/Pat.png", "assets/images/Story/Pat.png");
		type.set ("assets/images/Story/Pat.png", AssetType.IMAGE);
		path.set ("assets/images/Story/Prof.png", "assets/images/Story/Prof.png");
		type.set ("assets/images/Story/Prof.png", AssetType.IMAGE);
		path.set ("assets/images/Story/Tec.png", "assets/images/Story/Tec.png");
		type.set ("assets/images/Story/Tec.png", AssetType.IMAGE);
		path.set ("assets/images/street.PNG", "assets/images/street.PNG");
		type.set ("assets/images/street.PNG", AssetType.IMAGE);
		path.set ("assets/images/SWAG-Kid-Walk-Kopie.png", "assets/images/SWAG-Kid-Walk-Kopie.png");
		type.set ("assets/images/SWAG-Kid-Walk-Kopie.png", AssetType.IMAGE);
		path.set ("assets/images/Swagkid.png", "assets/images/Swagkid.png");
		type.set ("assets/images/Swagkid.png", AssetType.IMAGE);
		path.set ("assets/images/SwagKidMission1.png", "assets/images/SwagKidMission1.png");
		type.set ("assets/images/SwagKidMission1.png", AssetType.IMAGE);
		path.set ("assets/images/Teacher.png", "assets/images/Teacher.png");
		type.set ("assets/images/Teacher.png", AssetType.IMAGE);
		path.set ("assets/images/teacher1.png", "assets/images/teacher1.png");
		type.set ("assets/images/teacher1.png", AssetType.IMAGE);
		path.set ("assets/images/tec.png", "assets/images/tec.png");
		type.set ("assets/images/tec.png", AssetType.IMAGE);
		path.set ("assets/images/Thumbs3.db", "assets/images/Thumbs3.db");
		type.set ("assets/images/Thumbs3.db", AssetType.BINARY);
		path.set ("assets/images/tiles.png", "assets/images/tiles.png");
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		path.set ("assets/images/Tilesheet_Complete.png", "assets/images/Tilesheet_Complete.png");
		type.set ("assets/images/Tilesheet_Complete.png", AssetType.IMAGE);
		path.set ("assets/images/Tilesheet_Complete.psd", "assets/images/Tilesheet_Complete.psd");
		type.set ("assets/images/Tilesheet_Complete.psd", AssetType.BINARY);
		path.set ("assets/images/Wall.psd", "assets/images/Wall.psd");
		type.set ("assets/images/Wall.psd", AssetType.BINARY);
		path.set ("assets/images/WallKJRW.png", "assets/images/WallKJRW.png");
		type.set ("assets/images/WallKJRW.png", AssetType.IMAGE);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/music/select.wav", "assets/music/select.wav");
		type.set ("assets/music/select.wav", AssetType.SOUND);
		path.set ("assets/music/townMusic.wav", "assets/music/townMusic.wav");
		type.set ("assets/music/townMusic.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/dooropening.mp3", "assets/sounds/Abilities/dooropening.mp3");
		type.set ("assets/sounds/Abilities/dooropening.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Heal.mp3", "assets/sounds/Abilities/Heal.mp3");
		type.set ("assets/sounds/Abilities/Heal.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Heal1.mp3", "assets/sounds/Abilities/Heal1.mp3");
		type.set ("assets/sounds/Abilities/Heal1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatIndoor.mp3", "assets/sounds/Abilities/PatIndoor.mp3");
		type.set ("assets/sounds/Abilities/PatIndoor.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatIndoor2.mp3", "assets/sounds/Abilities/PatIndoor2.mp3");
		type.set ("assets/sounds/Abilities/PatIndoor2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatKnigthmare.mp3", "assets/sounds/Abilities/PatKnigthmare.mp3");
		type.set ("assets/sounds/Abilities/PatKnigthmare.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatKnigthmare1.mp3", "assets/sounds/Abilities/PatKnigthmare1.mp3");
		type.set ("assets/sounds/Abilities/PatKnigthmare1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatOutdoor.mp3", "assets/sounds/Abilities/PatOutdoor.mp3");
		type.set ("assets/sounds/Abilities/PatOutdoor.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatOutdoor1.mp3", "assets/sounds/Abilities/PatOutdoor1.mp3");
		type.set ("assets/sounds/Abilities/PatOutdoor1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Shield.mp3", "assets/sounds/Abilities/Shield.mp3");
		type.set ("assets/sounds/Abilities/Shield.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Shield1.mp3", "assets/sounds/Abilities/Shield1.mp3");
		type.set ("assets/sounds/Abilities/Shield1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Source/1.mp3", "assets/sounds/Abilities/Source/1.mp3");
		type.set ("assets/sounds/Abilities/Source/1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Source/2.mp3", "assets/sounds/Abilities/Source/2.mp3");
		type.set ("assets/sounds/Abilities/Source/2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Source/3.mp3", "assets/sounds/Abilities/Source/3.mp3");
		type.set ("assets/sounds/Abilities/Source/3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Source/Heal.wav", "assets/sounds/Abilities/Source/Heal.wav");
		type.set ("assets/sounds/Abilities/Source/Heal.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Heal1.wav", "assets/sounds/Abilities/Source/Heal1.wav");
		type.set ("assets/sounds/Abilities/Source/Heal1.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Hit_Hurt18.wav", "assets/sounds/Abilities/Source/Hit_Hurt18.wav");
		type.set ("assets/sounds/Abilities/Source/Hit_Hurt18.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Hit_Hurt32.wav", "assets/sounds/Abilities/Source/Hit_Hurt32.wav");
		type.set ("assets/sounds/Abilities/Source/Hit_Hurt32.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav", "assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav");
		type.set ("assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Push.wav", "assets/sounds/Abilities/Source/Push.wav");
		type.set ("assets/sounds/Abilities/Source/Push.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Push1.wav", "assets/sounds/Abilities/Source/Push1.wav");
		type.set ("assets/sounds/Abilities/Source/Push1.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Shield1.wav", "assets/sounds/Abilities/Source/Shield1.wav");
		type.set ("assets/sounds/Abilities/Source/Shield1.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/switch.mp3", "assets/sounds/Abilities/switch.mp3");
		type.set ("assets/sounds/Abilities/switch.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Game/JUDGE-O-METERCOIN.mp3", "assets/sounds/Game/JUDGE-O-METERCOIN.mp3");
		type.set ("assets/sounds/Game/JUDGE-O-METERCOIN.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Game/select-1.wav", "assets/sounds/Game/select-1.wav");
		type.set ("assets/sounds/Game/select-1.wav", AssetType.SOUND);
		path.set ("assets/sounds/Gesprek1.wav", "assets/sounds/Gesprek1.wav");
		type.set ("assets/sounds/Gesprek1.wav", AssetType.SOUND);
		path.set ("assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3", "assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3");
		type.set ("assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/2GoedGedaan.mp3", "assets/sounds/IntroMissie/2GoedGedaan.mp3");
		type.set ("assets/sounds/IntroMissie/2GoedGedaan.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/3PatInstructie.mp3", "assets/sounds/IntroMissie/3PatInstructie.mp3");
		type.set ("assets/sounds/IntroMissie/3PatInstructie.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/4TecInstructie1.mp3", "assets/sounds/IntroMissie/4TecInstructie1.mp3");
		type.set ("assets/sounds/IntroMissie/4TecInstructie1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/5TecInstructie2.mp3", "assets/sounds/IntroMissie/5TecInstructie2.mp3");
		type.set ("assets/sounds/IntroMissie/5TecInstructie2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/6ProfInstructie.mp3", "assets/sounds/IntroMissie/6ProfInstructie.mp3");
		type.set ("assets/sounds/IntroMissie/6ProfInstructie.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/7IntroOutro.mp3", "assets/sounds/IntroMissie/7IntroOutro.mp3");
		type.set ("assets/sounds/IntroMissie/7IntroOutro.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroVoice.mp3", "assets/sounds/IntroVoice.mp3");
		type.set ("assets/sounds/IntroVoice.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare1.mp3", "assets/sounds/Knightmare/Knightmare1.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare2.mp3", "assets/sounds/Knightmare/Knightmare2.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare3.mp3", "assets/sounds/Knightmare/Knightmare3.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare4.mp3", "assets/sounds/Knightmare/Knightmare4.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare5.mp3", "assets/sounds/Knightmare/Knightmare5.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare5.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare6.mp3", "assets/sounds/Knightmare/Knightmare6.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare6.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare7.mp3", "assets/sounds/Knightmare/Knightmare7.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare7.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare8.mp3", "assets/sounds/Knightmare/Knightmare8.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare8.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind1/Kind1-1.mp3", "assets/sounds/Missie1/Kind1/Kind1-1.mp3");
		type.set ("assets/sounds/Missie1/Kind1/Kind1-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind1/Kind1-2.mp3", "assets/sounds/Missie1/Kind1/Kind1-2.mp3");
		type.set ("assets/sounds/Missie1/Kind1/Kind1-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", "assets/sounds/Missie1/Kind1/Prof1-4.mp3");
		type.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", "assets/sounds/Missie1/Kind1/Prof2-4.mp3");
		type.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", "assets/sounds/Missie1/Kind1/Prof3-4.mp3");
		type.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", "assets/sounds/Missie1/Kind2/Prof1-1.mp3");
		type.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", "assets/sounds/Missie1/Kind2/Prof2-1.mp3");
		type.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", "assets/sounds/Missie1/Kind2/Prof3-1.mp3");
		type.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Kind3-1.mp3", "assets/sounds/Missie1/Kind3/Kind3-1.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Kind3-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Kind3-2.mp3", "assets/sounds/Missie1/Kind3/Kind3-2.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Kind3-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Kind3-3.mp3", "assets/sounds/Missie1/Kind3/Kind3-3.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Kind3-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Prof1-2.mp3", "assets/sounds/Missie1/Kind3/Prof1-2.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Prof1-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Prof2-2.mp3", "assets/sounds/Missie1/Kind3/Prof2-2.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Prof2-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Prof3-2.mp3", "assets/sounds/Missie1/Kind3/Prof3-2.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Prof3-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Prof4-2.mp3", "assets/sounds/Missie1/Kind3/Prof4-2.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Prof4-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Prof4-3.mp3", "assets/sounds/Missie1/Prof4-3.mp3");
		type.set ("assets/sounds/Missie1/Prof4-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Prof1-3.mp3", "assets/sounds/Missie1/Teacher/Prof1-3.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Prof1-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Prof2-3.mp3", "assets/sounds/Missie1/Teacher/Prof2-3.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Prof2-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Prof3-3.mp3", "assets/sounds/Missie1/Teacher/Prof3-3.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Prof3-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Teacher1-1.mp3", "assets/sounds/Missie1/Teacher/Teacher1-1.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Teacher1-2.mp3", "assets/sounds/Missie1/Teacher/Teacher1-2.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", "assets/sounds/Missie1/Teacher/Teacher1-3.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Teacher1-4.mp3", "assets/sounds/Missie1/Teacher/Teacher1-4.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Teacher1.mp3", "assets/sounds/Missie1/Teacher/Teacher1.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Teacher1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Dad1.mp3", "assets/sounds/Missie2/Dad1.mp3");
		type.set ("assets/sounds/Missie2/Dad1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Dad2.mp3", "assets/sounds/Missie2/Dad2.mp3");
		type.set ("assets/sounds/Missie2/Dad2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Dad3.mp3", "assets/sounds/Missie2/Dad3.mp3");
		type.set ("assets/sounds/Missie2/Dad3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Kid1.mp3", "assets/sounds/Missie2/Kid1.mp3");
		type.set ("assets/sounds/Missie2/Kid1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Kid2.mp3", "assets/sounds/Missie2/Kid2.mp3");
		type.set ("assets/sounds/Missie2/Kid2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Kid3.mp3", "assets/sounds/Missie2/Kid3.mp3");
		type.set ("assets/sounds/Missie2/Kid3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Prof1.mp3", "assets/sounds/Missie2/Prof1.mp3");
		type.set ("assets/sounds/Missie2/Prof1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Prof2.mp3", "assets/sounds/Missie2/Prof2.mp3");
		type.set ("assets/sounds/Missie2/Prof2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Prof3.mp3", "assets/sounds/Missie2/Prof3.mp3");
		type.set ("assets/sounds/Missie2/Prof3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Prof4.mp3", "assets/sounds/Missie2/Prof4.mp3");
		type.set ("assets/sounds/Missie2/Prof4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Prof5.mp3", "assets/sounds/Missie2/Prof5.mp3");
		type.set ("assets/sounds/Missie2/Prof5.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-1.mp3", "assets/sounds/Missie3/Missie3-1.mp3");
		type.set ("assets/sounds/Missie3/Missie3-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-10.mp3", "assets/sounds/Missie3/Missie3-10.mp3");
		type.set ("assets/sounds/Missie3/Missie3-10.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-12.mp3", "assets/sounds/Missie3/Missie3-12.mp3");
		type.set ("assets/sounds/Missie3/Missie3-12.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-14.mp3", "assets/sounds/Missie3/Missie3-14.mp3");
		type.set ("assets/sounds/Missie3/Missie3-14.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-15.mp3", "assets/sounds/Missie3/Missie3-15.mp3");
		type.set ("assets/sounds/Missie3/Missie3-15.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-2.mp3", "assets/sounds/Missie3/Missie3-2.mp3");
		type.set ("assets/sounds/Missie3/Missie3-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-3.mp3", "assets/sounds/Missie3/Missie3-3.mp3");
		type.set ("assets/sounds/Missie3/Missie3-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-4.mp3", "assets/sounds/Missie3/Missie3-4.mp3");
		type.set ("assets/sounds/Missie3/Missie3-4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-5.mp3", "assets/sounds/Missie3/Missie3-5.mp3");
		type.set ("assets/sounds/Missie3/Missie3-5.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-6.mp3", "assets/sounds/Missie3/Missie3-6.mp3");
		type.set ("assets/sounds/Missie3/Missie3-6.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-7.mp3", "assets/sounds/Missie3/Missie3-7.mp3");
		type.set ("assets/sounds/Missie3/Missie3-7.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-8.mp3", "assets/sounds/Missie3/Missie3-8.mp3");
		type.set ("assets/sounds/Missie3/Missie3-8.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Music/Chase.mp3", "assets/sounds/Music/Chase.mp3");
		type.set ("assets/sounds/Music/Chase.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Music/Haahn's Dutch.wav", "assets/sounds/Music/Haahn's Dutch.wav");
		type.set ("assets/sounds/Music/Haahn's Dutch.wav", AssetType.SOUND);
		path.set ("assets/sounds/Music/Lab Junk.wav", "assets/sounds/Music/Lab Junk.wav");
		type.set ("assets/sounds/Music/Lab Junk.wav", AssetType.SOUND);
		path.set ("assets/sounds/Music/Puzzle.mp3", "assets/sounds/Music/Puzzle.mp3");
		type.set ("assets/sounds/Music/Puzzle.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Music/Townsong.mp3", "assets/sounds/Music/Townsong.mp3");
		type.set ("assets/sounds/Music/Townsong.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/Tjalle/Back.png", "assets/sounds/Tjalle/Back.png");
		type.set ("assets/sounds/Tjalle/Back.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/Grass Flower 64x64.png", "assets/sounds/Tjalle/Grass Flower 64x64.png");
		type.set ("assets/sounds/Tjalle/Grass Flower 64x64.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/NewRoadTiles.png", "assets/sounds/Tjalle/NewRoadTiles.png");
		type.set ("assets/sounds/Tjalle/NewRoadTiles.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/Police.png", "assets/sounds/Tjalle/Police.png");
		type.set ("assets/sounds/Tjalle/Police.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/Schooltile.png", "assets/sounds/Tjalle/Schooltile.png");
		type.set ("assets/sounds/Tjalle/Schooltile.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/Trashcan.png", "assets/sounds/Tjalle/Trashcan.png");
		type.set ("assets/sounds/Tjalle/Trashcan.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/Water.png", "assets/sounds/Tjalle/Water.png");
		type.set ("assets/sounds/Tjalle/Water.png", AssetType.IMAGE);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/BaseMap.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/basemap1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/basemap2.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/worldmap1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/worldmap2.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/kid_dad-testing.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/level_1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/level_2.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/level_3.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/level_4.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/Mission1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/Mission1_0.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/Mission1_1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/reachtshelden.oep";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/room-001.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/testingmap.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/female/kind2-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/female/kind2-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/female/moeder1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/female/moeder2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/images/1StartingScreeeeeeen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/AngryDadMission2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/AsianDad.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/AsianDad.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Attack128x64.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Bald-Mission1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Bald-Mission1.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/BaldMission1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Banner.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/BeachBall-Mission3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bigass HOUSE.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/button.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CharacterTilesheet768x768.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/coin.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CollectingSpirit Kopie.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/DodgeBall-Mission-3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Emo-Kid-Mission2 (1).png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Emo-Kid-Mission3).png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/EmoKidMission2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/emokidMission3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/feggit.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/floor.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Football-Mission-3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Furniture.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Girl-Mission1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/girlMission1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HATSNewRoadTiles.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HATSNewRoadTiles.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/health.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HOLE.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HOUSE.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/ion.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Judge-Mission-3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Judge.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind1.1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind1.2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind1.3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind1.4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind1.5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind2.1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind2.2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind2.3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind2.4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind2.5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.7.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KJRW-Tutotial-3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Knightmare Fight/Text1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Knightmare.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareAttackTilesheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareCompleteTilesheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareDash.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareShield4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareText.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KRJW-Tutorial.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KRJW-Tutorial.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Missie1/intromissie1/prof0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.10.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.11.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.7.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.8.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.9.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Feggit1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Feggit2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Feggit3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Feggit4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Feggit5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Judge1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Judge2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Mom1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Mom2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Mom3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro7.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro8.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Prof9.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Thumbs2.db";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Mission1Girl.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission2Football.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3 Dodgeball.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3 Dodgeball.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Mission3-Mother.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mom.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mother-Mission-3.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/NEWTilesheet_Complete.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NEW_Tilesheet_Complete.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NEW_Tilesheet_Complete.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/NPCCharacterTilesheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pat.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/player.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pointer.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Principle.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Principle.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/resetbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SChool modified.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Speechbubble.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Speechbubble.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Starting Screen.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/Introscreen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/Pat.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/Prof.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/Tec.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/street.PNG";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SWAG-Kid-Walk-Kopie.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Swagkid.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SwagKidMission1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Teacher.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/teacher1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tec.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Thumbs3.db";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/tiles.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tilesheet_Complete.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tilesheet_Complete.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Wall.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/WallKJRW.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/select.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/music/townMusic.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/dooropening.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Heal.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Heal1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatIndoor.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatIndoor2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatKnigthmare.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatKnigthmare1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatOutdoor.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatOutdoor1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Shield.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Shield1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Source/1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Source/2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Source/3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Source/Heal.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Heal1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Hit_Hurt18.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Hit_Hurt32.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Push.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Push1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Shield1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/switch.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Game/JUDGE-O-METERCOIN.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Game/select-1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Gesprek1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/2GoedGedaan.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/3PatInstructie.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/4TecInstructie1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/5TecInstructie2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/6ProfInstructie.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/7IntroOutro.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroVoice.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare5.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare6.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare7.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare8.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind1/Kind1-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind1/Kind1-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind1/Prof1-4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind1/Prof2-4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind1/Prof3-4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind2/Prof1-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind2/Prof2-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind2/Prof3-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Kind3-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Kind3-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Kind3-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Prof1-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Prof2-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Prof3-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Prof4-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Prof4-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Prof1-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Prof2-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Prof3-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Teacher1-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Teacher1-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Teacher1-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Teacher1-4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Teacher1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Dad1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Dad2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Dad3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Kid1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Kid2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Kid3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Prof1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Prof2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Prof3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Prof4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Prof5.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-10.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-12.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-14.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-15.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-5.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-6.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-7.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-8.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Chase.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Haahn's Dutch.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Music/Lab Junk.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Music/Puzzle.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Townsong.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Tjalle/Back.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/Grass Flower 64x64.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/NewRoadTiles.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/Police.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/Schooltile.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/Trashcan.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/Water.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		
		
		#else
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);

		#elseif (js || openfl_html5 || pixi)
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash


























































































































































































































































































#elseif html5


























































































































































































































































































#else

#if (windows || mac || linux)







#else




#end

#end


#else


package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("assets/data/BaseMap.oel", "assets/data/BaseMap.oel");
		type.set ("assets/data/BaseMap.oel", AssetType.TEXT);
		path.set ("assets/data/basemap1.oel", "assets/data/basemap1.oel");
		type.set ("assets/data/basemap1.oel", AssetType.TEXT);
		path.set ("assets/data/basemap2.oel", "assets/data/basemap2.oel");
		type.set ("assets/data/basemap2.oel", AssetType.TEXT);
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		path.set ("assets/data/Final Maps/worldmap1.oel", "assets/data/Final Maps/worldmap1.oel");
		type.set ("assets/data/Final Maps/worldmap1.oel", AssetType.TEXT);
		path.set ("assets/data/Final Maps/worldmap2.oel", "assets/data/Final Maps/worldmap2.oel");
		type.set ("assets/data/Final Maps/worldmap2.oel", AssetType.TEXT);
		path.set ("assets/data/kid_dad-testing.oel", "assets/data/kid_dad-testing.oel");
		type.set ("assets/data/kid_dad-testing.oel", AssetType.TEXT);
		path.set ("assets/data/level_1.oel", "assets/data/level_1.oel");
		type.set ("assets/data/level_1.oel", AssetType.TEXT);
		path.set ("assets/data/level_2.oel", "assets/data/level_2.oel");
		type.set ("assets/data/level_2.oel", AssetType.TEXT);
		path.set ("assets/data/level_3.oel", "assets/data/level_3.oel");
		type.set ("assets/data/level_3.oel", AssetType.TEXT);
		path.set ("assets/data/level_4.oel", "assets/data/level_4.oel");
		type.set ("assets/data/level_4.oel", AssetType.TEXT);
		path.set ("assets/data/Mission1.oel", "assets/data/Mission1.oel");
		type.set ("assets/data/Mission1.oel", AssetType.TEXT);
		path.set ("assets/data/Mission1_0.oel", "assets/data/Mission1_0.oel");
		type.set ("assets/data/Mission1_0.oel", AssetType.TEXT);
		path.set ("assets/data/Mission1_1.oel", "assets/data/Mission1_1.oel");
		type.set ("assets/data/Mission1_1.oel", AssetType.TEXT);
		path.set ("assets/data/reachtshelden.oep", "assets/data/reachtshelden.oep");
		type.set ("assets/data/reachtshelden.oep", AssetType.TEXT);
		path.set ("assets/data/room-001.oel", "assets/data/room-001.oel");
		type.set ("assets/data/room-001.oel", AssetType.TEXT);
		path.set ("assets/data/testingmap.oel", "assets/data/testingmap.oel");
		type.set ("assets/data/testingmap.oel", AssetType.TEXT);
		path.set ("assets/female/kind2-1.mp3", "assets/female/kind2-1.mp3");
		type.set ("assets/female/kind2-1.mp3", AssetType.MUSIC);
		path.set ("assets/female/kind2-2.mp3", "assets/female/kind2-2.mp3");
		type.set ("assets/female/kind2-2.mp3", AssetType.MUSIC);
		path.set ("assets/female/moeder1.mp3", "assets/female/moeder1.mp3");
		type.set ("assets/female/moeder1.mp3", AssetType.MUSIC);
		path.set ("assets/female/moeder2.mp3", "assets/female/moeder2.mp3");
		type.set ("assets/female/moeder2.mp3", AssetType.MUSIC);
		path.set ("assets/images/1StartingScreeeeeeen.png", "assets/images/1StartingScreeeeeeen.png");
		type.set ("assets/images/1StartingScreeeeeeen.png", AssetType.IMAGE);
		path.set ("assets/images/AngryDadMission2.png", "assets/images/AngryDadMission2.png");
		type.set ("assets/images/AngryDadMission2.png", AssetType.IMAGE);
		path.set ("assets/images/AsianDad.png", "assets/images/AsianDad.png");
		type.set ("assets/images/AsianDad.png", AssetType.IMAGE);
		path.set ("assets/images/AsianDad.psd", "assets/images/AsianDad.psd");
		type.set ("assets/images/AsianDad.psd", AssetType.BINARY);
		path.set ("assets/images/Attack128x64.png", "assets/images/Attack128x64.png");
		type.set ("assets/images/Attack128x64.png", AssetType.IMAGE);
		path.set ("assets/images/Bald-Mission1.png", "assets/images/Bald-Mission1.png");
		type.set ("assets/images/Bald-Mission1.png", AssetType.IMAGE);
		path.set ("assets/images/Bald-Mission1.psd", "assets/images/Bald-Mission1.psd");
		type.set ("assets/images/Bald-Mission1.psd", AssetType.BINARY);
		path.set ("assets/images/BaldMission1.png", "assets/images/BaldMission1.png");
		type.set ("assets/images/BaldMission1.png", AssetType.IMAGE);
		path.set ("assets/images/Banner.psd", "assets/images/Banner.psd");
		type.set ("assets/images/Banner.psd", AssetType.BINARY);
		path.set ("assets/images/BeachBall-Mission3.png", "assets/images/BeachBall-Mission3.png");
		type.set ("assets/images/BeachBall-Mission3.png", AssetType.IMAGE);
		path.set ("assets/images/bigass HOUSE.png", "assets/images/bigass HOUSE.png");
		type.set ("assets/images/bigass HOUSE.png", AssetType.IMAGE);
		path.set ("assets/images/button.png", "assets/images/button.png");
		type.set ("assets/images/button.png", AssetType.IMAGE);
		path.set ("assets/images/CharacterTilesheet768x768.png", "assets/images/CharacterTilesheet768x768.png");
		type.set ("assets/images/CharacterTilesheet768x768.png", AssetType.IMAGE);
		path.set ("assets/images/coin.png", "assets/images/coin.png");
		type.set ("assets/images/coin.png", AssetType.IMAGE);
		path.set ("assets/images/CollectingSpirit Kopie.png", "assets/images/CollectingSpirit Kopie.png");
		type.set ("assets/images/CollectingSpirit Kopie.png", AssetType.IMAGE);
		path.set ("assets/images/DodgeBall-Mission-3.png", "assets/images/DodgeBall-Mission-3.png");
		type.set ("assets/images/DodgeBall-Mission-3.png", AssetType.IMAGE);
		path.set ("assets/images/Emo-Kid-Mission2 (1).png", "assets/images/Emo-Kid-Mission2 (1).png");
		type.set ("assets/images/Emo-Kid-Mission2 (1).png", AssetType.IMAGE);
		path.set ("assets/images/Emo-Kid-Mission3).png", "assets/images/Emo-Kid-Mission3).png");
		type.set ("assets/images/Emo-Kid-Mission3).png", AssetType.IMAGE);
		path.set ("assets/images/EmoKidMission2.png", "assets/images/EmoKidMission2.png");
		type.set ("assets/images/EmoKidMission2.png", AssetType.IMAGE);
		path.set ("assets/images/emokidMission3.png", "assets/images/emokidMission3.png");
		type.set ("assets/images/emokidMission3.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-0.png", "assets/images/enemy-0.png");
		type.set ("assets/images/enemy-0.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-1.png", "assets/images/enemy-1.png");
		type.set ("assets/images/enemy-1.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-2.png", "assets/images/enemy-2.png");
		type.set ("assets/images/enemy-2.png", AssetType.IMAGE);
		path.set ("assets/images/feggit.png", "assets/images/feggit.png");
		type.set ("assets/images/feggit.png", AssetType.IMAGE);
		path.set ("assets/images/floor.png", "assets/images/floor.png");
		type.set ("assets/images/floor.png", AssetType.IMAGE);
		path.set ("assets/images/Football-Mission-3.png", "assets/images/Football-Mission-3.png");
		type.set ("assets/images/Football-Mission-3.png", AssetType.IMAGE);
		path.set ("assets/images/Furniture.png", "assets/images/Furniture.png");
		type.set ("assets/images/Furniture.png", AssetType.IMAGE);
		path.set ("assets/images/Girl-Mission1.png", "assets/images/Girl-Mission1.png");
		type.set ("assets/images/Girl-Mission1.png", AssetType.IMAGE);
		path.set ("assets/images/girlMission1.png", "assets/images/girlMission1.png");
		type.set ("assets/images/girlMission1.png", AssetType.IMAGE);
		path.set ("assets/images/HATSNewRoadTiles.png", "assets/images/HATSNewRoadTiles.png");
		type.set ("assets/images/HATSNewRoadTiles.png", AssetType.IMAGE);
		path.set ("assets/images/HATSNewRoadTiles.psd", "assets/images/HATSNewRoadTiles.psd");
		type.set ("assets/images/HATSNewRoadTiles.psd", AssetType.BINARY);
		path.set ("assets/images/health.png", "assets/images/health.png");
		type.set ("assets/images/health.png", AssetType.IMAGE);
		path.set ("assets/images/HOLE.png", "assets/images/HOLE.png");
		type.set ("assets/images/HOLE.png", AssetType.IMAGE);
		path.set ("assets/images/HOUSE.psd", "assets/images/HOUSE.psd");
		type.set ("assets/images/HOUSE.psd", AssetType.BINARY);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/images/ion.png", "assets/images/ion.png");
		type.set ("assets/images/ion.png", AssetType.IMAGE);
		path.set ("assets/images/Judge-Mission-3.png", "assets/images/Judge-Mission-3.png");
		type.set ("assets/images/Judge-Mission-3.png", AssetType.IMAGE);
		path.set ("assets/images/Judge.png", "assets/images/Judge.png");
		type.set ("assets/images/Judge.png", AssetType.IMAGE);
		path.set ("assets/images/kind1.1.png", "assets/images/kind1.1.png");
		type.set ("assets/images/kind1.1.png", AssetType.IMAGE);
		path.set ("assets/images/kind1.2.png", "assets/images/kind1.2.png");
		type.set ("assets/images/kind1.2.png", AssetType.IMAGE);
		path.set ("assets/images/kind1.3.png", "assets/images/kind1.3.png");
		type.set ("assets/images/kind1.3.png", AssetType.IMAGE);
		path.set ("assets/images/kind1.4.png", "assets/images/kind1.4.png");
		type.set ("assets/images/kind1.4.png", AssetType.IMAGE);
		path.set ("assets/images/kind1.5.png", "assets/images/kind1.5.png");
		type.set ("assets/images/kind1.5.png", AssetType.IMAGE);
		path.set ("assets/images/kind2.1.png", "assets/images/kind2.1.png");
		type.set ("assets/images/kind2.1.png", AssetType.IMAGE);
		path.set ("assets/images/kind2.2.png", "assets/images/kind2.2.png");
		type.set ("assets/images/kind2.2.png", AssetType.IMAGE);
		path.set ("assets/images/kind2.3.png", "assets/images/kind2.3.png");
		type.set ("assets/images/kind2.3.png", AssetType.IMAGE);
		path.set ("assets/images/kind2.4.png", "assets/images/kind2.4.png");
		type.set ("assets/images/kind2.4.png", AssetType.IMAGE);
		path.set ("assets/images/kind2.5.png", "assets/images/kind2.5.png");
		type.set ("assets/images/kind2.5.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.1.png", "assets/images/kind3.1.png");
		type.set ("assets/images/kind3.1.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.2.png", "assets/images/kind3.2.png");
		type.set ("assets/images/kind3.2.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.3.png", "assets/images/kind3.3.png");
		type.set ("assets/images/kind3.3.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.4.png", "assets/images/kind3.4.png");
		type.set ("assets/images/kind3.4.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.5.png", "assets/images/kind3.5.png");
		type.set ("assets/images/kind3.5.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.6.png", "assets/images/kind3.6.png");
		type.set ("assets/images/kind3.6.png", AssetType.IMAGE);
		path.set ("assets/images/kind3.7.png", "assets/images/kind3.7.png");
		type.set ("assets/images/kind3.7.png", AssetType.IMAGE);
		path.set ("assets/images/KJRW-Tutotial-3.png", "assets/images/KJRW-Tutotial-3.png");
		type.set ("assets/images/KJRW-Tutotial-3.png", AssetType.IMAGE);
		path.set ("assets/images/Knightmare Fight/Text1.png", "assets/images/Knightmare Fight/Text1.png");
		type.set ("assets/images/Knightmare Fight/Text1.png", AssetType.IMAGE);
		path.set ("assets/images/Knightmare.png", "assets/images/Knightmare.png");
		type.set ("assets/images/Knightmare.png", AssetType.IMAGE);
		path.set ("assets/images/KnightmareAttackTilesheet.png", "assets/images/KnightmareAttackTilesheet.png");
		type.set ("assets/images/KnightmareAttackTilesheet.png", AssetType.IMAGE);
		path.set ("assets/images/KnightmareCompleteTilesheet.png", "assets/images/KnightmareCompleteTilesheet.png");
		type.set ("assets/images/KnightmareCompleteTilesheet.png", AssetType.IMAGE);
		path.set ("assets/images/KnightmareDash.png", "assets/images/KnightmareDash.png");
		type.set ("assets/images/KnightmareDash.png", AssetType.IMAGE);
		path.set ("assets/images/KnightmareShield4.png", "assets/images/KnightmareShield4.png");
		type.set ("assets/images/KnightmareShield4.png", AssetType.IMAGE);
		path.set ("assets/images/KnightmareText.png", "assets/images/KnightmareText.png");
		type.set ("assets/images/KnightmareText.png", AssetType.IMAGE);
		path.set ("assets/images/KRJW-Tutorial.png", "assets/images/KRJW-Tutorial.png");
		type.set ("assets/images/KRJW-Tutorial.png", AssetType.IMAGE);
		path.set ("assets/images/KRJW-Tutorial.psd", "assets/images/KRJW-Tutorial.psd");
		type.set ("assets/images/KRJW-Tutorial.psd", AssetType.BINARY);
		path.set ("assets/images/Missie1/intromissie1/prof0.png", "assets/images/Missie1/intromissie1/prof0.png");
		type.set ("assets/images/Missie1/intromissie1/prof0.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof1.png", "assets/images/Missie1/intromissie1/prof1.png");
		type.set ("assets/images/Missie1/intromissie1/prof1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof2.png", "assets/images/Missie1/intromissie1/prof2.png");
		type.set ("assets/images/Missie1/intromissie1/prof2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof3.png", "assets/images/Missie1/intromissie1/prof3.png");
		type.set ("assets/images/Missie1/intromissie1/prof3.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof4.png", "assets/images/Missie1/intromissie1/prof4.png");
		type.set ("assets/images/Missie1/intromissie1/prof4.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof5.png", "assets/images/Missie1/intromissie1/prof5.png");
		type.set ("assets/images/Missie1/intromissie1/prof5.png", AssetType.IMAGE);
		path.set ("assets/images/Missie1/intromissie1/prof6.png", "assets/images/Missie1/intromissie1/prof6.png");
		type.set ("assets/images/Missie1/intromissie1/prof6.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.1.png", "assets/images/Missie2/emo1.1.png");
		type.set ("assets/images/Missie2/emo1.1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.10.png", "assets/images/Missie2/emo1.10.png");
		type.set ("assets/images/Missie2/emo1.10.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.11.png", "assets/images/Missie2/emo1.11.png");
		type.set ("assets/images/Missie2/emo1.11.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.2.png", "assets/images/Missie2/emo1.2.png");
		type.set ("assets/images/Missie2/emo1.2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.3.png", "assets/images/Missie2/emo1.3.png");
		type.set ("assets/images/Missie2/emo1.3.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.4.png", "assets/images/Missie2/emo1.4.png");
		type.set ("assets/images/Missie2/emo1.4.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.5.png", "assets/images/Missie2/emo1.5.png");
		type.set ("assets/images/Missie2/emo1.5.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.6.png", "assets/images/Missie2/emo1.6.png");
		type.set ("assets/images/Missie2/emo1.6.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.7.png", "assets/images/Missie2/emo1.7.png");
		type.set ("assets/images/Missie2/emo1.7.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.8.png", "assets/images/Missie2/emo1.8.png");
		type.set ("assets/images/Missie2/emo1.8.png", AssetType.IMAGE);
		path.set ("assets/images/Missie2/emo1.9.png", "assets/images/Missie2/emo1.9.png");
		type.set ("assets/images/Missie2/emo1.9.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Feggit1.png", "assets/images/Missie3/Feggit1.png");
		type.set ("assets/images/Missie3/Feggit1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Feggit2.png", "assets/images/Missie3/Feggit2.png");
		type.set ("assets/images/Missie3/Feggit2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Feggit3.png", "assets/images/Missie3/Feggit3.png");
		type.set ("assets/images/Missie3/Feggit3.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Feggit4.png", "assets/images/Missie3/Feggit4.png");
		type.set ("assets/images/Missie3/Feggit4.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Feggit5.png", "assets/images/Missie3/Feggit5.png");
		type.set ("assets/images/Missie3/Feggit5.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Judge1.png", "assets/images/Missie3/Judge1.png");
		type.set ("assets/images/Missie3/Judge1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Judge2.png", "assets/images/Missie3/Judge2.png");
		type.set ("assets/images/Missie3/Judge2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Mom1.png", "assets/images/Missie3/Mom1.png");
		type.set ("assets/images/Missie3/Mom1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Mom2.png", "assets/images/Missie3/Mom2.png");
		type.set ("assets/images/Missie3/Mom2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Mom3.png", "assets/images/Missie3/Mom3.png");
		type.set ("assets/images/Missie3/Mom3.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro1.png", "assets/images/Missie3/Pro1.png");
		type.set ("assets/images/Missie3/Pro1.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro2.png", "assets/images/Missie3/Pro2.png");
		type.set ("assets/images/Missie3/Pro2.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro3.png", "assets/images/Missie3/Pro3.png");
		type.set ("assets/images/Missie3/Pro3.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro4.png", "assets/images/Missie3/Pro4.png");
		type.set ("assets/images/Missie3/Pro4.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro5.png", "assets/images/Missie3/Pro5.png");
		type.set ("assets/images/Missie3/Pro5.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro6.png", "assets/images/Missie3/Pro6.png");
		type.set ("assets/images/Missie3/Pro6.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro7.png", "assets/images/Missie3/Pro7.png");
		type.set ("assets/images/Missie3/Pro7.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Pro8.png", "assets/images/Missie3/Pro8.png");
		type.set ("assets/images/Missie3/Pro8.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Prof9.png", "assets/images/Missie3/Prof9.png");
		type.set ("assets/images/Missie3/Prof9.png", AssetType.IMAGE);
		path.set ("assets/images/Missie3/Thumbs2.db", "assets/images/Missie3/Thumbs2.db");
		type.set ("assets/images/Missie3/Thumbs2.db", AssetType.BINARY);
		path.set ("assets/images/Mission1Girl.png", "assets/images/Mission1Girl.png");
		type.set ("assets/images/Mission1Girl.png", AssetType.IMAGE);
		path.set ("assets/images/Mission2Football.png", "assets/images/Mission2Football.png");
		type.set ("assets/images/Mission2Football.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3 Dodgeball.png", "assets/images/Mission3 Dodgeball.png");
		type.set ("assets/images/Mission3 Dodgeball.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3 Dodgeball.psd", "assets/images/Mission3 Dodgeball.psd");
		type.set ("assets/images/Mission3 Dodgeball.psd", AssetType.BINARY);
		path.set ("assets/images/Mission3-Mother.png", "assets/images/Mission3-Mother.png");
		type.set ("assets/images/Mission3-Mother.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid1.png", "assets/images/Mission3Kid1.png");
		type.set ("assets/images/Mission3Kid1.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid2.png", "assets/images/Mission3Kid2.png");
		type.set ("assets/images/Mission3Kid2.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid3.png", "assets/images/Mission3Kid3.png");
		type.set ("assets/images/Mission3Kid3.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid4.png", "assets/images/Mission3Kid4.png");
		type.set ("assets/images/Mission3Kid4.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid5.png", "assets/images/Mission3Kid5.png");
		type.set ("assets/images/Mission3Kid5.png", AssetType.IMAGE);
		path.set ("assets/images/Mission3Kid6.png", "assets/images/Mission3Kid6.png");
		type.set ("assets/images/Mission3Kid6.png", AssetType.IMAGE);
		path.set ("assets/images/Mom.png", "assets/images/Mom.png");
		type.set ("assets/images/Mom.png", AssetType.IMAGE);
		path.set ("assets/images/Mother-Mission-3.psd", "assets/images/Mother-Mission-3.psd");
		type.set ("assets/images/Mother-Mission-3.psd", AssetType.BINARY);
		path.set ("assets/images/NEWTilesheet_Complete.png", "assets/images/NEWTilesheet_Complete.png");
		type.set ("assets/images/NEWTilesheet_Complete.png", AssetType.IMAGE);
		path.set ("assets/images/NEW_Tilesheet_Complete.png", "assets/images/NEW_Tilesheet_Complete.png");
		type.set ("assets/images/NEW_Tilesheet_Complete.png", AssetType.IMAGE);
		path.set ("assets/images/NEW_Tilesheet_Complete.psd", "assets/images/NEW_Tilesheet_Complete.psd");
		type.set ("assets/images/NEW_Tilesheet_Complete.psd", AssetType.BINARY);
		path.set ("assets/images/NPCCharacterTilesheet.png", "assets/images/NPCCharacterTilesheet.png");
		type.set ("assets/images/NPCCharacterTilesheet.png", AssetType.IMAGE);
		path.set ("assets/images/pat.png", "assets/images/pat.png");
		type.set ("assets/images/pat.png", AssetType.IMAGE);
		path.set ("assets/images/player.png", "assets/images/player.png");
		type.set ("assets/images/player.png", AssetType.IMAGE);
		path.set ("assets/images/pointer.png", "assets/images/pointer.png");
		type.set ("assets/images/pointer.png", AssetType.IMAGE);
		path.set ("assets/images/Principle.png", "assets/images/Principle.png");
		type.set ("assets/images/Principle.png", AssetType.IMAGE);
		path.set ("assets/images/Principle.psd", "assets/images/Principle.psd");
		type.set ("assets/images/Principle.psd", AssetType.BINARY);
		path.set ("assets/images/resetbutton.png", "assets/images/resetbutton.png");
		type.set ("assets/images/resetbutton.png", AssetType.IMAGE);
		path.set ("assets/images/SChool modified.png", "assets/images/SChool modified.png");
		type.set ("assets/images/SChool modified.png", AssetType.IMAGE);
		path.set ("assets/images/Speechbubble.png", "assets/images/Speechbubble.png");
		type.set ("assets/images/Speechbubble.png", AssetType.IMAGE);
		path.set ("assets/images/Speechbubble.psd", "assets/images/Speechbubble.psd");
		type.set ("assets/images/Speechbubble.psd", AssetType.BINARY);
		path.set ("assets/images/Starting Screen.jpg", "assets/images/Starting Screen.jpg");
		type.set ("assets/images/Starting Screen.jpg", AssetType.IMAGE);
		path.set ("assets/images/Story/1.png", "assets/images/Story/1.png");
		type.set ("assets/images/Story/1.png", AssetType.IMAGE);
		path.set ("assets/images/Story/2.png", "assets/images/Story/2.png");
		type.set ("assets/images/Story/2.png", AssetType.IMAGE);
		path.set ("assets/images/Story/3.png", "assets/images/Story/3.png");
		type.set ("assets/images/Story/3.png", AssetType.IMAGE);
		path.set ("assets/images/Story/4.png", "assets/images/Story/4.png");
		type.set ("assets/images/Story/4.png", AssetType.IMAGE);
		path.set ("assets/images/Story/Introscreen.png", "assets/images/Story/Introscreen.png");
		type.set ("assets/images/Story/Introscreen.png", AssetType.IMAGE);
		path.set ("assets/images/Story/Pat.png", "assets/images/Story/Pat.png");
		type.set ("assets/images/Story/Pat.png", AssetType.IMAGE);
		path.set ("assets/images/Story/Prof.png", "assets/images/Story/Prof.png");
		type.set ("assets/images/Story/Prof.png", AssetType.IMAGE);
		path.set ("assets/images/Story/Tec.png", "assets/images/Story/Tec.png");
		type.set ("assets/images/Story/Tec.png", AssetType.IMAGE);
		path.set ("assets/images/street.PNG", "assets/images/street.PNG");
		type.set ("assets/images/street.PNG", AssetType.IMAGE);
		path.set ("assets/images/SWAG-Kid-Walk-Kopie.png", "assets/images/SWAG-Kid-Walk-Kopie.png");
		type.set ("assets/images/SWAG-Kid-Walk-Kopie.png", AssetType.IMAGE);
		path.set ("assets/images/Swagkid.png", "assets/images/Swagkid.png");
		type.set ("assets/images/Swagkid.png", AssetType.IMAGE);
		path.set ("assets/images/SwagKidMission1.png", "assets/images/SwagKidMission1.png");
		type.set ("assets/images/SwagKidMission1.png", AssetType.IMAGE);
		path.set ("assets/images/Teacher.png", "assets/images/Teacher.png");
		type.set ("assets/images/Teacher.png", AssetType.IMAGE);
		path.set ("assets/images/teacher1.png", "assets/images/teacher1.png");
		type.set ("assets/images/teacher1.png", AssetType.IMAGE);
		path.set ("assets/images/tec.png", "assets/images/tec.png");
		type.set ("assets/images/tec.png", AssetType.IMAGE);
		path.set ("assets/images/Thumbs3.db", "assets/images/Thumbs3.db");
		type.set ("assets/images/Thumbs3.db", AssetType.BINARY);
		path.set ("assets/images/tiles.png", "assets/images/tiles.png");
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		path.set ("assets/images/Tilesheet_Complete.png", "assets/images/Tilesheet_Complete.png");
		type.set ("assets/images/Tilesheet_Complete.png", AssetType.IMAGE);
		path.set ("assets/images/Tilesheet_Complete.psd", "assets/images/Tilesheet_Complete.psd");
		type.set ("assets/images/Tilesheet_Complete.psd", AssetType.BINARY);
		path.set ("assets/images/Wall.psd", "assets/images/Wall.psd");
		type.set ("assets/images/Wall.psd", AssetType.BINARY);
		path.set ("assets/images/WallKJRW.png", "assets/images/WallKJRW.png");
		type.set ("assets/images/WallKJRW.png", AssetType.IMAGE);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/music/select.wav", "assets/music/select.wav");
		type.set ("assets/music/select.wav", AssetType.SOUND);
		path.set ("assets/music/townMusic.wav", "assets/music/townMusic.wav");
		type.set ("assets/music/townMusic.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/dooropening.mp3", "assets/sounds/Abilities/dooropening.mp3");
		type.set ("assets/sounds/Abilities/dooropening.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Heal.mp3", "assets/sounds/Abilities/Heal.mp3");
		type.set ("assets/sounds/Abilities/Heal.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Heal1.mp3", "assets/sounds/Abilities/Heal1.mp3");
		type.set ("assets/sounds/Abilities/Heal1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatIndoor.mp3", "assets/sounds/Abilities/PatIndoor.mp3");
		type.set ("assets/sounds/Abilities/PatIndoor.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatIndoor2.mp3", "assets/sounds/Abilities/PatIndoor2.mp3");
		type.set ("assets/sounds/Abilities/PatIndoor2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatKnigthmare.mp3", "assets/sounds/Abilities/PatKnigthmare.mp3");
		type.set ("assets/sounds/Abilities/PatKnigthmare.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatKnigthmare1.mp3", "assets/sounds/Abilities/PatKnigthmare1.mp3");
		type.set ("assets/sounds/Abilities/PatKnigthmare1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatOutdoor.mp3", "assets/sounds/Abilities/PatOutdoor.mp3");
		type.set ("assets/sounds/Abilities/PatOutdoor.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/PatOutdoor1.mp3", "assets/sounds/Abilities/PatOutdoor1.mp3");
		type.set ("assets/sounds/Abilities/PatOutdoor1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Shield.mp3", "assets/sounds/Abilities/Shield.mp3");
		type.set ("assets/sounds/Abilities/Shield.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Shield1.mp3", "assets/sounds/Abilities/Shield1.mp3");
		type.set ("assets/sounds/Abilities/Shield1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Source/1.mp3", "assets/sounds/Abilities/Source/1.mp3");
		type.set ("assets/sounds/Abilities/Source/1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Source/2.mp3", "assets/sounds/Abilities/Source/2.mp3");
		type.set ("assets/sounds/Abilities/Source/2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Source/3.mp3", "assets/sounds/Abilities/Source/3.mp3");
		type.set ("assets/sounds/Abilities/Source/3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Abilities/Source/Heal.wav", "assets/sounds/Abilities/Source/Heal.wav");
		type.set ("assets/sounds/Abilities/Source/Heal.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Heal1.wav", "assets/sounds/Abilities/Source/Heal1.wav");
		type.set ("assets/sounds/Abilities/Source/Heal1.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Hit_Hurt18.wav", "assets/sounds/Abilities/Source/Hit_Hurt18.wav");
		type.set ("assets/sounds/Abilities/Source/Hit_Hurt18.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Hit_Hurt32.wav", "assets/sounds/Abilities/Source/Hit_Hurt32.wav");
		type.set ("assets/sounds/Abilities/Source/Hit_Hurt32.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav", "assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav");
		type.set ("assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Push.wav", "assets/sounds/Abilities/Source/Push.wav");
		type.set ("assets/sounds/Abilities/Source/Push.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Push1.wav", "assets/sounds/Abilities/Source/Push1.wav");
		type.set ("assets/sounds/Abilities/Source/Push1.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/Source/Shield1.wav", "assets/sounds/Abilities/Source/Shield1.wav");
		type.set ("assets/sounds/Abilities/Source/Shield1.wav", AssetType.SOUND);
		path.set ("assets/sounds/Abilities/switch.mp3", "assets/sounds/Abilities/switch.mp3");
		type.set ("assets/sounds/Abilities/switch.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Game/JUDGE-O-METERCOIN.mp3", "assets/sounds/Game/JUDGE-O-METERCOIN.mp3");
		type.set ("assets/sounds/Game/JUDGE-O-METERCOIN.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Game/select-1.wav", "assets/sounds/Game/select-1.wav");
		type.set ("assets/sounds/Game/select-1.wav", AssetType.SOUND);
		path.set ("assets/sounds/Gesprek1.wav", "assets/sounds/Gesprek1.wav");
		type.set ("assets/sounds/Gesprek1.wav", AssetType.SOUND);
		path.set ("assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3", "assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3");
		type.set ("assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/2GoedGedaan.mp3", "assets/sounds/IntroMissie/2GoedGedaan.mp3");
		type.set ("assets/sounds/IntroMissie/2GoedGedaan.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/3PatInstructie.mp3", "assets/sounds/IntroMissie/3PatInstructie.mp3");
		type.set ("assets/sounds/IntroMissie/3PatInstructie.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/4TecInstructie1.mp3", "assets/sounds/IntroMissie/4TecInstructie1.mp3");
		type.set ("assets/sounds/IntroMissie/4TecInstructie1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/5TecInstructie2.mp3", "assets/sounds/IntroMissie/5TecInstructie2.mp3");
		type.set ("assets/sounds/IntroMissie/5TecInstructie2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/6ProfInstructie.mp3", "assets/sounds/IntroMissie/6ProfInstructie.mp3");
		type.set ("assets/sounds/IntroMissie/6ProfInstructie.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroMissie/7IntroOutro.mp3", "assets/sounds/IntroMissie/7IntroOutro.mp3");
		type.set ("assets/sounds/IntroMissie/7IntroOutro.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/IntroVoice.mp3", "assets/sounds/IntroVoice.mp3");
		type.set ("assets/sounds/IntroVoice.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare1.mp3", "assets/sounds/Knightmare/Knightmare1.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare2.mp3", "assets/sounds/Knightmare/Knightmare2.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare3.mp3", "assets/sounds/Knightmare/Knightmare3.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare4.mp3", "assets/sounds/Knightmare/Knightmare4.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare5.mp3", "assets/sounds/Knightmare/Knightmare5.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare5.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare6.mp3", "assets/sounds/Knightmare/Knightmare6.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare6.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare7.mp3", "assets/sounds/Knightmare/Knightmare7.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare7.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Knightmare/Knightmare8.mp3", "assets/sounds/Knightmare/Knightmare8.mp3");
		type.set ("assets/sounds/Knightmare/Knightmare8.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind1/Kind1-1.mp3", "assets/sounds/Missie1/Kind1/Kind1-1.mp3");
		type.set ("assets/sounds/Missie1/Kind1/Kind1-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind1/Kind1-2.mp3", "assets/sounds/Missie1/Kind1/Kind1-2.mp3");
		type.set ("assets/sounds/Missie1/Kind1/Kind1-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", "assets/sounds/Missie1/Kind1/Prof1-4.mp3");
		type.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", "assets/sounds/Missie1/Kind1/Prof2-4.mp3");
		type.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", "assets/sounds/Missie1/Kind1/Prof3-4.mp3");
		type.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", "assets/sounds/Missie1/Kind2/Prof1-1.mp3");
		type.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", "assets/sounds/Missie1/Kind2/Prof2-1.mp3");
		type.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", "assets/sounds/Missie1/Kind2/Prof3-1.mp3");
		type.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Kind3-1.mp3", "assets/sounds/Missie1/Kind3/Kind3-1.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Kind3-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Kind3-2.mp3", "assets/sounds/Missie1/Kind3/Kind3-2.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Kind3-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Kind3-3.mp3", "assets/sounds/Missie1/Kind3/Kind3-3.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Kind3-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Prof1-2.mp3", "assets/sounds/Missie1/Kind3/Prof1-2.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Prof1-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Prof2-2.mp3", "assets/sounds/Missie1/Kind3/Prof2-2.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Prof2-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Prof3-2.mp3", "assets/sounds/Missie1/Kind3/Prof3-2.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Prof3-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Kind3/Prof4-2.mp3", "assets/sounds/Missie1/Kind3/Prof4-2.mp3");
		type.set ("assets/sounds/Missie1/Kind3/Prof4-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Prof4-3.mp3", "assets/sounds/Missie1/Prof4-3.mp3");
		type.set ("assets/sounds/Missie1/Prof4-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Prof1-3.mp3", "assets/sounds/Missie1/Teacher/Prof1-3.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Prof1-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Prof2-3.mp3", "assets/sounds/Missie1/Teacher/Prof2-3.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Prof2-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Prof3-3.mp3", "assets/sounds/Missie1/Teacher/Prof3-3.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Prof3-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Teacher1-1.mp3", "assets/sounds/Missie1/Teacher/Teacher1-1.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Teacher1-2.mp3", "assets/sounds/Missie1/Teacher/Teacher1-2.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", "assets/sounds/Missie1/Teacher/Teacher1-3.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Teacher1-4.mp3", "assets/sounds/Missie1/Teacher/Teacher1-4.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie1/Teacher/Teacher1.mp3", "assets/sounds/Missie1/Teacher/Teacher1.mp3");
		type.set ("assets/sounds/Missie1/Teacher/Teacher1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Dad1.mp3", "assets/sounds/Missie2/Dad1.mp3");
		type.set ("assets/sounds/Missie2/Dad1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Dad2.mp3", "assets/sounds/Missie2/Dad2.mp3");
		type.set ("assets/sounds/Missie2/Dad2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Dad3.mp3", "assets/sounds/Missie2/Dad3.mp3");
		type.set ("assets/sounds/Missie2/Dad3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Kid1.mp3", "assets/sounds/Missie2/Kid1.mp3");
		type.set ("assets/sounds/Missie2/Kid1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Kid2.mp3", "assets/sounds/Missie2/Kid2.mp3");
		type.set ("assets/sounds/Missie2/Kid2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Kid3.mp3", "assets/sounds/Missie2/Kid3.mp3");
		type.set ("assets/sounds/Missie2/Kid3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Prof1.mp3", "assets/sounds/Missie2/Prof1.mp3");
		type.set ("assets/sounds/Missie2/Prof1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Prof2.mp3", "assets/sounds/Missie2/Prof2.mp3");
		type.set ("assets/sounds/Missie2/Prof2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Prof3.mp3", "assets/sounds/Missie2/Prof3.mp3");
		type.set ("assets/sounds/Missie2/Prof3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Prof4.mp3", "assets/sounds/Missie2/Prof4.mp3");
		type.set ("assets/sounds/Missie2/Prof4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie2/Prof5.mp3", "assets/sounds/Missie2/Prof5.mp3");
		type.set ("assets/sounds/Missie2/Prof5.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-1.mp3", "assets/sounds/Missie3/Missie3-1.mp3");
		type.set ("assets/sounds/Missie3/Missie3-1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-10.mp3", "assets/sounds/Missie3/Missie3-10.mp3");
		type.set ("assets/sounds/Missie3/Missie3-10.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-12.mp3", "assets/sounds/Missie3/Missie3-12.mp3");
		type.set ("assets/sounds/Missie3/Missie3-12.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-14.mp3", "assets/sounds/Missie3/Missie3-14.mp3");
		type.set ("assets/sounds/Missie3/Missie3-14.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-15.mp3", "assets/sounds/Missie3/Missie3-15.mp3");
		type.set ("assets/sounds/Missie3/Missie3-15.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-2.mp3", "assets/sounds/Missie3/Missie3-2.mp3");
		type.set ("assets/sounds/Missie3/Missie3-2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-3.mp3", "assets/sounds/Missie3/Missie3-3.mp3");
		type.set ("assets/sounds/Missie3/Missie3-3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-4.mp3", "assets/sounds/Missie3/Missie3-4.mp3");
		type.set ("assets/sounds/Missie3/Missie3-4.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-5.mp3", "assets/sounds/Missie3/Missie3-5.mp3");
		type.set ("assets/sounds/Missie3/Missie3-5.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-6.mp3", "assets/sounds/Missie3/Missie3-6.mp3");
		type.set ("assets/sounds/Missie3/Missie3-6.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-7.mp3", "assets/sounds/Missie3/Missie3-7.mp3");
		type.set ("assets/sounds/Missie3/Missie3-7.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Missie3/Missie3-8.mp3", "assets/sounds/Missie3/Missie3-8.mp3");
		type.set ("assets/sounds/Missie3/Missie3-8.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Music/Chase.mp3", "assets/sounds/Music/Chase.mp3");
		type.set ("assets/sounds/Music/Chase.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Music/Haahn's Dutch.wav", "assets/sounds/Music/Haahn's Dutch.wav");
		type.set ("assets/sounds/Music/Haahn's Dutch.wav", AssetType.SOUND);
		path.set ("assets/sounds/Music/Lab Junk.wav", "assets/sounds/Music/Lab Junk.wav");
		type.set ("assets/sounds/Music/Lab Junk.wav", AssetType.SOUND);
		path.set ("assets/sounds/Music/Puzzle.mp3", "assets/sounds/Music/Puzzle.mp3");
		type.set ("assets/sounds/Music/Puzzle.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/Music/Townsong.mp3", "assets/sounds/Music/Townsong.mp3");
		type.set ("assets/sounds/Music/Townsong.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/Tjalle/Back.png", "assets/sounds/Tjalle/Back.png");
		type.set ("assets/sounds/Tjalle/Back.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/Grass Flower 64x64.png", "assets/sounds/Tjalle/Grass Flower 64x64.png");
		type.set ("assets/sounds/Tjalle/Grass Flower 64x64.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/NewRoadTiles.png", "assets/sounds/Tjalle/NewRoadTiles.png");
		type.set ("assets/sounds/Tjalle/NewRoadTiles.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/Police.png", "assets/sounds/Tjalle/Police.png");
		type.set ("assets/sounds/Tjalle/Police.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/Schooltile.png", "assets/sounds/Tjalle/Schooltile.png");
		type.set ("assets/sounds/Tjalle/Schooltile.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/Trashcan.png", "assets/sounds/Tjalle/Trashcan.png");
		type.set ("assets/sounds/Tjalle/Trashcan.png", AssetType.IMAGE);
		path.set ("assets/sounds/Tjalle/Water.png", "assets/sounds/Tjalle/Water.png");
		type.set ("assets/sounds/Tjalle/Water.png", AssetType.IMAGE);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/BaseMap.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/basemap1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/basemap2.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/worldmap1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/worldmap2.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/kid_dad-testing.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/level_1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/level_2.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/level_3.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/level_4.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/Mission1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/Mission1_0.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/Mission1_1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/reachtshelden.oep";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/room-001.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/testingmap.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/female/kind2-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/female/kind2-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/female/moeder1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/female/moeder2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/images/1StartingScreeeeeeen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/AngryDadMission2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/AsianDad.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/AsianDad.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Attack128x64.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Bald-Mission1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Bald-Mission1.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/BaldMission1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Banner.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/BeachBall-Mission3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bigass HOUSE.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/button.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CharacterTilesheet768x768.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/coin.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CollectingSpirit Kopie.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/DodgeBall-Mission-3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Emo-Kid-Mission2 (1).png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Emo-Kid-Mission3).png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/EmoKidMission2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/emokidMission3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/feggit.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/floor.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Football-Mission-3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Furniture.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Girl-Mission1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/girlMission1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HATSNewRoadTiles.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HATSNewRoadTiles.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/health.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HOLE.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HOUSE.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/ion.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Judge-Mission-3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Judge.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind1.1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind1.2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind1.3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind1.4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind1.5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind2.1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind2.2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind2.3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind2.4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind2.5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/kind3.7.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KJRW-Tutotial-3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Knightmare Fight/Text1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Knightmare.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareAttackTilesheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareCompleteTilesheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareDash.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareShield4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareText.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KRJW-Tutorial.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KRJW-Tutorial.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Missie1/intromissie1/prof0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie1/intromissie1/prof6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.10.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.11.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.7.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.8.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie2/emo1.9.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Feggit1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Feggit2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Feggit3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Feggit4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Feggit5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Judge1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Judge2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Mom1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Mom2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Mom3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro7.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Pro8.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Prof9.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missie3/Thumbs2.db";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Mission1Girl.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission2Football.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3 Dodgeball.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3 Dodgeball.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Mission3-Mother.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Kid6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mom.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mother-Mission-3.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/NEWTilesheet_Complete.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NEW_Tilesheet_Complete.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NEW_Tilesheet_Complete.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/NPCCharacterTilesheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pat.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/player.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pointer.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Principle.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Principle.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/resetbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SChool modified.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Speechbubble.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Speechbubble.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Starting Screen.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/Introscreen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/Pat.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/Prof.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/Tec.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/street.PNG";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SWAG-Kid-Walk-Kopie.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Swagkid.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SwagKidMission1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Teacher.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/teacher1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tec.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Thumbs3.db";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/tiles.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tilesheet_Complete.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tilesheet_Complete.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/Wall.psd";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/WallKJRW.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/select.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/music/townMusic.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/dooropening.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Heal.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Heal1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatIndoor.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatIndoor2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatKnigthmare.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatKnigthmare1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatOutdoor.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/PatOutdoor1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Shield.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Shield1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Source/1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Source/2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Source/3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Abilities/Source/Heal.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Heal1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Hit_Hurt18.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Hit_Hurt32.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Push.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Push1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/Source/Shield1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Abilities/switch.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Game/JUDGE-O-METERCOIN.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Game/select-1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Gesprek1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/2GoedGedaan.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/3PatInstructie.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/4TecInstructie1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/5TecInstructie2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/6ProfInstructie.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/7IntroOutro.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroVoice.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare5.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare6.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare7.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare8.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind1/Kind1-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind1/Kind1-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind1/Prof1-4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind1/Prof2-4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind1/Prof3-4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind2/Prof1-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind2/Prof2-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind2/Prof3-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Kind3-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Kind3-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Kind3-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Prof1-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Prof2-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Prof3-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind3/Prof4-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Prof4-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Prof1-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Prof2-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Prof3-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Teacher1-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Teacher1-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Teacher1-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Teacher1-4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Teacher/Teacher1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Dad1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Dad2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Dad3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Kid1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Kid2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Kid3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Prof1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Prof2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Prof3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Prof4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie2/Prof5.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-10.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-12.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-14.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-15.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-4.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-5.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-6.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-7.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-8.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Chase.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Haahn's Dutch.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Music/Lab Junk.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Music/Puzzle.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Townsong.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Tjalle/Back.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/Grass Flower 64x64.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/NewRoadTiles.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/Police.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/Schooltile.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/Trashcan.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Tjalle/Water.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash


























































































































































































































































































#elseif html5


























































































































































































































































































#else



#if (windows || mac || linux)





#end

#if openfl

#end

#end
#end


#end