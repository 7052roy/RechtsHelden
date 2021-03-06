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
		
		className.set ("assets/data/Final Maps/NightmareMap.oel", __ASSET__assets_data_final_maps_nightmaremap_oel);
		type.set ("assets/data/Final Maps/NightmareMap.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/puzzle1.oel", __ASSET__assets_data_final_maps_puzzle1_oel);
		type.set ("assets/data/Final Maps/puzzle1.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/puzzle2-1-1.oel", __ASSET__assets_data_final_maps_puzzle2_1_1_oel);
		type.set ("assets/data/Final Maps/puzzle2-1-1.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/puzzle2-1.oel", __ASSET__assets_data_final_maps_puzzle2_1_oel);
		type.set ("assets/data/Final Maps/puzzle2-1.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/puzzle2-2.oel", __ASSET__assets_data_final_maps_puzzle2_2_oel);
		type.set ("assets/data/Final Maps/puzzle2-2.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/puzzle2-3.oel", __ASSET__assets_data_final_maps_puzzle2_3_oel);
		type.set ("assets/data/Final Maps/puzzle2-3.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/puzzle3.oel", __ASSET__assets_data_final_maps_puzzle3_oel);
		type.set ("assets/data/Final Maps/puzzle3.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/traininglevel1.oel", __ASSET__assets_data_final_maps_traininglevel1_oel);
		type.set ("assets/data/Final Maps/traininglevel1.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/traininglevel2.oel", __ASSET__assets_data_final_maps_traininglevel2_oel);
		type.set ("assets/data/Final Maps/traininglevel2.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/traininglevel3.oel", __ASSET__assets_data_final_maps_traininglevel3_oel);
		type.set ("assets/data/Final Maps/traininglevel3.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/worldmap1.oel", __ASSET__assets_data_final_maps_worldmap1_oel);
		type.set ("assets/data/Final Maps/worldmap1.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/worldmap2.oel", __ASSET__assets_data_final_maps_worldmap2_oel);
		type.set ("assets/data/Final Maps/worldmap2.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/worldmap3.oel", __ASSET__assets_data_final_maps_worldmap3_oel);
		type.set ("assets/data/Final Maps/worldmap3.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/worldmap4.oel", __ASSET__assets_data_final_maps_worldmap4_oel);
		type.set ("assets/data/Final Maps/worldmap4.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/worldmap5.oel", __ASSET__assets_data_final_maps_worldmap5_oel);
		type.set ("assets/data/Final Maps/worldmap5.oel", AssetType.TEXT);
		className.set ("assets/data/Final Maps/worldmap6.oel", __ASSET__assets_data_final_maps_worldmap6_oel);
		type.set ("assets/data/Final Maps/worldmap6.oel", AssetType.TEXT);
		className.set ("assets/data/reachtshelden.oep", __ASSET__assets_data_reachtshelden_oep);
		type.set ("assets/data/reachtshelden.oep", AssetType.TEXT);
		className.set ("assets/images/AngryDadMission2.png", __ASSET__assets_images_angrydadmission2_png);
		type.set ("assets/images/AngryDadMission2.png", AssetType.IMAGE);
		className.set ("assets/images/AttackCircle128x64.png", __ASSET__assets_images_attackcircle128x64_png);
		type.set ("assets/images/AttackCircle128x64.png", AssetType.IMAGE);
		className.set ("assets/images/Bald-Mission1.png", __ASSET__assets_images_bald_mission1_png);
		type.set ("assets/images/Bald-Mission1.png", AssetType.IMAGE);
		className.set ("assets/images/BaldMission1.png", __ASSET__assets_images_baldmission1_png);
		type.set ("assets/images/BaldMission1.png", AssetType.IMAGE);
		className.set ("assets/images/BeachBall-Mission3.png", __ASSET__assets_images_beachball_mission3_png);
		type.set ("assets/images/BeachBall-Mission3.png", AssetType.IMAGE);
		className.set ("assets/images/CharacterTilesheet768x768.png", __ASSET__assets_images_charactertilesheet768x768_png);
		type.set ("assets/images/CharacterTilesheet768x768.png", AssetType.IMAGE);
		className.set ("assets/images/DodgeBall-Mission-3.png", __ASSET__assets_images_dodgeball_mission_3_png);
		type.set ("assets/images/DodgeBall-Mission-3.png", AssetType.IMAGE);
		className.set ("assets/images/Emo-Kid-Mission2 (1).png", __ASSET__assets_images_emo_kid_mission2__1__png);
		type.set ("assets/images/Emo-Kid-Mission2 (1).png", AssetType.IMAGE);
		className.set ("assets/images/Emo-Kid-Mission3).png", __ASSET__assets_images_emo_kid_mission3__png);
		type.set ("assets/images/Emo-Kid-Mission3).png", AssetType.IMAGE);
		className.set ("assets/images/Football-Mission-3.png", __ASSET__assets_images_football_mission_3_png);
		type.set ("assets/images/Football-Mission-3.png", AssetType.IMAGE);
		className.set ("assets/images/Furniture.png", __ASSET__assets_images_furniture_png);
		type.set ("assets/images/Furniture.png", AssetType.IMAGE);
		className.set ("assets/images/Girl-Mission1.png", __ASSET__assets_images_girl_mission1_png);
		type.set ("assets/images/Girl-Mission1.png", AssetType.IMAGE);
		className.set ("assets/images/girlMission1.png", __ASSET__assets_images_girlmission1_png);
		type.set ("assets/images/girlMission1.png", AssetType.IMAGE);
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		className.set ("assets/images/ion.png", __ASSET__assets_images_ion_png);
		type.set ("assets/images/ion.png", AssetType.IMAGE);
		className.set ("assets/images/ion2.png", __ASSET__assets_images_ion2_png);
		type.set ("assets/images/ion2.png", AssetType.IMAGE);
		className.set ("assets/images/Judge-Mission-3.png", __ASSET__assets_images_judge_mission_3_png);
		type.set ("assets/images/Judge-Mission-3.png", AssetType.IMAGE);
		className.set ("assets/images/kind1.1.png", __ASSET__assets_images_kind1_1_png);
		type.set ("assets/images/kind1.1.png", AssetType.IMAGE);
		className.set ("assets/images/kind1.2.png", __ASSET__assets_images_kind1_2_png);
		type.set ("assets/images/kind1.2.png", AssetType.IMAGE);
		className.set ("assets/images/kind1.3.png", __ASSET__assets_images_kind1_3_png);
		type.set ("assets/images/kind1.3.png", AssetType.IMAGE);
		className.set ("assets/images/kind1.4.png", __ASSET__assets_images_kind1_4_png);
		type.set ("assets/images/kind1.4.png", AssetType.IMAGE);
		className.set ("assets/images/kind1.5.png", __ASSET__assets_images_kind1_5_png);
		type.set ("assets/images/kind1.5.png", AssetType.IMAGE);
		className.set ("assets/images/kind2.1.png", __ASSET__assets_images_kind2_1_png);
		type.set ("assets/images/kind2.1.png", AssetType.IMAGE);
		className.set ("assets/images/kind2.2.png", __ASSET__assets_images_kind2_2_png);
		type.set ("assets/images/kind2.2.png", AssetType.IMAGE);
		className.set ("assets/images/kind2.3.png", __ASSET__assets_images_kind2_3_png);
		type.set ("assets/images/kind2.3.png", AssetType.IMAGE);
		className.set ("assets/images/kind2.4.png", __ASSET__assets_images_kind2_4_png);
		type.set ("assets/images/kind2.4.png", AssetType.IMAGE);
		className.set ("assets/images/kind2.5.png", __ASSET__assets_images_kind2_5_png);
		type.set ("assets/images/kind2.5.png", AssetType.IMAGE);
		className.set ("assets/images/kind3.1.png", __ASSET__assets_images_kind3_1_png);
		type.set ("assets/images/kind3.1.png", AssetType.IMAGE);
		className.set ("assets/images/kind3.2.png", __ASSET__assets_images_kind3_2_png);
		type.set ("assets/images/kind3.2.png", AssetType.IMAGE);
		className.set ("assets/images/kind3.3.png", __ASSET__assets_images_kind3_3_png);
		type.set ("assets/images/kind3.3.png", AssetType.IMAGE);
		className.set ("assets/images/kind3.4.png", __ASSET__assets_images_kind3_4_png);
		type.set ("assets/images/kind3.4.png", AssetType.IMAGE);
		className.set ("assets/images/kind3.5.png", __ASSET__assets_images_kind3_5_png);
		type.set ("assets/images/kind3.5.png", AssetType.IMAGE);
		className.set ("assets/images/kind3.6.png", __ASSET__assets_images_kind3_6_png);
		type.set ("assets/images/kind3.6.png", AssetType.IMAGE);
		className.set ("assets/images/kind3.7.png", __ASSET__assets_images_kind3_7_png);
		type.set ("assets/images/kind3.7.png", AssetType.IMAGE);
		className.set ("assets/images/KJRW-Tutotial-3.png", __ASSET__assets_images_kjrw_tutotial_3_png);
		type.set ("assets/images/KJRW-Tutotial-3.png", AssetType.IMAGE);
		className.set ("assets/images/Knightmare Fight/Text1.png", __ASSET__assets_images_knightmare_fight_text1_png);
		type.set ("assets/images/Knightmare Fight/Text1.png", AssetType.IMAGE);
		className.set ("assets/images/Knightmare Fight/Text2.png", __ASSET__assets_images_knightmare_fight_text2_png);
		type.set ("assets/images/Knightmare Fight/Text2.png", AssetType.IMAGE);
		className.set ("assets/images/KnightmareCompleteTilesheet.png", __ASSET__assets_images_knightmarecompletetilesheet_png);
		type.set ("assets/images/KnightmareCompleteTilesheet.png", AssetType.IMAGE);
		className.set ("assets/images/Knightmare_Tilesheet_Complete.png", __ASSET__assets_images_knightmare_tilesheet_complete_png);
		type.set ("assets/images/Knightmare_Tilesheet_Complete.png", AssetType.IMAGE);
		className.set ("assets/images/KRJW-Tutorial.png", __ASSET__assets_images_krjw_tutorial_png);
		type.set ("assets/images/KRJW-Tutorial.png", AssetType.IMAGE);
		className.set ("assets/images/Missie1/intromissie1/prof0.png", __ASSET__assets_images_missie1_intromissie1_prof0_png);
		type.set ("assets/images/Missie1/intromissie1/prof0.png", AssetType.IMAGE);
		className.set ("assets/images/Missie1/intromissie1/prof1.png", __ASSET__assets_images_missie1_intromissie1_prof1_png);
		type.set ("assets/images/Missie1/intromissie1/prof1.png", AssetType.IMAGE);
		className.set ("assets/images/Missie1/intromissie1/prof2.png", __ASSET__assets_images_missie1_intromissie1_prof2_png);
		type.set ("assets/images/Missie1/intromissie1/prof2.png", AssetType.IMAGE);
		className.set ("assets/images/Missie1/intromissie1/prof3.png", __ASSET__assets_images_missie1_intromissie1_prof3_png);
		type.set ("assets/images/Missie1/intromissie1/prof3.png", AssetType.IMAGE);
		className.set ("assets/images/Missie1/intromissie1/prof4.png", __ASSET__assets_images_missie1_intromissie1_prof4_png);
		type.set ("assets/images/Missie1/intromissie1/prof4.png", AssetType.IMAGE);
		className.set ("assets/images/Missie1/intromissie1/prof5.png", __ASSET__assets_images_missie1_intromissie1_prof5_png);
		type.set ("assets/images/Missie1/intromissie1/prof5.png", AssetType.IMAGE);
		className.set ("assets/images/Missie1/intromissie1/prof6.png", __ASSET__assets_images_missie1_intromissie1_prof6_png);
		type.set ("assets/images/Missie1/intromissie1/prof6.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.1.png", __ASSET__assets_images_missie2_emo1_1_png);
		type.set ("assets/images/Missie2/emo1.1.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.10.png", __ASSET__assets_images_missie2_emo1_10_png);
		type.set ("assets/images/Missie2/emo1.10.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.11.png", __ASSET__assets_images_missie2_emo1_11_png);
		type.set ("assets/images/Missie2/emo1.11.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.2.png", __ASSET__assets_images_missie2_emo1_2_png);
		type.set ("assets/images/Missie2/emo1.2.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.3.png", __ASSET__assets_images_missie2_emo1_3_png);
		type.set ("assets/images/Missie2/emo1.3.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.4.png", __ASSET__assets_images_missie2_emo1_4_png);
		type.set ("assets/images/Missie2/emo1.4.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.5.png", __ASSET__assets_images_missie2_emo1_5_png);
		type.set ("assets/images/Missie2/emo1.5.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.6.png", __ASSET__assets_images_missie2_emo1_6_png);
		type.set ("assets/images/Missie2/emo1.6.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.7.png", __ASSET__assets_images_missie2_emo1_7_png);
		type.set ("assets/images/Missie2/emo1.7.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.8.png", __ASSET__assets_images_missie2_emo1_8_png);
		type.set ("assets/images/Missie2/emo1.8.png", AssetType.IMAGE);
		className.set ("assets/images/Missie2/emo1.9.png", __ASSET__assets_images_missie2_emo1_9_png);
		type.set ("assets/images/Missie2/emo1.9.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Feggit1.png", __ASSET__assets_images_missie3_feggit1_png);
		type.set ("assets/images/Missie3/Feggit1.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Feggit2.png", __ASSET__assets_images_missie3_feggit2_png);
		type.set ("assets/images/Missie3/Feggit2.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Feggit3.png", __ASSET__assets_images_missie3_feggit3_png);
		type.set ("assets/images/Missie3/Feggit3.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Feggit4.png", __ASSET__assets_images_missie3_feggit4_png);
		type.set ("assets/images/Missie3/Feggit4.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Feggit5.png", __ASSET__assets_images_missie3_feggit5_png);
		type.set ("assets/images/Missie3/Feggit5.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Judge1.png", __ASSET__assets_images_missie3_judge1_png);
		type.set ("assets/images/Missie3/Judge1.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Judge2.png", __ASSET__assets_images_missie3_judge2_png);
		type.set ("assets/images/Missie3/Judge2.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Mom1.png", __ASSET__assets_images_missie3_mom1_png);
		type.set ("assets/images/Missie3/Mom1.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Mom2.png", __ASSET__assets_images_missie3_mom2_png);
		type.set ("assets/images/Missie3/Mom2.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Mom3.png", __ASSET__assets_images_missie3_mom3_png);
		type.set ("assets/images/Missie3/Mom3.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Pro1.png", __ASSET__assets_images_missie3_pro1_png);
		type.set ("assets/images/Missie3/Pro1.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Pro2.png", __ASSET__assets_images_missie3_pro2_png);
		type.set ("assets/images/Missie3/Pro2.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Pro3.png", __ASSET__assets_images_missie3_pro3_png);
		type.set ("assets/images/Missie3/Pro3.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Pro4.png", __ASSET__assets_images_missie3_pro4_png);
		type.set ("assets/images/Missie3/Pro4.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Pro5.png", __ASSET__assets_images_missie3_pro5_png);
		type.set ("assets/images/Missie3/Pro5.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Pro6.png", __ASSET__assets_images_missie3_pro6_png);
		type.set ("assets/images/Missie3/Pro6.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Pro7.png", __ASSET__assets_images_missie3_pro7_png);
		type.set ("assets/images/Missie3/Pro7.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Pro8.png", __ASSET__assets_images_missie3_pro8_png);
		type.set ("assets/images/Missie3/Pro8.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Prof9.png", __ASSET__assets_images_missie3_prof9_png);
		type.set ("assets/images/Missie3/Prof9.png", AssetType.IMAGE);
		className.set ("assets/images/Missie3/Thumbs2.db", __ASSET__assets_images_missie3_thumbs2_db);
		type.set ("assets/images/Missie3/Thumbs2.db", AssetType.BINARY);
		className.set ("assets/images/Mission3-Mother.png", __ASSET__assets_images_mission3_mother_png);
		type.set ("assets/images/Mission3-Mother.png", AssetType.IMAGE);
		className.set ("assets/images/Mom.png", __ASSET__assets_images_mom_png);
		type.set ("assets/images/Mom.png", AssetType.IMAGE);
		className.set ("assets/images/NEWTilesheet_Complete.png", __ASSET__assets_images_newtilesheet_complete_png);
		type.set ("assets/images/NEWTilesheet_Complete.png", AssetType.IMAGE);
		className.set ("assets/images/NEW_Tilesheet_Complete.png", __ASSET__assets_images_new_tilesheet_complete_png);
		type.set ("assets/images/NEW_Tilesheet_Complete.png", AssetType.IMAGE);
		className.set ("assets/images/NPCCharacterTilesheet.png", __ASSET__assets_images_npccharactertilesheet_png);
		type.set ("assets/images/NPCCharacterTilesheet.png", AssetType.IMAGE);
		className.set ("assets/images/pat.png", __ASSET__assets_images_pat_png);
		type.set ("assets/images/pat.png", AssetType.IMAGE);
		className.set ("assets/images/Push1.png", __ASSET__assets_images_push1_png);
		type.set ("assets/images/Push1.png", AssetType.IMAGE);
		className.set ("assets/images/resetbutton.png", __ASSET__assets_images_resetbutton_png);
		type.set ("assets/images/resetbutton.png", AssetType.IMAGE);
		className.set ("assets/images/Speechbubble.png", __ASSET__assets_images_speechbubble_png);
		type.set ("assets/images/Speechbubble.png", AssetType.IMAGE);
		className.set ("assets/images/Story/1.png", __ASSET__assets_images_story_1_png);
		type.set ("assets/images/Story/1.png", AssetType.IMAGE);
		className.set ("assets/images/Story/1StartingScreeeeeeen.png", __ASSET__assets_images_story_1startingscreeeeeeen_png);
		type.set ("assets/images/Story/1StartingScreeeeeeen.png", AssetType.IMAGE);
		className.set ("assets/images/Story/2.png", __ASSET__assets_images_story_2_png);
		type.set ("assets/images/Story/2.png", AssetType.IMAGE);
		className.set ("assets/images/Story/3.png", __ASSET__assets_images_story_3_png);
		type.set ("assets/images/Story/3.png", AssetType.IMAGE);
		className.set ("assets/images/Story/4.png", __ASSET__assets_images_story_4_png);
		type.set ("assets/images/Story/4.png", AssetType.IMAGE);
		className.set ("assets/images/Story/Introscreen.png", __ASSET__assets_images_story_introscreen_png);
		type.set ("assets/images/Story/Introscreen.png", AssetType.IMAGE);
		className.set ("assets/images/Story/Pat.png", __ASSET__assets_images_story_pat_png);
		type.set ("assets/images/Story/Pat.png", AssetType.IMAGE);
		className.set ("assets/images/Story/Prof.png", __ASSET__assets_images_story_prof_png);
		type.set ("assets/images/Story/Prof.png", AssetType.IMAGE);
		className.set ("assets/images/Story/startbutton.png", __ASSET__assets_images_story_startbutton_png);
		type.set ("assets/images/Story/startbutton.png", AssetType.IMAGE);
		className.set ("assets/images/Story/Tec.png", __ASSET__assets_images_story_tec_png);
		type.set ("assets/images/Story/Tec.png", AssetType.IMAGE);
		className.set ("assets/images/Story/Victory.png", __ASSET__assets_images_story_victory_png);
		type.set ("assets/images/Story/Victory.png", AssetType.IMAGE);
		className.set ("assets/images/Story/xbutton.png", __ASSET__assets_images_story_xbutton_png);
		type.set ("assets/images/Story/xbutton.png", AssetType.IMAGE);
		className.set ("assets/images/SWAG-Kid-Walk-Kopie.png", __ASSET__assets_images_swag_kid_walk_kopie_png);
		type.set ("assets/images/SWAG-Kid-Walk-Kopie.png", AssetType.IMAGE);
		className.set ("assets/images/SwagKidMission1.png", __ASSET__assets_images_swagkidmission1_png);
		type.set ("assets/images/SwagKidMission1.png", AssetType.IMAGE);
		className.set ("assets/images/Teacher.png", __ASSET__assets_images_teacher_png);
		type.set ("assets/images/Teacher.png", AssetType.IMAGE);
		className.set ("assets/images/teacher1.png", __ASSET__assets_images_teacher1_png);
		type.set ("assets/images/teacher1.png", AssetType.IMAGE);
		className.set ("assets/images/tec.png", __ASSET__assets_images_tec_png);
		type.set ("assets/images/tec.png", AssetType.IMAGE);
		className.set ("assets/images/Tilesheet_Complete.png", __ASSET__assets_images_tilesheet_complete_png);
		type.set ("assets/images/Tilesheet_Complete.png", AssetType.IMAGE);
		className.set ("assets/images/Tilesheet_Complete2.png", __ASSET__assets_images_tilesheet_complete2_png);
		type.set ("assets/images/Tilesheet_Complete2.png", AssetType.IMAGE);
		className.set ("assets/images/Tilesheet_Complete3.png", __ASSET__assets_images_tilesheet_complete3_png);
		type.set ("assets/images/Tilesheet_Complete3.png", AssetType.IMAGE);
		className.set ("assets/images/Tmblr.png", __ASSET__assets_images_tmblr_png);
		type.set ("assets/images/Tmblr.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/music/select.wav", __ASSET__assets_music_select_wav);
		type.set ("assets/music/select.wav", AssetType.SOUND);
		className.set ("assets/music/townMusic.wav", __ASSET__assets_music_townmusic_wav);
		type.set ("assets/music/townMusic.wav", AssetType.SOUND);
		className.set ("assets/Playtest.txt", __ASSET__assets_playtest_txt);
		type.set ("assets/Playtest.txt", AssetType.TEXT);
		className.set ("assets/sounds/IntroMissie/Tut1.mp3", __ASSET__assets_sounds_intromissie_tut1_mp3);
		type.set ("assets/sounds/IntroMissie/Tut1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/Tut2.mp3", __ASSET__assets_sounds_intromissie_tut2_mp3);
		type.set ("assets/sounds/IntroMissie/Tut2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/Tut3.mp3", __ASSET__assets_sounds_intromissie_tut3_mp3);
		type.set ("assets/sounds/IntroMissie/Tut3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/Tut4.mp3", __ASSET__assets_sounds_intromissie_tut4_mp3);
		type.set ("assets/sounds/IntroMissie/Tut4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/Tut5.mp3", __ASSET__assets_sounds_intromissie_tut5_mp3);
		type.set ("assets/sounds/IntroMissie/Tut5.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/Tut6.mp3", __ASSET__assets_sounds_intromissie_tut6_mp3);
		type.set ("assets/sounds/IntroMissie/Tut6.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/Tut7.mp3", __ASSET__assets_sounds_intromissie_tut7_mp3);
		type.set ("assets/sounds/IntroMissie/Tut7.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Intromusic.mp3", __ASSET__assets_sounds_intromusic_mp3);
		type.set ("assets/sounds/Intromusic.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Knightmare/Knightmare1.mp3", __ASSET__assets_sounds_knightmare_knightmare1_mp3);
		type.set ("assets/sounds/Knightmare/Knightmare1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Knightmare/Luuk1.mp3", __ASSET__assets_sounds_knightmare_luuk1_mp3);
		type.set ("assets/sounds/Knightmare/Luuk1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind1/Kind1-1.mp3", __ASSET__assets_sounds_missie1_kind1_kind1_1_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Kind1-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind1/Kind1-2.mp3", __ASSET__assets_sounds_missie1_kind1_kind1_2_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Kind1-2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof1_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof2_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof3_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind2/Kind2-1.mp3", __ASSET__assets_sounds_missie1_kind2_kind2_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Kind2-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind2/Kind2-2.mp3", __ASSET__assets_sounds_missie1_kind2_kind2_2_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Kind2-2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof1_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof2_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof3_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind3/Kind3-1.mp3", __ASSET__assets_sounds_missie1_kind3_kind3_1_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Kind3-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind3/Kind3-2.mp3", __ASSET__assets_sounds_missie1_kind3_kind3_2_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Kind3-2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind3/Kind3-3.mp3", __ASSET__assets_sounds_missie1_kind3_kind3_3_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Kind3-3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind3/Prof1-2.mp3", __ASSET__assets_sounds_missie1_kind3_prof1_2_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Prof1-2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind3/Prof2-2.mp3", __ASSET__assets_sounds_missie1_kind3_prof2_2_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Prof2-2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind3/Prof3-2.mp3", __ASSET__assets_sounds_missie1_kind3_prof3_2_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Prof3-2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind3/Prof4-2.mp3", __ASSET__assets_sounds_missie1_kind3_prof4_2_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Prof4-2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Prof4-3.mp3", __ASSET__assets_sounds_missie1_prof4_3_mp3);
		type.set ("assets/sounds/Missie1/Prof4-3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Teacher/Prof1-3.mp3", __ASSET__assets_sounds_missie1_teacher_prof1_3_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Prof1-3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Teacher/Prof2-3.mp3", __ASSET__assets_sounds_missie1_teacher_prof2_3_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Prof2-3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Teacher/Prof3-3.mp3", __ASSET__assets_sounds_missie1_teacher_prof3_3_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Prof3-3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Teacher/Teacher1-1.mp3", __ASSET__assets_sounds_missie1_teacher_teacher1_1_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Teacher/Teacher1-2.mp3", __ASSET__assets_sounds_missie1_teacher_teacher1_2_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", __ASSET__assets_sounds_missie1_teacher_teacher1_3_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Teacher/Teacher1-4.mp3", __ASSET__assets_sounds_missie1_teacher_teacher1_4_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Teacher/Teacher1.mp3", __ASSET__assets_sounds_missie1_teacher_teacher1_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Teacher1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Dad1.mp3", __ASSET__assets_sounds_missie2_dad1_mp3);
		type.set ("assets/sounds/Missie2/Dad1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Dad2.mp3", __ASSET__assets_sounds_missie2_dad2_mp3);
		type.set ("assets/sounds/Missie2/Dad2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Dad3.mp3", __ASSET__assets_sounds_missie2_dad3_mp3);
		type.set ("assets/sounds/Missie2/Dad3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Kid1.mp3", __ASSET__assets_sounds_missie2_kid1_mp3);
		type.set ("assets/sounds/Missie2/Kid1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Kid2.mp3", __ASSET__assets_sounds_missie2_kid2_mp3);
		type.set ("assets/sounds/Missie2/Kid2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Kid3.mp3", __ASSET__assets_sounds_missie2_kid3_mp3);
		type.set ("assets/sounds/Missie2/Kid3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Prof1.mp3", __ASSET__assets_sounds_missie2_prof1_mp3);
		type.set ("assets/sounds/Missie2/Prof1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Prof2.mp3", __ASSET__assets_sounds_missie2_prof2_mp3);
		type.set ("assets/sounds/Missie2/Prof2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Prof3.mp3", __ASSET__assets_sounds_missie2_prof3_mp3);
		type.set ("assets/sounds/Missie2/Prof3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Prof4.mp3", __ASSET__assets_sounds_missie2_prof4_mp3);
		type.set ("assets/sounds/Missie2/Prof4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Prof5.mp3", __ASSET__assets_sounds_missie2_prof5_mp3);
		type.set ("assets/sounds/Missie2/Prof5.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/judge1.mp3", __ASSET__assets_sounds_missie3_judge1_mp3);
		type.set ("assets/sounds/Missie3/judge1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/judge2.mp3", __ASSET__assets_sounds_missie3_judge2_mp3);
		type.set ("assets/sounds/Missie3/judge2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-1.mp3", __ASSET__assets_sounds_missie3_missie3_1_mp3);
		type.set ("assets/sounds/Missie3/Missie3-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-10.mp3", __ASSET__assets_sounds_missie3_missie3_10_mp3);
		type.set ("assets/sounds/Missie3/Missie3-10.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/missie3-11.mp3", __ASSET__assets_sounds_missie3_missie3_11_mp3);
		type.set ("assets/sounds/Missie3/missie3-11.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-12.mp3", __ASSET__assets_sounds_missie3_missie3_12_mp3);
		type.set ("assets/sounds/Missie3/Missie3-12.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/missie3-13.mp3", __ASSET__assets_sounds_missie3_missie3_13_mp3);
		type.set ("assets/sounds/Missie3/missie3-13.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-14.mp3", __ASSET__assets_sounds_missie3_missie3_14_mp3);
		type.set ("assets/sounds/Missie3/Missie3-14.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-15.mp3", __ASSET__assets_sounds_missie3_missie3_15_mp3);
		type.set ("assets/sounds/Missie3/Missie3-15.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-2.mp3", __ASSET__assets_sounds_missie3_missie3_2_mp3);
		type.set ("assets/sounds/Missie3/Missie3-2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-3.1.mp3", __ASSET__assets_sounds_missie3_missie3_3_1_mp3);
		type.set ("assets/sounds/Missie3/Missie3-3.1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-3.mp3", __ASSET__assets_sounds_missie3_missie3_3_mp3);
		type.set ("assets/sounds/Missie3/Missie3-3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-4.mp3", __ASSET__assets_sounds_missie3_missie3_4_mp3);
		type.set ("assets/sounds/Missie3/Missie3-4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-5-1.mp3", __ASSET__assets_sounds_missie3_missie3_5_1_mp3);
		type.set ("assets/sounds/Missie3/Missie3-5-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-5.mp3", __ASSET__assets_sounds_missie3_missie3_5_mp3);
		type.set ("assets/sounds/Missie3/Missie3-5.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-6.mp3", __ASSET__assets_sounds_missie3_missie3_6_mp3);
		type.set ("assets/sounds/Missie3/Missie3-6.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-7.mp3", __ASSET__assets_sounds_missie3_missie3_7_mp3);
		type.set ("assets/sounds/Missie3/Missie3-7.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-8.mp3", __ASSET__assets_sounds_missie3_missie3_8_mp3);
		type.set ("assets/sounds/Missie3/Missie3-8.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie3/Missie3-9.mp3", __ASSET__assets_sounds_missie3_missie3_9_mp3);
		type.set ("assets/sounds/Missie3/Missie3-9.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Music/Chase.mp3", __ASSET__assets_sounds_music_chase_mp3);
		type.set ("assets/sounds/Music/Chase.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Music/Haahn's Dutch.wav", __ASSET__assets_sounds_music_haahn_s_dutch_wav);
		type.set ("assets/sounds/Music/Haahn's Dutch.wav", AssetType.SOUND);
		className.set ("assets/sounds/Music/introstuk.mp3", __ASSET__assets_sounds_music_introstuk_mp3);
		type.set ("assets/sounds/Music/introstuk.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Music/KJRWHouse.wav", __ASSET__assets_sounds_music_kjrwhouse_wav);
		type.set ("assets/sounds/Music/KJRWHouse.wav", AssetType.SOUND);
		className.set ("assets/sounds/Music/Knightmare.mp3", __ASSET__assets_sounds_music_knightmare_mp3);
		type.set ("assets/sounds/Music/Knightmare.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Music/Puzzle.mp3", __ASSET__assets_sounds_music_puzzle_mp3);
		type.set ("assets/sounds/Music/Puzzle.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Music/Startscreen.mp3", __ASSET__assets_sounds_music_startscreen_mp3);
		type.set ("assets/sounds/Music/Startscreen.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Music/Townsong.mp3", __ASSET__assets_sounds_music_townsong_mp3);
		type.set ("assets/sounds/Music/Townsong.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/OutroVoice.mp3", __ASSET__assets_sounds_outrovoice_mp3);
		type.set ("assets/sounds/OutroVoice.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/Final Maps/NightmareMap.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/puzzle1.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/puzzle2-1-1.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/puzzle2-1.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/puzzle2-2.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/puzzle2-3.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/puzzle3.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/traininglevel1.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/traininglevel2.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/traininglevel3.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/worldmap1.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/worldmap2.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/worldmap3.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/worldmap4.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/worldmap5.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Final Maps/worldmap6.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/reachtshelden.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/AngryDadMission2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/AttackCircle128x64.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Bald-Mission1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/BaldMission1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/BeachBall-Mission3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CharacterTilesheet768x768.png";
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
		id = "assets/images/health.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ion.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ion2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Judge-Mission-3.png";
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
		id = "assets/images/Knightmare Fight/Text2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KnightmareCompleteTilesheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Knightmare_Tilesheet_Complete.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/KRJW-Tutorial.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
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
		id = "assets/images/Mission3-Mother.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mom.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NEWTilesheet_Complete.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NEW_Tilesheet_Complete.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NPCCharacterTilesheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Push1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/resetbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Speechbubble.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/1StartingScreeeeeeen.png";
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
		id = "assets/images/Story/startbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/Tec.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/Victory.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Story/xbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SWAG-Kid-Walk-Kopie.png";
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
		id = "assets/images/Tilesheet_Complete.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tilesheet_Complete2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tilesheet_Complete3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tmblr.png";
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
		id = "assets/Playtest.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/IntroMissie/Tut1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/Tut2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/Tut3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/Tut4.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/Tut5.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/Tut6.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/IntroMissie/Tut7.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Intromusic.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Knightmare1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Knightmare/Luuk1.mp3";
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
		id = "assets/sounds/Missie1/Kind2/Kind2-1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Kind2/Kind2-2.mp3";
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
		id = "assets/sounds/Missie3/judge1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/judge2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-10.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/missie3-11.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-12.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/missie3-13.mp3";
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
		id = "assets/sounds/Missie3/Missie3-3.1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-4.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie3/Missie3-5-1.mp3";
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
		id = "assets/sounds/Missie3/Missie3-9.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Chase.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Haahn's Dutch.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Music/introstuk.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/KJRWHouse.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Music/Knightmare.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Puzzle.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Startscreen.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Music/Townsong.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/OutroVoice.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
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
		
		className.set ("assets/data/Final Maps/NightmareMap.oel", __ASSET__assets_data_final_maps_nightmaremap_oel);
		type.set ("assets/data/Final Maps/NightmareMap.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/puzzle1.oel", __ASSET__assets_data_final_maps_puzzle1_oel);
		type.set ("assets/data/Final Maps/puzzle1.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/puzzle2-1-1.oel", __ASSET__assets_data_final_maps_puzzle2_1_1_oel);
		type.set ("assets/data/Final Maps/puzzle2-1-1.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/puzzle2-1.oel", __ASSET__assets_data_final_maps_puzzle2_1_oel);
		type.set ("assets/data/Final Maps/puzzle2-1.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/puzzle2-2.oel", __ASSET__assets_data_final_maps_puzzle2_2_oel);
		type.set ("assets/data/Final Maps/puzzle2-2.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/puzzle2-3.oel", __ASSET__assets_data_final_maps_puzzle2_3_oel);
		type.set ("assets/data/Final Maps/puzzle2-3.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/puzzle3.oel", __ASSET__assets_data_final_maps_puzzle3_oel);
		type.set ("assets/data/Final Maps/puzzle3.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/traininglevel1.oel", __ASSET__assets_data_final_maps_traininglevel1_oel);
		type.set ("assets/data/Final Maps/traininglevel1.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/traininglevel2.oel", __ASSET__assets_data_final_maps_traininglevel2_oel);
		type.set ("assets/data/Final Maps/traininglevel2.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/traininglevel3.oel", __ASSET__assets_data_final_maps_traininglevel3_oel);
		type.set ("assets/data/Final Maps/traininglevel3.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/worldmap1.oel", __ASSET__assets_data_final_maps_worldmap1_oel);
		type.set ("assets/data/Final Maps/worldmap1.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/worldmap2.oel", __ASSET__assets_data_final_maps_worldmap2_oel);
		type.set ("assets/data/Final Maps/worldmap2.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/worldmap3.oel", __ASSET__assets_data_final_maps_worldmap3_oel);
		type.set ("assets/data/Final Maps/worldmap3.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/worldmap4.oel", __ASSET__assets_data_final_maps_worldmap4_oel);
		type.set ("assets/data/Final Maps/worldmap4.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/worldmap5.oel", __ASSET__assets_data_final_maps_worldmap5_oel);
		type.set ("assets/data/Final Maps/worldmap5.oel", AssetType.TEXT);
		
		className.set ("assets/data/Final Maps/worldmap6.oel", __ASSET__assets_data_final_maps_worldmap6_oel);
		type.set ("assets/data/Final Maps/worldmap6.oel", AssetType.TEXT);
		
		className.set ("assets/data/reachtshelden.oep", __ASSET__assets_data_reachtshelden_oep);
		type.set ("assets/data/reachtshelden.oep", AssetType.TEXT);
		
		className.set ("assets/images/AngryDadMission2.png", __ASSET__assets_images_angrydadmission2_png);
		type.set ("assets/images/AngryDadMission2.png", AssetType.IMAGE);
		
		className.set ("assets/images/AttackCircle128x64.png", __ASSET__assets_images_attackcircle128x64_png);
		type.set ("assets/images/AttackCircle128x64.png", AssetType.IMAGE);
		
		className.set ("assets/images/Bald-Mission1.png", __ASSET__assets_images_bald_mission1_png);
		type.set ("assets/images/Bald-Mission1.png", AssetType.IMAGE);
		
		className.set ("assets/images/BaldMission1.png", __ASSET__assets_images_baldmission1_png);
		type.set ("assets/images/BaldMission1.png", AssetType.IMAGE);
		
		className.set ("assets/images/BeachBall-Mission3.png", __ASSET__assets_images_beachball_mission3_png);
		type.set ("assets/images/BeachBall-Mission3.png", AssetType.IMAGE);
		
		className.set ("assets/images/CharacterTilesheet768x768.png", __ASSET__assets_images_charactertilesheet768x768_png);
		type.set ("assets/images/CharacterTilesheet768x768.png", AssetType.IMAGE);
		
		className.set ("assets/images/DodgeBall-Mission-3.png", __ASSET__assets_images_dodgeball_mission_3_png);
		type.set ("assets/images/DodgeBall-Mission-3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Emo-Kid-Mission2 (1).png", __ASSET__assets_images_emo_kid_mission2__1__png);
		type.set ("assets/images/Emo-Kid-Mission2 (1).png", AssetType.IMAGE);
		
		className.set ("assets/images/Emo-Kid-Mission3).png", __ASSET__assets_images_emo_kid_mission3__png);
		type.set ("assets/images/Emo-Kid-Mission3).png", AssetType.IMAGE);
		
		className.set ("assets/images/Football-Mission-3.png", __ASSET__assets_images_football_mission_3_png);
		type.set ("assets/images/Football-Mission-3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Furniture.png", __ASSET__assets_images_furniture_png);
		type.set ("assets/images/Furniture.png", AssetType.IMAGE);
		
		className.set ("assets/images/Girl-Mission1.png", __ASSET__assets_images_girl_mission1_png);
		type.set ("assets/images/Girl-Mission1.png", AssetType.IMAGE);
		
		className.set ("assets/images/girlMission1.png", __ASSET__assets_images_girlmission1_png);
		type.set ("assets/images/girlMission1.png", AssetType.IMAGE);
		
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		
		className.set ("assets/images/ion.png", __ASSET__assets_images_ion_png);
		type.set ("assets/images/ion.png", AssetType.IMAGE);
		
		className.set ("assets/images/ion2.png", __ASSET__assets_images_ion2_png);
		type.set ("assets/images/ion2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Judge-Mission-3.png", __ASSET__assets_images_judge_mission_3_png);
		type.set ("assets/images/Judge-Mission-3.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind1.1.png", __ASSET__assets_images_kind1_1_png);
		type.set ("assets/images/kind1.1.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind1.2.png", __ASSET__assets_images_kind1_2_png);
		type.set ("assets/images/kind1.2.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind1.3.png", __ASSET__assets_images_kind1_3_png);
		type.set ("assets/images/kind1.3.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind1.4.png", __ASSET__assets_images_kind1_4_png);
		type.set ("assets/images/kind1.4.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind1.5.png", __ASSET__assets_images_kind1_5_png);
		type.set ("assets/images/kind1.5.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind2.1.png", __ASSET__assets_images_kind2_1_png);
		type.set ("assets/images/kind2.1.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind2.2.png", __ASSET__assets_images_kind2_2_png);
		type.set ("assets/images/kind2.2.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind2.3.png", __ASSET__assets_images_kind2_3_png);
		type.set ("assets/images/kind2.3.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind2.4.png", __ASSET__assets_images_kind2_4_png);
		type.set ("assets/images/kind2.4.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind2.5.png", __ASSET__assets_images_kind2_5_png);
		type.set ("assets/images/kind2.5.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind3.1.png", __ASSET__assets_images_kind3_1_png);
		type.set ("assets/images/kind3.1.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind3.2.png", __ASSET__assets_images_kind3_2_png);
		type.set ("assets/images/kind3.2.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind3.3.png", __ASSET__assets_images_kind3_3_png);
		type.set ("assets/images/kind3.3.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind3.4.png", __ASSET__assets_images_kind3_4_png);
		type.set ("assets/images/kind3.4.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind3.5.png", __ASSET__assets_images_kind3_5_png);
		type.set ("assets/images/kind3.5.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind3.6.png", __ASSET__assets_images_kind3_6_png);
		type.set ("assets/images/kind3.6.png", AssetType.IMAGE);
		
		className.set ("assets/images/kind3.7.png", __ASSET__assets_images_kind3_7_png);
		type.set ("assets/images/kind3.7.png", AssetType.IMAGE);
		
		className.set ("assets/images/KJRW-Tutotial-3.png", __ASSET__assets_images_kjrw_tutotial_3_png);
		type.set ("assets/images/KJRW-Tutotial-3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Knightmare Fight/Text1.png", __ASSET__assets_images_knightmare_fight_text1_png);
		type.set ("assets/images/Knightmare Fight/Text1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Knightmare Fight/Text2.png", __ASSET__assets_images_knightmare_fight_text2_png);
		type.set ("assets/images/Knightmare Fight/Text2.png", AssetType.IMAGE);
		
		className.set ("assets/images/KnightmareCompleteTilesheet.png", __ASSET__assets_images_knightmarecompletetilesheet_png);
		type.set ("assets/images/KnightmareCompleteTilesheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/Knightmare_Tilesheet_Complete.png", __ASSET__assets_images_knightmare_tilesheet_complete_png);
		type.set ("assets/images/Knightmare_Tilesheet_Complete.png", AssetType.IMAGE);
		
		className.set ("assets/images/KRJW-Tutorial.png", __ASSET__assets_images_krjw_tutorial_png);
		type.set ("assets/images/KRJW-Tutorial.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie1/intromissie1/prof0.png", __ASSET__assets_images_missie1_intromissie1_prof0_png);
		type.set ("assets/images/Missie1/intromissie1/prof0.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie1/intromissie1/prof1.png", __ASSET__assets_images_missie1_intromissie1_prof1_png);
		type.set ("assets/images/Missie1/intromissie1/prof1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie1/intromissie1/prof2.png", __ASSET__assets_images_missie1_intromissie1_prof2_png);
		type.set ("assets/images/Missie1/intromissie1/prof2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie1/intromissie1/prof3.png", __ASSET__assets_images_missie1_intromissie1_prof3_png);
		type.set ("assets/images/Missie1/intromissie1/prof3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie1/intromissie1/prof4.png", __ASSET__assets_images_missie1_intromissie1_prof4_png);
		type.set ("assets/images/Missie1/intromissie1/prof4.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie1/intromissie1/prof5.png", __ASSET__assets_images_missie1_intromissie1_prof5_png);
		type.set ("assets/images/Missie1/intromissie1/prof5.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie1/intromissie1/prof6.png", __ASSET__assets_images_missie1_intromissie1_prof6_png);
		type.set ("assets/images/Missie1/intromissie1/prof6.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.1.png", __ASSET__assets_images_missie2_emo1_1_png);
		type.set ("assets/images/Missie2/emo1.1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.10.png", __ASSET__assets_images_missie2_emo1_10_png);
		type.set ("assets/images/Missie2/emo1.10.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.11.png", __ASSET__assets_images_missie2_emo1_11_png);
		type.set ("assets/images/Missie2/emo1.11.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.2.png", __ASSET__assets_images_missie2_emo1_2_png);
		type.set ("assets/images/Missie2/emo1.2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.3.png", __ASSET__assets_images_missie2_emo1_3_png);
		type.set ("assets/images/Missie2/emo1.3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.4.png", __ASSET__assets_images_missie2_emo1_4_png);
		type.set ("assets/images/Missie2/emo1.4.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.5.png", __ASSET__assets_images_missie2_emo1_5_png);
		type.set ("assets/images/Missie2/emo1.5.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.6.png", __ASSET__assets_images_missie2_emo1_6_png);
		type.set ("assets/images/Missie2/emo1.6.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.7.png", __ASSET__assets_images_missie2_emo1_7_png);
		type.set ("assets/images/Missie2/emo1.7.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.8.png", __ASSET__assets_images_missie2_emo1_8_png);
		type.set ("assets/images/Missie2/emo1.8.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie2/emo1.9.png", __ASSET__assets_images_missie2_emo1_9_png);
		type.set ("assets/images/Missie2/emo1.9.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Feggit1.png", __ASSET__assets_images_missie3_feggit1_png);
		type.set ("assets/images/Missie3/Feggit1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Feggit2.png", __ASSET__assets_images_missie3_feggit2_png);
		type.set ("assets/images/Missie3/Feggit2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Feggit3.png", __ASSET__assets_images_missie3_feggit3_png);
		type.set ("assets/images/Missie3/Feggit3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Feggit4.png", __ASSET__assets_images_missie3_feggit4_png);
		type.set ("assets/images/Missie3/Feggit4.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Feggit5.png", __ASSET__assets_images_missie3_feggit5_png);
		type.set ("assets/images/Missie3/Feggit5.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Judge1.png", __ASSET__assets_images_missie3_judge1_png);
		type.set ("assets/images/Missie3/Judge1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Judge2.png", __ASSET__assets_images_missie3_judge2_png);
		type.set ("assets/images/Missie3/Judge2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Mom1.png", __ASSET__assets_images_missie3_mom1_png);
		type.set ("assets/images/Missie3/Mom1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Mom2.png", __ASSET__assets_images_missie3_mom2_png);
		type.set ("assets/images/Missie3/Mom2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Mom3.png", __ASSET__assets_images_missie3_mom3_png);
		type.set ("assets/images/Missie3/Mom3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Pro1.png", __ASSET__assets_images_missie3_pro1_png);
		type.set ("assets/images/Missie3/Pro1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Pro2.png", __ASSET__assets_images_missie3_pro2_png);
		type.set ("assets/images/Missie3/Pro2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Pro3.png", __ASSET__assets_images_missie3_pro3_png);
		type.set ("assets/images/Missie3/Pro3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Pro4.png", __ASSET__assets_images_missie3_pro4_png);
		type.set ("assets/images/Missie3/Pro4.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Pro5.png", __ASSET__assets_images_missie3_pro5_png);
		type.set ("assets/images/Missie3/Pro5.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Pro6.png", __ASSET__assets_images_missie3_pro6_png);
		type.set ("assets/images/Missie3/Pro6.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Pro7.png", __ASSET__assets_images_missie3_pro7_png);
		type.set ("assets/images/Missie3/Pro7.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Pro8.png", __ASSET__assets_images_missie3_pro8_png);
		type.set ("assets/images/Missie3/Pro8.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Prof9.png", __ASSET__assets_images_missie3_prof9_png);
		type.set ("assets/images/Missie3/Prof9.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missie3/Thumbs2.db", __ASSET__assets_images_missie3_thumbs2_db);
		type.set ("assets/images/Missie3/Thumbs2.db", AssetType.BINARY);
		
		className.set ("assets/images/Mission3-Mother.png", __ASSET__assets_images_mission3_mother_png);
		type.set ("assets/images/Mission3-Mother.png", AssetType.IMAGE);
		
		className.set ("assets/images/Mom.png", __ASSET__assets_images_mom_png);
		type.set ("assets/images/Mom.png", AssetType.IMAGE);
		
		className.set ("assets/images/NEWTilesheet_Complete.png", __ASSET__assets_images_newtilesheet_complete_png);
		type.set ("assets/images/NEWTilesheet_Complete.png", AssetType.IMAGE);
		
		className.set ("assets/images/NEW_Tilesheet_Complete.png", __ASSET__assets_images_new_tilesheet_complete_png);
		type.set ("assets/images/NEW_Tilesheet_Complete.png", AssetType.IMAGE);
		
		className.set ("assets/images/NPCCharacterTilesheet.png", __ASSET__assets_images_npccharactertilesheet_png);
		type.set ("assets/images/NPCCharacterTilesheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/pat.png", __ASSET__assets_images_pat_png);
		type.set ("assets/images/pat.png", AssetType.IMAGE);
		
		className.set ("assets/images/Push1.png", __ASSET__assets_images_push1_png);
		type.set ("assets/images/Push1.png", AssetType.IMAGE);
		
		className.set ("assets/images/resetbutton.png", __ASSET__assets_images_resetbutton_png);
		type.set ("assets/images/resetbutton.png", AssetType.IMAGE);
		
		className.set ("assets/images/Speechbubble.png", __ASSET__assets_images_speechbubble_png);
		type.set ("assets/images/Speechbubble.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/1.png", __ASSET__assets_images_story_1_png);
		type.set ("assets/images/Story/1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/1StartingScreeeeeeen.png", __ASSET__assets_images_story_1startingscreeeeeeen_png);
		type.set ("assets/images/Story/1StartingScreeeeeeen.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/2.png", __ASSET__assets_images_story_2_png);
		type.set ("assets/images/Story/2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/3.png", __ASSET__assets_images_story_3_png);
		type.set ("assets/images/Story/3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/4.png", __ASSET__assets_images_story_4_png);
		type.set ("assets/images/Story/4.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/Introscreen.png", __ASSET__assets_images_story_introscreen_png);
		type.set ("assets/images/Story/Introscreen.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/Pat.png", __ASSET__assets_images_story_pat_png);
		type.set ("assets/images/Story/Pat.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/Prof.png", __ASSET__assets_images_story_prof_png);
		type.set ("assets/images/Story/Prof.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/startbutton.png", __ASSET__assets_images_story_startbutton_png);
		type.set ("assets/images/Story/startbutton.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/Tec.png", __ASSET__assets_images_story_tec_png);
		type.set ("assets/images/Story/Tec.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/Victory.png", __ASSET__assets_images_story_victory_png);
		type.set ("assets/images/Story/Victory.png", AssetType.IMAGE);
		
		className.set ("assets/images/Story/xbutton.png", __ASSET__assets_images_story_xbutton_png);
		type.set ("assets/images/Story/xbutton.png", AssetType.IMAGE);
		
		className.set ("assets/images/SWAG-Kid-Walk-Kopie.png", __ASSET__assets_images_swag_kid_walk_kopie_png);
		type.set ("assets/images/SWAG-Kid-Walk-Kopie.png", AssetType.IMAGE);
		
		className.set ("assets/images/SwagKidMission1.png", __ASSET__assets_images_swagkidmission1_png);
		type.set ("assets/images/SwagKidMission1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Teacher.png", __ASSET__assets_images_teacher_png);
		type.set ("assets/images/Teacher.png", AssetType.IMAGE);
		
		className.set ("assets/images/teacher1.png", __ASSET__assets_images_teacher1_png);
		type.set ("assets/images/teacher1.png", AssetType.IMAGE);
		
		className.set ("assets/images/tec.png", __ASSET__assets_images_tec_png);
		type.set ("assets/images/tec.png", AssetType.IMAGE);
		
		className.set ("assets/images/Tilesheet_Complete.png", __ASSET__assets_images_tilesheet_complete_png);
		type.set ("assets/images/Tilesheet_Complete.png", AssetType.IMAGE);
		
		className.set ("assets/images/Tilesheet_Complete2.png", __ASSET__assets_images_tilesheet_complete2_png);
		type.set ("assets/images/Tilesheet_Complete2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Tilesheet_Complete3.png", __ASSET__assets_images_tilesheet_complete3_png);
		type.set ("assets/images/Tilesheet_Complete3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Tmblr.png", __ASSET__assets_images_tmblr_png);
		type.set ("assets/images/Tmblr.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/music/select.wav", __ASSET__assets_music_select_wav);
		type.set ("assets/music/select.wav", AssetType.SOUND);
		
		className.set ("assets/music/townMusic.wav", __ASSET__assets_music_townmusic_wav);
		type.set ("assets/music/townMusic.wav", AssetType.SOUND);
		
		className.set ("assets/Playtest.txt", __ASSET__assets_playtest_txt);
		type.set ("assets/Playtest.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/IntroMissie/Tut1.mp3", __ASSET__assets_sounds_intromissie_tut1_mp3);
		type.set ("assets/sounds/IntroMissie/Tut1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/Tut2.mp3", __ASSET__assets_sounds_intromissie_tut2_mp3);
		type.set ("assets/sounds/IntroMissie/Tut2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/Tut3.mp3", __ASSET__assets_sounds_intromissie_tut3_mp3);
		type.set ("assets/sounds/IntroMissie/Tut3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/Tut4.mp3", __ASSET__assets_sounds_intromissie_tut4_mp3);
		type.set ("assets/sounds/IntroMissie/Tut4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/Tut5.mp3", __ASSET__assets_sounds_intromissie_tut5_mp3);
		type.set ("assets/sounds/IntroMissie/Tut5.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/Tut6.mp3", __ASSET__assets_sounds_intromissie_tut6_mp3);
		type.set ("assets/sounds/IntroMissie/Tut6.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/Tut7.mp3", __ASSET__assets_sounds_intromissie_tut7_mp3);
		type.set ("assets/sounds/IntroMissie/Tut7.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Intromusic.mp3", __ASSET__assets_sounds_intromusic_mp3);
		type.set ("assets/sounds/Intromusic.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Knightmare/Knightmare1.mp3", __ASSET__assets_sounds_knightmare_knightmare1_mp3);
		type.set ("assets/sounds/Knightmare/Knightmare1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Knightmare/Luuk1.mp3", __ASSET__assets_sounds_knightmare_luuk1_mp3);
		type.set ("assets/sounds/Knightmare/Luuk1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind1/Kind1-1.mp3", __ASSET__assets_sounds_missie1_kind1_kind1_1_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Kind1-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind1/Kind1-2.mp3", __ASSET__assets_sounds_missie1_kind1_kind1_2_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Kind1-2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof1_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof2_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof3_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind2/Kind2-1.mp3", __ASSET__assets_sounds_missie1_kind2_kind2_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Kind2-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind2/Kind2-2.mp3", __ASSET__assets_sounds_missie1_kind2_kind2_2_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Kind2-2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof1_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof2_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof3_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind3/Kind3-1.mp3", __ASSET__assets_sounds_missie1_kind3_kind3_1_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Kind3-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind3/Kind3-2.mp3", __ASSET__assets_sounds_missie1_kind3_kind3_2_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Kind3-2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind3/Kind3-3.mp3", __ASSET__assets_sounds_missie1_kind3_kind3_3_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Kind3-3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind3/Prof1-2.mp3", __ASSET__assets_sounds_missie1_kind3_prof1_2_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Prof1-2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind3/Prof2-2.mp3", __ASSET__assets_sounds_missie1_kind3_prof2_2_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Prof2-2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind3/Prof3-2.mp3", __ASSET__assets_sounds_missie1_kind3_prof3_2_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Prof3-2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind3/Prof4-2.mp3", __ASSET__assets_sounds_missie1_kind3_prof4_2_mp3);
		type.set ("assets/sounds/Missie1/Kind3/Prof4-2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Prof4-3.mp3", __ASSET__assets_sounds_missie1_prof4_3_mp3);
		type.set ("assets/sounds/Missie1/Prof4-3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Teacher/Prof1-3.mp3", __ASSET__assets_sounds_missie1_teacher_prof1_3_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Prof1-3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Teacher/Prof2-3.mp3", __ASSET__assets_sounds_missie1_teacher_prof2_3_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Prof2-3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Teacher/Prof3-3.mp3", __ASSET__assets_sounds_missie1_teacher_prof3_3_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Prof3-3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Teacher/Teacher1-1.mp3", __ASSET__assets_sounds_missie1_teacher_teacher1_1_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Teacher/Teacher1-2.mp3", __ASSET__assets_sounds_missie1_teacher_teacher1_2_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", __ASSET__assets_sounds_missie1_teacher_teacher1_3_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Teacher/Teacher1-4.mp3", __ASSET__assets_sounds_missie1_teacher_teacher1_4_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Teacher1-4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Teacher/Teacher1.mp3", __ASSET__assets_sounds_missie1_teacher_teacher1_mp3);
		type.set ("assets/sounds/Missie1/Teacher/Teacher1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Dad1.mp3", __ASSET__assets_sounds_missie2_dad1_mp3);
		type.set ("assets/sounds/Missie2/Dad1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Dad2.mp3", __ASSET__assets_sounds_missie2_dad2_mp3);
		type.set ("assets/sounds/Missie2/Dad2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Dad3.mp3", __ASSET__assets_sounds_missie2_dad3_mp3);
		type.set ("assets/sounds/Missie2/Dad3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Kid1.mp3", __ASSET__assets_sounds_missie2_kid1_mp3);
		type.set ("assets/sounds/Missie2/Kid1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Kid2.mp3", __ASSET__assets_sounds_missie2_kid2_mp3);
		type.set ("assets/sounds/Missie2/Kid2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Kid3.mp3", __ASSET__assets_sounds_missie2_kid3_mp3);
		type.set ("assets/sounds/Missie2/Kid3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Prof1.mp3", __ASSET__assets_sounds_missie2_prof1_mp3);
		type.set ("assets/sounds/Missie2/Prof1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Prof2.mp3", __ASSET__assets_sounds_missie2_prof2_mp3);
		type.set ("assets/sounds/Missie2/Prof2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Prof3.mp3", __ASSET__assets_sounds_missie2_prof3_mp3);
		type.set ("assets/sounds/Missie2/Prof3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Prof4.mp3", __ASSET__assets_sounds_missie2_prof4_mp3);
		type.set ("assets/sounds/Missie2/Prof4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Prof5.mp3", __ASSET__assets_sounds_missie2_prof5_mp3);
		type.set ("assets/sounds/Missie2/Prof5.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/judge1.mp3", __ASSET__assets_sounds_missie3_judge1_mp3);
		type.set ("assets/sounds/Missie3/judge1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/judge2.mp3", __ASSET__assets_sounds_missie3_judge2_mp3);
		type.set ("assets/sounds/Missie3/judge2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-1.mp3", __ASSET__assets_sounds_missie3_missie3_1_mp3);
		type.set ("assets/sounds/Missie3/Missie3-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-10.mp3", __ASSET__assets_sounds_missie3_missie3_10_mp3);
		type.set ("assets/sounds/Missie3/Missie3-10.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/missie3-11.mp3", __ASSET__assets_sounds_missie3_missie3_11_mp3);
		type.set ("assets/sounds/Missie3/missie3-11.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-12.mp3", __ASSET__assets_sounds_missie3_missie3_12_mp3);
		type.set ("assets/sounds/Missie3/Missie3-12.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/missie3-13.mp3", __ASSET__assets_sounds_missie3_missie3_13_mp3);
		type.set ("assets/sounds/Missie3/missie3-13.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-14.mp3", __ASSET__assets_sounds_missie3_missie3_14_mp3);
		type.set ("assets/sounds/Missie3/Missie3-14.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-15.mp3", __ASSET__assets_sounds_missie3_missie3_15_mp3);
		type.set ("assets/sounds/Missie3/Missie3-15.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-2.mp3", __ASSET__assets_sounds_missie3_missie3_2_mp3);
		type.set ("assets/sounds/Missie3/Missie3-2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-3.1.mp3", __ASSET__assets_sounds_missie3_missie3_3_1_mp3);
		type.set ("assets/sounds/Missie3/Missie3-3.1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-3.mp3", __ASSET__assets_sounds_missie3_missie3_3_mp3);
		type.set ("assets/sounds/Missie3/Missie3-3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-4.mp3", __ASSET__assets_sounds_missie3_missie3_4_mp3);
		type.set ("assets/sounds/Missie3/Missie3-4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-5-1.mp3", __ASSET__assets_sounds_missie3_missie3_5_1_mp3);
		type.set ("assets/sounds/Missie3/Missie3-5-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-5.mp3", __ASSET__assets_sounds_missie3_missie3_5_mp3);
		type.set ("assets/sounds/Missie3/Missie3-5.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-6.mp3", __ASSET__assets_sounds_missie3_missie3_6_mp3);
		type.set ("assets/sounds/Missie3/Missie3-6.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-7.mp3", __ASSET__assets_sounds_missie3_missie3_7_mp3);
		type.set ("assets/sounds/Missie3/Missie3-7.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-8.mp3", __ASSET__assets_sounds_missie3_missie3_8_mp3);
		type.set ("assets/sounds/Missie3/Missie3-8.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie3/Missie3-9.mp3", __ASSET__assets_sounds_missie3_missie3_9_mp3);
		type.set ("assets/sounds/Missie3/Missie3-9.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Music/Chase.mp3", __ASSET__assets_sounds_music_chase_mp3);
		type.set ("assets/sounds/Music/Chase.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Music/Haahn's Dutch.wav", __ASSET__assets_sounds_music_haahn_s_dutch_wav);
		type.set ("assets/sounds/Music/Haahn's Dutch.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Music/introstuk.mp3", __ASSET__assets_sounds_music_introstuk_mp3);
		type.set ("assets/sounds/Music/introstuk.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Music/KJRWHouse.wav", __ASSET__assets_sounds_music_kjrwhouse_wav);
		type.set ("assets/sounds/Music/KJRWHouse.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Music/Knightmare.mp3", __ASSET__assets_sounds_music_knightmare_mp3);
		type.set ("assets/sounds/Music/Knightmare.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Music/Puzzle.mp3", __ASSET__assets_sounds_music_puzzle_mp3);
		type.set ("assets/sounds/Music/Puzzle.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Music/Startscreen.mp3", __ASSET__assets_sounds_music_startscreen_mp3);
		type.set ("assets/sounds/Music/Startscreen.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Music/Townsong.mp3", __ASSET__assets_sounds_music_townsong_mp3);
		type.set ("assets/sounds/Music/Townsong.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/OutroVoice.mp3", __ASSET__assets_sounds_outrovoice_mp3);
		type.set ("assets/sounds/OutroVoice.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
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

@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_nightmaremap_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_puzzle1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_puzzle2_1_1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_puzzle2_1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_puzzle2_2_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_puzzle2_3_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_puzzle3_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_traininglevel1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_traininglevel2_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_traininglevel3_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_worldmap1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_worldmap2_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_worldmap3_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_worldmap4_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_worldmap5_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_final_maps_worldmap6_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_reachtshelden_oep extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_angrydadmission2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_attackcircle128x64_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bald_mission1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_baldmission1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_beachball_mission3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_charactertilesheet768x768_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dodgeball_mission_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_emo_kid_mission2__1__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_emo_kid_mission3__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_football_mission_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_furniture_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_girl_mission1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_girlmission1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_health_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ion2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_judge_mission_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind1_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind1_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind1_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind1_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind1_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind2_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind2_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind2_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind2_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind2_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind3_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind3_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind3_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind3_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind3_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind3_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kind3_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_kjrw_tutotial_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_knightmare_fight_text1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_knightmare_fight_text2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_knightmarecompletetilesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_knightmare_tilesheet_complete_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_krjw_tutorial_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie2_emo1_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_feggit1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_feggit2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_feggit3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_feggit4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_feggit5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_judge1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_judge2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_mom1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_mom2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_mom3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_pro1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_pro2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_pro3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_pro4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_pro5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_pro6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_pro7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_pro8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_prof9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missie3_thumbs2_db extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_mission3_mother_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mom_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_newtilesheet_complete_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_new_tilesheet_complete_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npccharactertilesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_push1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_resetbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_speechbubble_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_1startingscreeeeeeen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_introscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_pat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_prof_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_startbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_tec_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_victory_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_story_xbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_swag_kid_walk_kopie_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_swagkidmission1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_teacher_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_teacher1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tec_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilesheet_complete_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilesheet_complete2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilesheet_complete3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tmblr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_select_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_townmusic_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_playtest_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_tut1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_tut2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_tut3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_tut4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_tut5_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_tut6_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_tut7_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromusic_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_knightmare_knightmare1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_knightmare_luuk1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind1_kind1_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind1_kind1_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof1_4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof2_4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof3_4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind2_kind2_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind2_kind2_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof1_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof2_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof3_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_kind3_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_kind3_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_kind3_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof1_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof2_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof3_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof4_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_prof4_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_teacher_prof1_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_teacher_prof2_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_teacher_prof3_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_teacher_teacher1_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_teacher_teacher1_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_teacher_teacher1_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_teacher_teacher1_4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_teacher_teacher1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_dad1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_dad2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_dad3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_kid1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_kid2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_kid3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_prof1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_prof2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_prof3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_prof4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_prof5_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_judge1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_judge2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_10_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_11_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_12_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_13_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_14_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_15_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_3_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_5_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_5_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_6_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_7_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_8_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie3_missie3_9_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_chase_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_haahn_s_dutch_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_introstuk_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_kjrwhouse_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_knightmare_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_puzzle_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_startscreen_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_townsong_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_outrovoice_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5

















































































































































































































#else



#if (windows || mac || linux)


@:file("assets/data/Final Maps/NightmareMap.oel") #if display private #end class __ASSET__assets_data_final_maps_nightmaremap_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/puzzle1.oel") #if display private #end class __ASSET__assets_data_final_maps_puzzle1_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/puzzle2-1-1.oel") #if display private #end class __ASSET__assets_data_final_maps_puzzle2_1_1_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/puzzle2-1.oel") #if display private #end class __ASSET__assets_data_final_maps_puzzle2_1_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/puzzle2-2.oel") #if display private #end class __ASSET__assets_data_final_maps_puzzle2_2_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/puzzle2-3.oel") #if display private #end class __ASSET__assets_data_final_maps_puzzle2_3_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/puzzle3.oel") #if display private #end class __ASSET__assets_data_final_maps_puzzle3_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/traininglevel1.oel") #if display private #end class __ASSET__assets_data_final_maps_traininglevel1_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/traininglevel2.oel") #if display private #end class __ASSET__assets_data_final_maps_traininglevel2_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/traininglevel3.oel") #if display private #end class __ASSET__assets_data_final_maps_traininglevel3_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/worldmap1.oel") #if display private #end class __ASSET__assets_data_final_maps_worldmap1_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/worldmap2.oel") #if display private #end class __ASSET__assets_data_final_maps_worldmap2_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/worldmap3.oel") #if display private #end class __ASSET__assets_data_final_maps_worldmap3_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/worldmap4.oel") #if display private #end class __ASSET__assets_data_final_maps_worldmap4_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/worldmap5.oel") #if display private #end class __ASSET__assets_data_final_maps_worldmap5_oel extends lime.utils.ByteArray {}
@:file("assets/data/Final Maps/worldmap6.oel") #if display private #end class __ASSET__assets_data_final_maps_worldmap6_oel extends lime.utils.ByteArray {}
@:file("assets/data/reachtshelden.oep") #if display private #end class __ASSET__assets_data_reachtshelden_oep extends lime.utils.ByteArray {}
@:image("assets/images/AngryDadMission2.png") #if display private #end class __ASSET__assets_images_angrydadmission2_png extends lime.graphics.Image {}
@:image("assets/images/AttackCircle128x64.png") #if display private #end class __ASSET__assets_images_attackcircle128x64_png extends lime.graphics.Image {}
@:image("assets/images/Bald-Mission1.png") #if display private #end class __ASSET__assets_images_bald_mission1_png extends lime.graphics.Image {}
@:image("assets/images/BaldMission1.png") #if display private #end class __ASSET__assets_images_baldmission1_png extends lime.graphics.Image {}
@:image("assets/images/BeachBall-Mission3.png") #if display private #end class __ASSET__assets_images_beachball_mission3_png extends lime.graphics.Image {}
@:image("assets/images/CharacterTilesheet768x768.png") #if display private #end class __ASSET__assets_images_charactertilesheet768x768_png extends lime.graphics.Image {}
@:image("assets/images/DodgeBall-Mission-3.png") #if display private #end class __ASSET__assets_images_dodgeball_mission_3_png extends lime.graphics.Image {}
@:image("assets/images/Emo-Kid-Mission2 (1).png") #if display private #end class __ASSET__assets_images_emo_kid_mission2__1__png extends lime.graphics.Image {}
@:image("assets/images/Emo-Kid-Mission3).png") #if display private #end class __ASSET__assets_images_emo_kid_mission3__png extends lime.graphics.Image {}
@:image("assets/images/Football-Mission-3.png") #if display private #end class __ASSET__assets_images_football_mission_3_png extends lime.graphics.Image {}
@:image("assets/images/Furniture.png") #if display private #end class __ASSET__assets_images_furniture_png extends lime.graphics.Image {}
@:image("assets/images/Girl-Mission1.png") #if display private #end class __ASSET__assets_images_girl_mission1_png extends lime.graphics.Image {}
@:image("assets/images/girlMission1.png") #if display private #end class __ASSET__assets_images_girlmission1_png extends lime.graphics.Image {}
@:image("assets/images/health.png") #if display private #end class __ASSET__assets_images_health_png extends lime.graphics.Image {}
@:image("assets/images/ion.png") #if display private #end class __ASSET__assets_images_ion_png extends lime.graphics.Image {}
@:image("assets/images/ion2.png") #if display private #end class __ASSET__assets_images_ion2_png extends lime.graphics.Image {}
@:image("assets/images/Judge-Mission-3.png") #if display private #end class __ASSET__assets_images_judge_mission_3_png extends lime.graphics.Image {}
@:image("assets/images/kind1.1.png") #if display private #end class __ASSET__assets_images_kind1_1_png extends lime.graphics.Image {}
@:image("assets/images/kind1.2.png") #if display private #end class __ASSET__assets_images_kind1_2_png extends lime.graphics.Image {}
@:image("assets/images/kind1.3.png") #if display private #end class __ASSET__assets_images_kind1_3_png extends lime.graphics.Image {}
@:image("assets/images/kind1.4.png") #if display private #end class __ASSET__assets_images_kind1_4_png extends lime.graphics.Image {}
@:image("assets/images/kind1.5.png") #if display private #end class __ASSET__assets_images_kind1_5_png extends lime.graphics.Image {}
@:image("assets/images/kind2.1.png") #if display private #end class __ASSET__assets_images_kind2_1_png extends lime.graphics.Image {}
@:image("assets/images/kind2.2.png") #if display private #end class __ASSET__assets_images_kind2_2_png extends lime.graphics.Image {}
@:image("assets/images/kind2.3.png") #if display private #end class __ASSET__assets_images_kind2_3_png extends lime.graphics.Image {}
@:image("assets/images/kind2.4.png") #if display private #end class __ASSET__assets_images_kind2_4_png extends lime.graphics.Image {}
@:image("assets/images/kind2.5.png") #if display private #end class __ASSET__assets_images_kind2_5_png extends lime.graphics.Image {}
@:image("assets/images/kind3.1.png") #if display private #end class __ASSET__assets_images_kind3_1_png extends lime.graphics.Image {}
@:image("assets/images/kind3.2.png") #if display private #end class __ASSET__assets_images_kind3_2_png extends lime.graphics.Image {}
@:image("assets/images/kind3.3.png") #if display private #end class __ASSET__assets_images_kind3_3_png extends lime.graphics.Image {}
@:image("assets/images/kind3.4.png") #if display private #end class __ASSET__assets_images_kind3_4_png extends lime.graphics.Image {}
@:image("assets/images/kind3.5.png") #if display private #end class __ASSET__assets_images_kind3_5_png extends lime.graphics.Image {}
@:image("assets/images/kind3.6.png") #if display private #end class __ASSET__assets_images_kind3_6_png extends lime.graphics.Image {}
@:image("assets/images/kind3.7.png") #if display private #end class __ASSET__assets_images_kind3_7_png extends lime.graphics.Image {}
@:image("assets/images/KJRW-Tutotial-3.png") #if display private #end class __ASSET__assets_images_kjrw_tutotial_3_png extends lime.graphics.Image {}
@:image("assets/images/Knightmare Fight/Text1.png") #if display private #end class __ASSET__assets_images_knightmare_fight_text1_png extends lime.graphics.Image {}
@:image("assets/images/Knightmare Fight/Text2.png") #if display private #end class __ASSET__assets_images_knightmare_fight_text2_png extends lime.graphics.Image {}
@:image("assets/images/KnightmareCompleteTilesheet.png") #if display private #end class __ASSET__assets_images_knightmarecompletetilesheet_png extends lime.graphics.Image {}
@:image("assets/images/Knightmare_Tilesheet_Complete.png") #if display private #end class __ASSET__assets_images_knightmare_tilesheet_complete_png extends lime.graphics.Image {}
@:image("assets/images/KRJW-Tutorial.png") #if display private #end class __ASSET__assets_images_krjw_tutorial_png extends lime.graphics.Image {}
@:image("assets/images/Missie1/intromissie1/prof0.png") #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof0_png extends lime.graphics.Image {}
@:image("assets/images/Missie1/intromissie1/prof1.png") #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof1_png extends lime.graphics.Image {}
@:image("assets/images/Missie1/intromissie1/prof2.png") #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof2_png extends lime.graphics.Image {}
@:image("assets/images/Missie1/intromissie1/prof3.png") #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof3_png extends lime.graphics.Image {}
@:image("assets/images/Missie1/intromissie1/prof4.png") #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof4_png extends lime.graphics.Image {}
@:image("assets/images/Missie1/intromissie1/prof5.png") #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof5_png extends lime.graphics.Image {}
@:image("assets/images/Missie1/intromissie1/prof6.png") #if display private #end class __ASSET__assets_images_missie1_intromissie1_prof6_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.1.png") #if display private #end class __ASSET__assets_images_missie2_emo1_1_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.10.png") #if display private #end class __ASSET__assets_images_missie2_emo1_10_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.11.png") #if display private #end class __ASSET__assets_images_missie2_emo1_11_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.2.png") #if display private #end class __ASSET__assets_images_missie2_emo1_2_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.3.png") #if display private #end class __ASSET__assets_images_missie2_emo1_3_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.4.png") #if display private #end class __ASSET__assets_images_missie2_emo1_4_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.5.png") #if display private #end class __ASSET__assets_images_missie2_emo1_5_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.6.png") #if display private #end class __ASSET__assets_images_missie2_emo1_6_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.7.png") #if display private #end class __ASSET__assets_images_missie2_emo1_7_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.8.png") #if display private #end class __ASSET__assets_images_missie2_emo1_8_png extends lime.graphics.Image {}
@:image("assets/images/Missie2/emo1.9.png") #if display private #end class __ASSET__assets_images_missie2_emo1_9_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Feggit1.png") #if display private #end class __ASSET__assets_images_missie3_feggit1_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Feggit2.png") #if display private #end class __ASSET__assets_images_missie3_feggit2_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Feggit3.png") #if display private #end class __ASSET__assets_images_missie3_feggit3_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Feggit4.png") #if display private #end class __ASSET__assets_images_missie3_feggit4_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Feggit5.png") #if display private #end class __ASSET__assets_images_missie3_feggit5_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Judge1.png") #if display private #end class __ASSET__assets_images_missie3_judge1_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Judge2.png") #if display private #end class __ASSET__assets_images_missie3_judge2_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Mom1.png") #if display private #end class __ASSET__assets_images_missie3_mom1_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Mom2.png") #if display private #end class __ASSET__assets_images_missie3_mom2_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Mom3.png") #if display private #end class __ASSET__assets_images_missie3_mom3_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Pro1.png") #if display private #end class __ASSET__assets_images_missie3_pro1_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Pro2.png") #if display private #end class __ASSET__assets_images_missie3_pro2_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Pro3.png") #if display private #end class __ASSET__assets_images_missie3_pro3_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Pro4.png") #if display private #end class __ASSET__assets_images_missie3_pro4_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Pro5.png") #if display private #end class __ASSET__assets_images_missie3_pro5_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Pro6.png") #if display private #end class __ASSET__assets_images_missie3_pro6_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Pro7.png") #if display private #end class __ASSET__assets_images_missie3_pro7_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Pro8.png") #if display private #end class __ASSET__assets_images_missie3_pro8_png extends lime.graphics.Image {}
@:image("assets/images/Missie3/Prof9.png") #if display private #end class __ASSET__assets_images_missie3_prof9_png extends lime.graphics.Image {}
@:file("assets/images/Missie3/Thumbs2.db") #if display private #end class __ASSET__assets_images_missie3_thumbs2_db extends lime.utils.ByteArray {}
@:image("assets/images/Mission3-Mother.png") #if display private #end class __ASSET__assets_images_mission3_mother_png extends lime.graphics.Image {}
@:image("assets/images/Mom.png") #if display private #end class __ASSET__assets_images_mom_png extends lime.graphics.Image {}
@:image("assets/images/NEWTilesheet_Complete.png") #if display private #end class __ASSET__assets_images_newtilesheet_complete_png extends lime.graphics.Image {}
@:image("assets/images/NEW_Tilesheet_Complete.png") #if display private #end class __ASSET__assets_images_new_tilesheet_complete_png extends lime.graphics.Image {}
@:image("assets/images/NPCCharacterTilesheet.png") #if display private #end class __ASSET__assets_images_npccharactertilesheet_png extends lime.graphics.Image {}
@:image("assets/images/pat.png") #if display private #end class __ASSET__assets_images_pat_png extends lime.graphics.Image {}
@:image("assets/images/Push1.png") #if display private #end class __ASSET__assets_images_push1_png extends lime.graphics.Image {}
@:image("assets/images/resetbutton.png") #if display private #end class __ASSET__assets_images_resetbutton_png extends lime.graphics.Image {}
@:image("assets/images/Speechbubble.png") #if display private #end class __ASSET__assets_images_speechbubble_png extends lime.graphics.Image {}
@:image("assets/images/Story/1.png") #if display private #end class __ASSET__assets_images_story_1_png extends lime.graphics.Image {}
@:image("assets/images/Story/1StartingScreeeeeeen.png") #if display private #end class __ASSET__assets_images_story_1startingscreeeeeeen_png extends lime.graphics.Image {}
@:image("assets/images/Story/2.png") #if display private #end class __ASSET__assets_images_story_2_png extends lime.graphics.Image {}
@:image("assets/images/Story/3.png") #if display private #end class __ASSET__assets_images_story_3_png extends lime.graphics.Image {}
@:image("assets/images/Story/4.png") #if display private #end class __ASSET__assets_images_story_4_png extends lime.graphics.Image {}
@:image("assets/images/Story/Introscreen.png") #if display private #end class __ASSET__assets_images_story_introscreen_png extends lime.graphics.Image {}
@:image("assets/images/Story/Pat.png") #if display private #end class __ASSET__assets_images_story_pat_png extends lime.graphics.Image {}
@:image("assets/images/Story/Prof.png") #if display private #end class __ASSET__assets_images_story_prof_png extends lime.graphics.Image {}
@:image("assets/images/Story/startbutton.png") #if display private #end class __ASSET__assets_images_story_startbutton_png extends lime.graphics.Image {}
@:image("assets/images/Story/Tec.png") #if display private #end class __ASSET__assets_images_story_tec_png extends lime.graphics.Image {}
@:image("assets/images/Story/Victory.png") #if display private #end class __ASSET__assets_images_story_victory_png extends lime.graphics.Image {}
@:image("assets/images/Story/xbutton.png") #if display private #end class __ASSET__assets_images_story_xbutton_png extends lime.graphics.Image {}
@:image("assets/images/SWAG-Kid-Walk-Kopie.png") #if display private #end class __ASSET__assets_images_swag_kid_walk_kopie_png extends lime.graphics.Image {}
@:image("assets/images/SwagKidMission1.png") #if display private #end class __ASSET__assets_images_swagkidmission1_png extends lime.graphics.Image {}
@:image("assets/images/Teacher.png") #if display private #end class __ASSET__assets_images_teacher_png extends lime.graphics.Image {}
@:image("assets/images/teacher1.png") #if display private #end class __ASSET__assets_images_teacher1_png extends lime.graphics.Image {}
@:image("assets/images/tec.png") #if display private #end class __ASSET__assets_images_tec_png extends lime.graphics.Image {}
@:image("assets/images/Tilesheet_Complete.png") #if display private #end class __ASSET__assets_images_tilesheet_complete_png extends lime.graphics.Image {}
@:image("assets/images/Tilesheet_Complete2.png") #if display private #end class __ASSET__assets_images_tilesheet_complete2_png extends lime.graphics.Image {}
@:image("assets/images/Tilesheet_Complete3.png") #if display private #end class __ASSET__assets_images_tilesheet_complete3_png extends lime.graphics.Image {}
@:image("assets/images/Tmblr.png") #if display private #end class __ASSET__assets_images_tmblr_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/music/select.wav") #if display private #end class __ASSET__assets_music_select_wav extends lime.utils.ByteArray {}
@:file("assets/music/townMusic.wav") #if display private #end class __ASSET__assets_music_townmusic_wav extends lime.utils.ByteArray {}
@:file("assets/Playtest.txt") #if display private #end class __ASSET__assets_playtest_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/Tut1.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_tut1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/Tut2.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_tut2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/Tut3.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_tut3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/Tut4.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_tut4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/Tut5.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_tut5_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/Tut6.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_tut6_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/Tut7.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_tut7_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Intromusic.mp3") #if display private #end class __ASSET__assets_sounds_intromusic_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Knightmare/Knightmare1.mp3") #if display private #end class __ASSET__assets_sounds_knightmare_knightmare1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Knightmare/Luuk1.mp3") #if display private #end class __ASSET__assets_sounds_knightmare_luuk1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind1/Kind1-1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind1_kind1_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind1/Kind1-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind1_kind1_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind1/Prof1-4.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof1_4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind1/Prof2-4.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof2_4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind1/Prof3-4.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof3_4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind2/Kind2-1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind2_kind2_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind2/Kind2-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind2_kind2_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind2/Prof1-1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof1_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind2/Prof2-1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof2_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind2/Prof3-1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof3_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Kind3-1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_kind3_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Kind3-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_kind3_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Kind3-3.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_kind3_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Prof1-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof1_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Prof2-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof2_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Prof3-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof3_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Prof4-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof4_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Prof4-3.mp3") #if display private #end class __ASSET__assets_sounds_missie1_prof4_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Teacher/Prof1-3.mp3") #if display private #end class __ASSET__assets_sounds_missie1_teacher_prof1_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Teacher/Prof2-3.mp3") #if display private #end class __ASSET__assets_sounds_missie1_teacher_prof2_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Teacher/Prof3-3.mp3") #if display private #end class __ASSET__assets_sounds_missie1_teacher_prof3_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Teacher/Teacher1-1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_teacher_teacher1_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Teacher/Teacher1-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_teacher_teacher1_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Teacher/Teacher1-3.mp3") #if display private #end class __ASSET__assets_sounds_missie1_teacher_teacher1_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Teacher/Teacher1-4.mp3") #if display private #end class __ASSET__assets_sounds_missie1_teacher_teacher1_4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Teacher/Teacher1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_teacher_teacher1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Dad1.mp3") #if display private #end class __ASSET__assets_sounds_missie2_dad1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Dad2.mp3") #if display private #end class __ASSET__assets_sounds_missie2_dad2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Dad3.mp3") #if display private #end class __ASSET__assets_sounds_missie2_dad3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Kid1.mp3") #if display private #end class __ASSET__assets_sounds_missie2_kid1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Kid2.mp3") #if display private #end class __ASSET__assets_sounds_missie2_kid2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Kid3.mp3") #if display private #end class __ASSET__assets_sounds_missie2_kid3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Prof1.mp3") #if display private #end class __ASSET__assets_sounds_missie2_prof1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Prof2.mp3") #if display private #end class __ASSET__assets_sounds_missie2_prof2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Prof3.mp3") #if display private #end class __ASSET__assets_sounds_missie2_prof3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Prof4.mp3") #if display private #end class __ASSET__assets_sounds_missie2_prof4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Prof5.mp3") #if display private #end class __ASSET__assets_sounds_missie2_prof5_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/judge1.mp3") #if display private #end class __ASSET__assets_sounds_missie3_judge1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/judge2.mp3") #if display private #end class __ASSET__assets_sounds_missie3_judge2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-1.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-10.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_10_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/missie3-11.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_11_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-12.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_12_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/missie3-13.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_13_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-14.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_14_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-15.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_15_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-2.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-3.1.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_3_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-3.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-4.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-5-1.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_5_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-5.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_5_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-6.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_6_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-7.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_7_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-8.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_8_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie3/Missie3-9.mp3") #if display private #end class __ASSET__assets_sounds_missie3_missie3_9_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Chase.mp3") #if display private #end class __ASSET__assets_sounds_music_chase_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Haahn's Dutch.wav") #if display private #end class __ASSET__assets_sounds_music_haahn_s_dutch_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/introstuk.mp3") #if display private #end class __ASSET__assets_sounds_music_introstuk_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/KJRWHouse.wav") #if display private #end class __ASSET__assets_sounds_music_kjrwhouse_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Knightmare.mp3") #if display private #end class __ASSET__assets_sounds_music_knightmare_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Puzzle.mp3") #if display private #end class __ASSET__assets_sounds_music_puzzle_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Startscreen.mp3") #if display private #end class __ASSET__assets_sounds_music_startscreen_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Townsong.mp3") #if display private #end class __ASSET__assets_sounds_music_townsong_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/OutroVoice.mp3") #if display private #end class __ASSET__assets_sounds_outrovoice_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,8/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,8/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}



#end

#if openfl

#end

#end
#end

