#if !macro


@:access(lime.Assets)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new lime.app.Application ();
		app.create (config);
		openfl.Lib.application = app;
		
		#if !flash
		var stage = new openfl.display.Stage (app.window.width, app.window.height, config.background);
		stage.addChild (openfl.Lib.current);
		app.addModule (stage);
		#end
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/BaseMap.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/basemap1.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/basemap2.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Final Maps/traininglevel1.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Final Maps/traininglevel2.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Final Maps/traininglevel3.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Final Maps/worldmap1.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Final Maps/worldmap2.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Final Maps/worldmap3.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Final Maps/worldmap4.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Final Maps/worldmap5.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Final Maps/worldmap6.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/kid_dad-testing.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/level_1.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/level_2.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/level_3.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/level_4.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Mission1.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Mission1_0.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Mission1_1.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/reachtshelden.oep");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/room-001.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/testingmap.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/AngryDadMission2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/AsianDad.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/AsianDad.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/Attack128x64.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Bald-Mission1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Bald-Mission1.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/BaldMission1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Banner.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/BeachBall-Mission3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/bigass HOUSE.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/button.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/CharacterTilesheet768x768.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/coin.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/CollectingSpirit Kopie.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/DodgeBall-Mission-3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Emo-Kid-Mission2 (1).png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Emo-Kid-Mission3).png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/EmoKidMission2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/emokidMission3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemy-0.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemy-1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemy-2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/feggit.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/floor.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Football-Mission-3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Furniture.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Girl-Mission1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/girlMission1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/HATSNewRoadTiles.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/HATSNewRoadTiles.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/health.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/HOLE.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/HOUSE.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/Hp Bars/Bars.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/Hp Bars/Hero0.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Hero1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Hero2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Hero3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare0.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare10.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare7.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare8.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hp Bars/Knightmare9.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/ion.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/ion2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Judge-Mission-3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Judge.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind1.1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind1.2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind1.3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind1.4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind1.5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind2.1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind2.2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind2.3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind2.4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind2.5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind3.1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind3.2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind3.3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind3.4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind3.5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind3.6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/kind3.7.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/KJRW-Tutotial-3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Knightmare Fight/Text1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Knightmare Fight/Text2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Knightmare Fight/Text3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Knightmare Fight/Text4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Knightmare Fight/Text5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Knightmare Fight/Text6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Knightmare Fight/Text7.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Knightmare.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/KnightmareAttackTilesheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/KnightmareCompleteTilesheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/KnightmareDash.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/KnightmareShield4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/KnightmareText.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Knightmare_Tilesheet_Complete.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/KRJW-Tutorial.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/KRJW-Tutorial.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/Missie1/intromissie1/prof0.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie1/intromissie1/prof1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie1/intromissie1/prof2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie1/intromissie1/prof3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie1/intromissie1/prof4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie1/intromissie1/prof5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie1/intromissie1/prof6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.10.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.11.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.7.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.8.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie2/emo1.9.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Feggit1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Feggit2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Feggit3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Feggit4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Feggit5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Judge1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Judge2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Mom1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Mom2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Mom3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Pro1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Pro2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Pro3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Pro4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Pro5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Pro6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Pro7.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Pro8.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Prof9.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Missie3/Thumbs2.db");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/Mission1Girl.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mission2Football.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mission3 Dodgeball.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mission3 Dodgeball.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/Mission3-Mother.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mission3Kid1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mission3Kid2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mission3Kid3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mission3Kid4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mission3Kid5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mission3Kid6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mom.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Mother-Mission-3.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/NEWTilesheet_Complete.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/NEW_Tilesheet_Complete.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/NEW_Tilesheet_Complete.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/NPCCharacterTilesheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pat.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/player.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pointer.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Principle.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Principle.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/resetbutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/SChool modified.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Speechbubble.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Speechbubble.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/Starting Screen.jpg");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Story/1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Story/1StartingScreeeeeeen.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Story/2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Story/3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Story/4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Story/Introscreen.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Story/Pat.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Story/Prof.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Story/Tec.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/street.PNG");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/SWAG-Kid-Walk-Kopie.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Swagkid.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/SwagKidMission1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Teacher.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/teacher1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tec.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Thumbs3.db");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/tiles.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Tilesheet_Complete.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Tilesheet_Complete.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/Tilesheet_Complete2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Wall.psd");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/WallKJRW.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/music/select.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/music/townMusic.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/Playtest.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/Abilities/dooropening.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/Heal.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/Heal1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/PatIndoor.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/PatIndoor2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/PatKnigthmare.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/PatKnigthmare1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/PatOutdoor.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/PatOutdoor1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/Shield.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/Shield1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/Source/1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/Source/2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/Source/3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Abilities/Source/Heal.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Abilities/Source/Heal1.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Abilities/Source/Hit_Hurt18.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Abilities/Source/Hit_Hurt32.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Abilities/Source/Push.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Abilities/Source/Push1.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Abilities/Source/Shield1.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Abilities/switch.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Game/JUDGE-O-METERCOIN.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Game/select-1.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Gesprek1.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/IntroMissie/2GoedGedaan.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/IntroMissie/3PatInstructie.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/IntroMissie/4TecInstructie1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/IntroMissie/5TecInstructie2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/IntroMissie/6ProfInstructie.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/IntroMissie/7IntroOutro.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/IntroVoice.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Knightmare/Knightmare1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Knightmare/Knightmare2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Knightmare/Knightmare3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Knightmare/Knightmare4.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Knightmare/Knightmare5.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Knightmare/Knightmare6.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Knightmare/Knightmare7.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Knightmare/Knightmare8.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind1/Kind1-1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind1/Kind1-2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind1/Prof1-4.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind1/Prof2-4.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind1/Prof3-4.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind2/Kind2-1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind2/Kind2-2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind2/Prof1-1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind2/Prof2-1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind2/Prof3-1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind3/Kind3-1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind3/Kind3-2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind3/Kind3-3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind3/Prof1-2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind3/Prof2-2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind3/Prof3-2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Kind3/Prof4-2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Prof4-3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Teacher/Prof1-3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Teacher/Prof2-3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Teacher/Prof3-3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Teacher/Teacher1-1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Teacher/Teacher1-2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Teacher/Teacher1-3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Teacher/Teacher1-4.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie1/Teacher/Teacher1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Dad1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Dad2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Dad3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Kid1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Kid2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Kid3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Prof1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Prof2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Prof3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Prof4.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie2/Prof5.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-10.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/missie3-11.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-12.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/missie3-13.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-14.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-15.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-3.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-4.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-5.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-6.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-7.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Missie3/Missie3-8.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Music/Chase.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Music/Haahn's Dutch.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Music/Lab Junk.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Music/Puzzle.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Music/Townsong.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/Tjalle/Back.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/sounds/Tjalle/Grass Flower 64x64.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/sounds/Tjalle/NewRoadTiles.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/sounds/Tjalle/Police.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/sounds/Tjalle/Schooltile.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/sounds/Tjalle/Trashcan.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/sounds/Tjalle/Water.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (0),
			borderless: false,
			company: "HaxeFlixel",
			depthBuffer: false,
			file: "RechtsHelden",
			fps: Std.int (60),
			fullscreen: false,
			hardware: true,
			height: Std.int (480),
			orientation: "portrait",
			packageName: "com.example.myapp",
			resizable: true,
			stencilBuffer: true,
			title: "RechtsHelden",
			version: "0.0.1",
			vsync: true,
			width: Std.int (640),
			
		}
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 640, 480, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
