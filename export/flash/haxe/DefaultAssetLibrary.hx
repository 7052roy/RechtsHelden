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
		
		className.set ("assets/data/BaseMap.oel", __ASSET__assets_data_basemap_oel);
		type.set ("assets/data/BaseMap.oel", AssetType.TEXT);
		className.set ("assets/data/basemap1.oel", __ASSET__assets_data_basemap1_oel);
		type.set ("assets/data/basemap1.oel", AssetType.TEXT);
		className.set ("assets/data/basemap2.oel", __ASSET__assets_data_basemap2_oel);
		type.set ("assets/data/basemap2.oel", AssetType.TEXT);
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/level_1.oel", __ASSET__assets_data_level_1_oel);
		type.set ("assets/data/level_1.oel", AssetType.TEXT);
		className.set ("assets/data/level_2.oel", __ASSET__assets_data_level_2_oel);
		type.set ("assets/data/level_2.oel", AssetType.TEXT);
		className.set ("assets/data/level_3.oel", __ASSET__assets_data_level_3_oel);
		type.set ("assets/data/level_3.oel", AssetType.TEXT);
		className.set ("assets/data/level_4.oel", __ASSET__assets_data_level_4_oel);
		type.set ("assets/data/level_4.oel", AssetType.TEXT);
		className.set ("assets/data/Mission1.oel", __ASSET__assets_data_mission1_oel);
		type.set ("assets/data/Mission1.oel", AssetType.TEXT);
		className.set ("assets/data/Mission1_0.oel", __ASSET__assets_data_mission1_0_oel);
		type.set ("assets/data/Mission1_0.oel", AssetType.TEXT);
		className.set ("assets/data/Mission1_1.oel", __ASSET__assets_data_mission1_1_oel);
		type.set ("assets/data/Mission1_1.oel", AssetType.TEXT);
		className.set ("assets/data/reachtshelden.oep", __ASSET__assets_data_reachtshelden_oep);
		type.set ("assets/data/reachtshelden.oep", AssetType.TEXT);
		className.set ("assets/data/room-001.oel", __ASSET__assets_data_room_001_oel);
		type.set ("assets/data/room-001.oel", AssetType.TEXT);
		className.set ("assets/images/AngryDad.png", __ASSET__assets_images_angrydad_png);
		type.set ("assets/images/AngryDad.png", AssetType.IMAGE);
		className.set ("assets/images/BaldMission1.png", __ASSET__assets_images_baldmission1_png);
		type.set ("assets/images/BaldMission1.png", AssetType.IMAGE);
		className.set ("assets/images/button.png", __ASSET__assets_images_button_png);
		type.set ("assets/images/button.png", AssetType.IMAGE);
		className.set ("assets/images/CharacterTilesheet768x768.png", __ASSET__assets_images_charactertilesheet768x768_png);
		type.set ("assets/images/CharacterTilesheet768x768.png", AssetType.IMAGE);
		className.set ("assets/images/coin.png", __ASSET__assets_images_coin_png);
		type.set ("assets/images/coin.png", AssetType.IMAGE);
		className.set ("assets/images/CollectingSpirit Kopie.png", __ASSET__assets_images_collectingspirit_kopie_png);
		type.set ("assets/images/CollectingSpirit Kopie.png", AssetType.IMAGE);
		className.set ("assets/images/enemy-0.png", __ASSET__assets_images_enemy_0_png);
		type.set ("assets/images/enemy-0.png", AssetType.IMAGE);
		className.set ("assets/images/enemy-1.png", __ASSET__assets_images_enemy_1_png);
		type.set ("assets/images/enemy-1.png", AssetType.IMAGE);
		className.set ("assets/images/enemy-2.png", __ASSET__assets_images_enemy_2_png);
		type.set ("assets/images/enemy-2.png", AssetType.IMAGE);
		className.set ("assets/images/Furniture.png", __ASSET__assets_images_furniture_png);
		type.set ("assets/images/Furniture.png", AssetType.IMAGE);
		className.set ("assets/images/girlMission1.png", __ASSET__assets_images_girlmission1_png);
		type.set ("assets/images/girlMission1.png", AssetType.IMAGE);
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/ion.png", __ASSET__assets_images_ion_png);
		type.set ("assets/images/ion.png", AssetType.IMAGE);
		className.set ("assets/images/Mission1Girl.png", __ASSET__assets_images_mission1girl_png);
		type.set ("assets/images/Mission1Girl.png", AssetType.IMAGE);
		className.set ("assets/images/Mission2Football.png", __ASSET__assets_images_mission2football_png);
		type.set ("assets/images/Mission2Football.png", AssetType.IMAGE);
		className.set ("assets/images/Mission3Emokid.png", __ASSET__assets_images_mission3emokid_png);
		type.set ("assets/images/Mission3Emokid.png", AssetType.IMAGE);
		className.set ("assets/images/NPCCharacterTilesheet.png", __ASSET__assets_images_npccharactertilesheet_png);
		type.set ("assets/images/NPCCharacterTilesheet.png", AssetType.IMAGE);
		className.set ("assets/images/pat.png", __ASSET__assets_images_pat_png);
		type.set ("assets/images/pat.png", AssetType.IMAGE);
		className.set ("assets/images/player.png", __ASSET__assets_images_player_png);
		type.set ("assets/images/player.png", AssetType.IMAGE);
		className.set ("assets/images/pointer.png", __ASSET__assets_images_pointer_png);
		type.set ("assets/images/pointer.png", AssetType.IMAGE);
		className.set ("assets/images/SChool modified.png", __ASSET__assets_images_school_modified_png);
		type.set ("assets/images/SChool modified.png", AssetType.IMAGE);
		className.set ("assets/images/street.PNG", __ASSET__assets_images_street_png);
		type.set ("assets/images/street.PNG", AssetType.IMAGE);
		className.set ("assets/images/SWAG-Kid-Walk-Kopie.png", __ASSET__assets_images_swag_kid_walk_kopie_png);
		type.set ("assets/images/SWAG-Kid-Walk-Kopie.png", AssetType.IMAGE);
		className.set ("assets/images/tec.png", __ASSET__assets_images_tec_png);
		type.set ("assets/images/tec.png", AssetType.IMAGE);
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		className.set ("assets/images/Tilesheet_Complete.png", __ASSET__assets_images_tilesheet_complete_png);
		type.set ("assets/images/Tilesheet_Complete.png", AssetType.IMAGE);
		className.set ("assets/images/Tilesheet_Complete.psd", __ASSET__assets_images_tilesheet_complete_psd);
		type.set ("assets/images/Tilesheet_Complete.psd", AssetType.BINARY);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/music/select.wav", __ASSET__assets_music_select_wav);
		type.set ("assets/music/select.wav", AssetType.SOUND);
		className.set ("assets/music/townMusic.wav", __ASSET__assets_music_townmusic_wav);
		type.set ("assets/music/townMusic.wav", AssetType.SOUND);
		className.set ("assets/sounds/Abilities/Heal.mp3", __ASSET__assets_sounds_abilities_heal_mp3);
		type.set ("assets/sounds/Abilities/Heal.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/Heal1.mp3", __ASSET__assets_sounds_abilities_heal1_mp3);
		type.set ("assets/sounds/Abilities/Heal1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/PatIndoor.mp3", __ASSET__assets_sounds_abilities_patindoor_mp3);
		type.set ("assets/sounds/Abilities/PatIndoor.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/PatIndoor2.mp3", __ASSET__assets_sounds_abilities_patindoor2_mp3);
		type.set ("assets/sounds/Abilities/PatIndoor2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/PatKnigthmare.mp3", __ASSET__assets_sounds_abilities_patknigthmare_mp3);
		type.set ("assets/sounds/Abilities/PatKnigthmare.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/PatKnigthmare1.mp3", __ASSET__assets_sounds_abilities_patknigthmare1_mp3);
		type.set ("assets/sounds/Abilities/PatKnigthmare1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/PatOutdoor.mp3", __ASSET__assets_sounds_abilities_patoutdoor_mp3);
		type.set ("assets/sounds/Abilities/PatOutdoor.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/PatOutdoor1.mp3", __ASSET__assets_sounds_abilities_patoutdoor1_mp3);
		type.set ("assets/sounds/Abilities/PatOutdoor1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/Shield.mp3", __ASSET__assets_sounds_abilities_shield_mp3);
		type.set ("assets/sounds/Abilities/Shield.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/Shield1.mp3", __ASSET__assets_sounds_abilities_shield1_mp3);
		type.set ("assets/sounds/Abilities/Shield1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/Source/1.mp3", __ASSET__assets_sounds_abilities_source_1_mp3);
		type.set ("assets/sounds/Abilities/Source/1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/Source/2.mp3", __ASSET__assets_sounds_abilities_source_2_mp3);
		type.set ("assets/sounds/Abilities/Source/2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/Source/3.mp3", __ASSET__assets_sounds_abilities_source_3_mp3);
		type.set ("assets/sounds/Abilities/Source/3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Abilities/Source/Heal.wav", __ASSET__assets_sounds_abilities_source_heal_wav);
		type.set ("assets/sounds/Abilities/Source/Heal.wav", AssetType.SOUND);
		className.set ("assets/sounds/Abilities/Source/Heal1.wav", __ASSET__assets_sounds_abilities_source_heal1_wav);
		type.set ("assets/sounds/Abilities/Source/Heal1.wav", AssetType.SOUND);
		className.set ("assets/sounds/Abilities/Source/Hit_Hurt18.wav", __ASSET__assets_sounds_abilities_source_hit_hurt18_wav);
		type.set ("assets/sounds/Abilities/Source/Hit_Hurt18.wav", AssetType.SOUND);
		className.set ("assets/sounds/Abilities/Source/Hit_Hurt32.wav", __ASSET__assets_sounds_abilities_source_hit_hurt32_wav);
		type.set ("assets/sounds/Abilities/Source/Hit_Hurt32.wav", AssetType.SOUND);
		className.set ("assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav", __ASSET__assets_sounds_abilities_source_judge_o_metercoin_wav);
		type.set ("assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav", AssetType.SOUND);
		className.set ("assets/sounds/Abilities/Source/Push.wav", __ASSET__assets_sounds_abilities_source_push_wav);
		type.set ("assets/sounds/Abilities/Source/Push.wav", AssetType.SOUND);
		className.set ("assets/sounds/Abilities/Source/Push1.wav", __ASSET__assets_sounds_abilities_source_push1_wav);
		type.set ("assets/sounds/Abilities/Source/Push1.wav", AssetType.SOUND);
		className.set ("assets/sounds/Abilities/Source/Shield1.wav", __ASSET__assets_sounds_abilities_source_shield1_wav);
		type.set ("assets/sounds/Abilities/Source/Shield1.wav", AssetType.SOUND);
		className.set ("assets/sounds/Game/JUDGE-O-METERCOIN.mp3", __ASSET__assets_sounds_game_judge_o_metercoin_mp3);
		type.set ("assets/sounds/Game/JUDGE-O-METERCOIN.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Game/select-1.wav", __ASSET__assets_sounds_game_select_1_wav);
		type.set ("assets/sounds/Game/select-1.wav", AssetType.SOUND);
		className.set ("assets/sounds/Gesprek1.wav", __ASSET__assets_sounds_gesprek1_wav);
		type.set ("assets/sounds/Gesprek1.wav", AssetType.SOUND);
		className.set ("assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3", __ASSET__assets_sounds_intromissie_1intropijltjestoetsen_mp3);
		type.set ("assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/2GoedGedaan.mp3", __ASSET__assets_sounds_intromissie_2goedgedaan_mp3);
		type.set ("assets/sounds/IntroMissie/2GoedGedaan.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/3PatInstructie.mp3", __ASSET__assets_sounds_intromissie_3patinstructie_mp3);
		type.set ("assets/sounds/IntroMissie/3PatInstructie.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/4TecInstructie1.mp3", __ASSET__assets_sounds_intromissie_4tecinstructie1_mp3);
		type.set ("assets/sounds/IntroMissie/4TecInstructie1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/5TecInstructie2.mp3", __ASSET__assets_sounds_intromissie_5tecinstructie2_mp3);
		type.set ("assets/sounds/IntroMissie/5TecInstructie2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/6ProfInstructie.mp3", __ASSET__assets_sounds_intromissie_6profinstructie_mp3);
		type.set ("assets/sounds/IntroMissie/6ProfInstructie.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroMissie/7IntroOutro.mp3", __ASSET__assets_sounds_intromissie_7introoutro_mp3);
		type.set ("assets/sounds/IntroMissie/7IntroOutro.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/IntroVoice.mp3", __ASSET__assets_sounds_introvoice_mp3);
		type.set ("assets/sounds/IntroVoice.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Gesprek1.mp3", __ASSET__assets_sounds_missie1_gesprek1_mp3);
		type.set ("assets/sounds/Missie1/Gesprek1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof1_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof2_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof3_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof1_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof2_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof3_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", AssetType.MUSIC);
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
		className.set ("assets/sounds/Missie1/Test/Prof1-3.mp3", __ASSET__assets_sounds_missie1_test_prof1_3_mp3);
		type.set ("assets/sounds/Missie1/Test/Prof1-3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Test/Prof2-3.mp3", __ASSET__assets_sounds_missie1_test_prof2_3_mp3);
		type.set ("assets/sounds/Missie1/Test/Prof2-3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Test/Prof3-3.mp3", __ASSET__assets_sounds_missie1_test_prof3_3_mp3);
		type.set ("assets/sounds/Missie1/Test/Prof3-3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Test/Teacher1.mp3", __ASSET__assets_sounds_missie1_test_teacher1_mp3);
		type.set ("assets/sounds/Missie1/Test/Teacher1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie1/Test/Teacher2.mp3", __ASSET__assets_sounds_missie1_test_teacher2_mp3);
		type.set ("assets/sounds/Missie1/Test/Teacher2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Dad1.mp3", __ASSET__assets_sounds_missie2_dad1_mp3);
		type.set ("assets/sounds/Missie2/Dad1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Dad2.mp3", __ASSET__assets_sounds_missie2_dad2_mp3);
		type.set ("assets/sounds/Missie2/Dad2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Missie2/Dad3.mp3", __ASSET__assets_sounds_missie2_dad3_mp3);
		type.set ("assets/sounds/Missie2/Dad3.mp3", AssetType.MUSIC);
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
		className.set ("assets/sounds/Music/Chase.mp3", __ASSET__assets_sounds_music_chase_mp3);
		type.set ("assets/sounds/Music/Chase.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Music/Haahn's Dutch.wav", __ASSET__assets_sounds_music_haahn_s_dutch_wav);
		type.set ("assets/sounds/Music/Haahn's Dutch.wav", AssetType.SOUND);
		className.set ("assets/sounds/Music/Lab Junk.wav", __ASSET__assets_sounds_music_lab_junk_wav);
		type.set ("assets/sounds/Music/Lab Junk.wav", AssetType.SOUND);
		className.set ("assets/sounds/Music/Puzzle.mp3", __ASSET__assets_sounds_music_puzzle_mp3);
		type.set ("assets/sounds/Music/Puzzle.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Music/Townsong.mp3", __ASSET__assets_sounds_music_townsong_mp3);
		type.set ("assets/sounds/Music/Townsong.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/Tjalle/Back.png", __ASSET__assets_sounds_tjalle_back_png);
		type.set ("assets/sounds/Tjalle/Back.png", AssetType.IMAGE);
		className.set ("assets/sounds/Tjalle/Grass Flower 64x64.png", __ASSET__assets_sounds_tjalle_grass_flower_64x64_png);
		type.set ("assets/sounds/Tjalle/Grass Flower 64x64.png", AssetType.IMAGE);
		className.set ("assets/sounds/Tjalle/NewRoadTiles.png", __ASSET__assets_sounds_tjalle_newroadtiles_png);
		type.set ("assets/sounds/Tjalle/NewRoadTiles.png", AssetType.IMAGE);
		className.set ("assets/sounds/Tjalle/Police.png", __ASSET__assets_sounds_tjalle_police_png);
		type.set ("assets/sounds/Tjalle/Police.png", AssetType.IMAGE);
		className.set ("assets/sounds/Tjalle/Schooltile.png", __ASSET__assets_sounds_tjalle_schooltile_png);
		type.set ("assets/sounds/Tjalle/Schooltile.png", AssetType.IMAGE);
		className.set ("assets/sounds/Tjalle/Trashcan.png", __ASSET__assets_sounds_tjalle_trashcan_png);
		type.set ("assets/sounds/Tjalle/Trashcan.png", AssetType.IMAGE);
		className.set ("assets/sounds/Tjalle/Water.png", __ASSET__assets_sounds_tjalle_water_png);
		type.set ("assets/sounds/Tjalle/Water.png", AssetType.IMAGE);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
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
		id = "assets/images/AngryDad.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/BaldMission1.png";
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
		id = "assets/images/enemy-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Furniture.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/girlMission1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/health.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/ion.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission1Girl.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission2Football.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Mission3Emokid.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
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
		id = "assets/images/SChool modified.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/street.PNG";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SWAG-Kid-Walk-Kopie.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tec.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tilesheet_Complete.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Tilesheet_Complete.psd";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/select.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/townMusic.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
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
		id = "assets/sounds/Missie1/Gesprek1.mp3";
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
		id = "assets/sounds/Missie1/Test/Prof1-3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Test/Prof2-3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Test/Prof3-3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Test/Teacher1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Missie1/Test/Teacher2.mp3";
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
		
		className.set ("assets/data/BaseMap.oel", __ASSET__assets_data_basemap_oel);
		type.set ("assets/data/BaseMap.oel", AssetType.TEXT);
		
		className.set ("assets/data/basemap1.oel", __ASSET__assets_data_basemap1_oel);
		type.set ("assets/data/basemap1.oel", AssetType.TEXT);
		
		className.set ("assets/data/basemap2.oel", __ASSET__assets_data_basemap2_oel);
		type.set ("assets/data/basemap2.oel", AssetType.TEXT);
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/level_1.oel", __ASSET__assets_data_level_1_oel);
		type.set ("assets/data/level_1.oel", AssetType.TEXT);
		
		className.set ("assets/data/level_2.oel", __ASSET__assets_data_level_2_oel);
		type.set ("assets/data/level_2.oel", AssetType.TEXT);
		
		className.set ("assets/data/level_3.oel", __ASSET__assets_data_level_3_oel);
		type.set ("assets/data/level_3.oel", AssetType.TEXT);
		
		className.set ("assets/data/level_4.oel", __ASSET__assets_data_level_4_oel);
		type.set ("assets/data/level_4.oel", AssetType.TEXT);
		
		className.set ("assets/data/Mission1.oel", __ASSET__assets_data_mission1_oel);
		type.set ("assets/data/Mission1.oel", AssetType.TEXT);
		
		className.set ("assets/data/Mission1_0.oel", __ASSET__assets_data_mission1_0_oel);
		type.set ("assets/data/Mission1_0.oel", AssetType.TEXT);
		
		className.set ("assets/data/Mission1_1.oel", __ASSET__assets_data_mission1_1_oel);
		type.set ("assets/data/Mission1_1.oel", AssetType.TEXT);
		
		className.set ("assets/data/reachtshelden.oep", __ASSET__assets_data_reachtshelden_oep);
		type.set ("assets/data/reachtshelden.oep", AssetType.TEXT);
		
		className.set ("assets/data/room-001.oel", __ASSET__assets_data_room_001_oel);
		type.set ("assets/data/room-001.oel", AssetType.TEXT);
		
		className.set ("assets/images/AngryDad.png", __ASSET__assets_images_angrydad_png);
		type.set ("assets/images/AngryDad.png", AssetType.IMAGE);
		
		className.set ("assets/images/BaldMission1.png", __ASSET__assets_images_baldmission1_png);
		type.set ("assets/images/BaldMission1.png", AssetType.IMAGE);
		
		className.set ("assets/images/button.png", __ASSET__assets_images_button_png);
		type.set ("assets/images/button.png", AssetType.IMAGE);
		
		className.set ("assets/images/CharacterTilesheet768x768.png", __ASSET__assets_images_charactertilesheet768x768_png);
		type.set ("assets/images/CharacterTilesheet768x768.png", AssetType.IMAGE);
		
		className.set ("assets/images/coin.png", __ASSET__assets_images_coin_png);
		type.set ("assets/images/coin.png", AssetType.IMAGE);
		
		className.set ("assets/images/CollectingSpirit Kopie.png", __ASSET__assets_images_collectingspirit_kopie_png);
		type.set ("assets/images/CollectingSpirit Kopie.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemy-0.png", __ASSET__assets_images_enemy_0_png);
		type.set ("assets/images/enemy-0.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemy-1.png", __ASSET__assets_images_enemy_1_png);
		type.set ("assets/images/enemy-1.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemy-2.png", __ASSET__assets_images_enemy_2_png);
		type.set ("assets/images/enemy-2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Furniture.png", __ASSET__assets_images_furniture_png);
		type.set ("assets/images/Furniture.png", AssetType.IMAGE);
		
		className.set ("assets/images/girlMission1.png", __ASSET__assets_images_girlmission1_png);
		type.set ("assets/images/girlMission1.png", AssetType.IMAGE);
		
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/ion.png", __ASSET__assets_images_ion_png);
		type.set ("assets/images/ion.png", AssetType.IMAGE);
		
		className.set ("assets/images/Mission1Girl.png", __ASSET__assets_images_mission1girl_png);
		type.set ("assets/images/Mission1Girl.png", AssetType.IMAGE);
		
		className.set ("assets/images/Mission2Football.png", __ASSET__assets_images_mission2football_png);
		type.set ("assets/images/Mission2Football.png", AssetType.IMAGE);
		
		className.set ("assets/images/Mission3Emokid.png", __ASSET__assets_images_mission3emokid_png);
		type.set ("assets/images/Mission3Emokid.png", AssetType.IMAGE);
		
		className.set ("assets/images/NPCCharacterTilesheet.png", __ASSET__assets_images_npccharactertilesheet_png);
		type.set ("assets/images/NPCCharacterTilesheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/pat.png", __ASSET__assets_images_pat_png);
		type.set ("assets/images/pat.png", AssetType.IMAGE);
		
		className.set ("assets/images/player.png", __ASSET__assets_images_player_png);
		type.set ("assets/images/player.png", AssetType.IMAGE);
		
		className.set ("assets/images/pointer.png", __ASSET__assets_images_pointer_png);
		type.set ("assets/images/pointer.png", AssetType.IMAGE);
		
		className.set ("assets/images/SChool modified.png", __ASSET__assets_images_school_modified_png);
		type.set ("assets/images/SChool modified.png", AssetType.IMAGE);
		
		className.set ("assets/images/street.PNG", __ASSET__assets_images_street_png);
		type.set ("assets/images/street.PNG", AssetType.IMAGE);
		
		className.set ("assets/images/SWAG-Kid-Walk-Kopie.png", __ASSET__assets_images_swag_kid_walk_kopie_png);
		type.set ("assets/images/SWAG-Kid-Walk-Kopie.png", AssetType.IMAGE);
		
		className.set ("assets/images/tec.png", __ASSET__assets_images_tec_png);
		type.set ("assets/images/tec.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		
		className.set ("assets/images/Tilesheet_Complete.png", __ASSET__assets_images_tilesheet_complete_png);
		type.set ("assets/images/Tilesheet_Complete.png", AssetType.IMAGE);
		
		className.set ("assets/images/Tilesheet_Complete.psd", __ASSET__assets_images_tilesheet_complete_psd);
		type.set ("assets/images/Tilesheet_Complete.psd", AssetType.BINARY);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/music/select.wav", __ASSET__assets_music_select_wav);
		type.set ("assets/music/select.wav", AssetType.SOUND);
		
		className.set ("assets/music/townMusic.wav", __ASSET__assets_music_townmusic_wav);
		type.set ("assets/music/townMusic.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Abilities/Heal.mp3", __ASSET__assets_sounds_abilities_heal_mp3);
		type.set ("assets/sounds/Abilities/Heal.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/Heal1.mp3", __ASSET__assets_sounds_abilities_heal1_mp3);
		type.set ("assets/sounds/Abilities/Heal1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/PatIndoor.mp3", __ASSET__assets_sounds_abilities_patindoor_mp3);
		type.set ("assets/sounds/Abilities/PatIndoor.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/PatIndoor2.mp3", __ASSET__assets_sounds_abilities_patindoor2_mp3);
		type.set ("assets/sounds/Abilities/PatIndoor2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/PatKnigthmare.mp3", __ASSET__assets_sounds_abilities_patknigthmare_mp3);
		type.set ("assets/sounds/Abilities/PatKnigthmare.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/PatKnigthmare1.mp3", __ASSET__assets_sounds_abilities_patknigthmare1_mp3);
		type.set ("assets/sounds/Abilities/PatKnigthmare1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/PatOutdoor.mp3", __ASSET__assets_sounds_abilities_patoutdoor_mp3);
		type.set ("assets/sounds/Abilities/PatOutdoor.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/PatOutdoor1.mp3", __ASSET__assets_sounds_abilities_patoutdoor1_mp3);
		type.set ("assets/sounds/Abilities/PatOutdoor1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/Shield.mp3", __ASSET__assets_sounds_abilities_shield_mp3);
		type.set ("assets/sounds/Abilities/Shield.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/Shield1.mp3", __ASSET__assets_sounds_abilities_shield1_mp3);
		type.set ("assets/sounds/Abilities/Shield1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/Source/1.mp3", __ASSET__assets_sounds_abilities_source_1_mp3);
		type.set ("assets/sounds/Abilities/Source/1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/Source/2.mp3", __ASSET__assets_sounds_abilities_source_2_mp3);
		type.set ("assets/sounds/Abilities/Source/2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/Source/3.mp3", __ASSET__assets_sounds_abilities_source_3_mp3);
		type.set ("assets/sounds/Abilities/Source/3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Abilities/Source/Heal.wav", __ASSET__assets_sounds_abilities_source_heal_wav);
		type.set ("assets/sounds/Abilities/Source/Heal.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Abilities/Source/Heal1.wav", __ASSET__assets_sounds_abilities_source_heal1_wav);
		type.set ("assets/sounds/Abilities/Source/Heal1.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Abilities/Source/Hit_Hurt18.wav", __ASSET__assets_sounds_abilities_source_hit_hurt18_wav);
		type.set ("assets/sounds/Abilities/Source/Hit_Hurt18.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Abilities/Source/Hit_Hurt32.wav", __ASSET__assets_sounds_abilities_source_hit_hurt32_wav);
		type.set ("assets/sounds/Abilities/Source/Hit_Hurt32.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav", __ASSET__assets_sounds_abilities_source_judge_o_metercoin_wav);
		type.set ("assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Abilities/Source/Push.wav", __ASSET__assets_sounds_abilities_source_push_wav);
		type.set ("assets/sounds/Abilities/Source/Push.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Abilities/Source/Push1.wav", __ASSET__assets_sounds_abilities_source_push1_wav);
		type.set ("assets/sounds/Abilities/Source/Push1.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Abilities/Source/Shield1.wav", __ASSET__assets_sounds_abilities_source_shield1_wav);
		type.set ("assets/sounds/Abilities/Source/Shield1.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Game/JUDGE-O-METERCOIN.mp3", __ASSET__assets_sounds_game_judge_o_metercoin_mp3);
		type.set ("assets/sounds/Game/JUDGE-O-METERCOIN.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Game/select-1.wav", __ASSET__assets_sounds_game_select_1_wav);
		type.set ("assets/sounds/Game/select-1.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Gesprek1.wav", __ASSET__assets_sounds_gesprek1_wav);
		type.set ("assets/sounds/Gesprek1.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3", __ASSET__assets_sounds_intromissie_1intropijltjestoetsen_mp3);
		type.set ("assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/2GoedGedaan.mp3", __ASSET__assets_sounds_intromissie_2goedgedaan_mp3);
		type.set ("assets/sounds/IntroMissie/2GoedGedaan.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/3PatInstructie.mp3", __ASSET__assets_sounds_intromissie_3patinstructie_mp3);
		type.set ("assets/sounds/IntroMissie/3PatInstructie.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/4TecInstructie1.mp3", __ASSET__assets_sounds_intromissie_4tecinstructie1_mp3);
		type.set ("assets/sounds/IntroMissie/4TecInstructie1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/5TecInstructie2.mp3", __ASSET__assets_sounds_intromissie_5tecinstructie2_mp3);
		type.set ("assets/sounds/IntroMissie/5TecInstructie2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/6ProfInstructie.mp3", __ASSET__assets_sounds_intromissie_6profinstructie_mp3);
		type.set ("assets/sounds/IntroMissie/6ProfInstructie.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroMissie/7IntroOutro.mp3", __ASSET__assets_sounds_intromissie_7introoutro_mp3);
		type.set ("assets/sounds/IntroMissie/7IntroOutro.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/IntroVoice.mp3", __ASSET__assets_sounds_introvoice_mp3);
		type.set ("assets/sounds/IntroVoice.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Gesprek1.mp3", __ASSET__assets_sounds_missie1_gesprek1_mp3);
		type.set ("assets/sounds/Missie1/Gesprek1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof1_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof1-4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof2_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof2-4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", __ASSET__assets_sounds_missie1_kind1_prof3_4_mp3);
		type.set ("assets/sounds/Missie1/Kind1/Prof3-4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof1_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof1-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof2_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof2-1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", __ASSET__assets_sounds_missie1_kind2_prof3_1_mp3);
		type.set ("assets/sounds/Missie1/Kind2/Prof3-1.mp3", AssetType.MUSIC);
		
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
		
		className.set ("assets/sounds/Missie1/Test/Prof1-3.mp3", __ASSET__assets_sounds_missie1_test_prof1_3_mp3);
		type.set ("assets/sounds/Missie1/Test/Prof1-3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Test/Prof2-3.mp3", __ASSET__assets_sounds_missie1_test_prof2_3_mp3);
		type.set ("assets/sounds/Missie1/Test/Prof2-3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Test/Prof3-3.mp3", __ASSET__assets_sounds_missie1_test_prof3_3_mp3);
		type.set ("assets/sounds/Missie1/Test/Prof3-3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Test/Teacher1.mp3", __ASSET__assets_sounds_missie1_test_teacher1_mp3);
		type.set ("assets/sounds/Missie1/Test/Teacher1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie1/Test/Teacher2.mp3", __ASSET__assets_sounds_missie1_test_teacher2_mp3);
		type.set ("assets/sounds/Missie1/Test/Teacher2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Dad1.mp3", __ASSET__assets_sounds_missie2_dad1_mp3);
		type.set ("assets/sounds/Missie2/Dad1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Dad2.mp3", __ASSET__assets_sounds_missie2_dad2_mp3);
		type.set ("assets/sounds/Missie2/Dad2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Missie2/Dad3.mp3", __ASSET__assets_sounds_missie2_dad3_mp3);
		type.set ("assets/sounds/Missie2/Dad3.mp3", AssetType.MUSIC);
		
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
		
		className.set ("assets/sounds/Music/Chase.mp3", __ASSET__assets_sounds_music_chase_mp3);
		type.set ("assets/sounds/Music/Chase.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Music/Haahn's Dutch.wav", __ASSET__assets_sounds_music_haahn_s_dutch_wav);
		type.set ("assets/sounds/Music/Haahn's Dutch.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Music/Lab Junk.wav", __ASSET__assets_sounds_music_lab_junk_wav);
		type.set ("assets/sounds/Music/Lab Junk.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Music/Puzzle.mp3", __ASSET__assets_sounds_music_puzzle_mp3);
		type.set ("assets/sounds/Music/Puzzle.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Music/Townsong.mp3", __ASSET__assets_sounds_music_townsong_mp3);
		type.set ("assets/sounds/Music/Townsong.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/Tjalle/Back.png", __ASSET__assets_sounds_tjalle_back_png);
		type.set ("assets/sounds/Tjalle/Back.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/Tjalle/Grass Flower 64x64.png", __ASSET__assets_sounds_tjalle_grass_flower_64x64_png);
		type.set ("assets/sounds/Tjalle/Grass Flower 64x64.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/Tjalle/NewRoadTiles.png", __ASSET__assets_sounds_tjalle_newroadtiles_png);
		type.set ("assets/sounds/Tjalle/NewRoadTiles.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/Tjalle/Police.png", __ASSET__assets_sounds_tjalle_police_png);
		type.set ("assets/sounds/Tjalle/Police.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/Tjalle/Schooltile.png", __ASSET__assets_sounds_tjalle_schooltile_png);
		type.set ("assets/sounds/Tjalle/Schooltile.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/Tjalle/Trashcan.png", __ASSET__assets_sounds_tjalle_trashcan_png);
		type.set ("assets/sounds/Tjalle/Trashcan.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/Tjalle/Water.png", __ASSET__assets_sounds_tjalle_water_png);
		type.set ("assets/sounds/Tjalle/Water.png", AssetType.IMAGE);
		
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

@:keep @:bind #if display private #end class __ASSET__assets_data_basemap_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_basemap1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_basemap2_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level_1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level_2_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level_3_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level_4_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_mission1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_mission1_0_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_mission1_1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_reachtshelden_oep extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_room_001_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_angrydad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_baldmission1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_charactertilesheet768x768_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_coin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_collectingspirit_kopie_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemy_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemy_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemy_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_furniture_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_girlmission1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_health_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_ion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mission1girl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mission2football_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mission3emokid_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_npccharactertilesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pointer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_school_modified_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_street_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_swag_kid_walk_kopie_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tec_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilesheet_complete_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilesheet_complete_psd extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_select_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_townmusic_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_heal_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_heal1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_patindoor_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_patindoor2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_patknigthmare_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_patknigthmare1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_patoutdoor_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_patoutdoor1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_shield_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_shield1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_heal_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_heal1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_hit_hurt18_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_hit_hurt32_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_judge_o_metercoin_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_push_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_push1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_abilities_source_shield1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_game_judge_o_metercoin_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_game_select_1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_gesprek1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_1intropijltjestoetsen_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_2goedgedaan_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_3patinstructie_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_4tecinstructie1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_5tecinstructie2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_6profinstructie_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_intromissie_7introoutro_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_introvoice_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_gesprek1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof1_4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof2_4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof3_4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof1_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof2_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof3_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof1_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof2_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof3_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof4_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_prof4_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_test_prof1_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_test_prof2_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_test_prof3_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_test_teacher1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie1_test_teacher2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_dad1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_dad2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_dad3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_prof1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_prof2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_prof3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_prof4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_missie2_prof5_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_chase_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_haahn_s_dutch_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_lab_junk_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_puzzle_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_music_townsong_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tjalle_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tjalle_grass_flower_64x64_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tjalle_newroadtiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tjalle_police_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tjalle_schooltile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tjalle_trashcan_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tjalle_water_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5























































































































#else



#if (windows || mac || linux)


@:file("assets/data/BaseMap.oel") #if display private #end class __ASSET__assets_data_basemap_oel extends lime.utils.ByteArray {}
@:file("assets/data/basemap1.oel") #if display private #end class __ASSET__assets_data_basemap1_oel extends lime.utils.ByteArray {}
@:file("assets/data/basemap2.oel") #if display private #end class __ASSET__assets_data_basemap2_oel extends lime.utils.ByteArray {}
@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/data/level_1.oel") #if display private #end class __ASSET__assets_data_level_1_oel extends lime.utils.ByteArray {}
@:file("assets/data/level_2.oel") #if display private #end class __ASSET__assets_data_level_2_oel extends lime.utils.ByteArray {}
@:file("assets/data/level_3.oel") #if display private #end class __ASSET__assets_data_level_3_oel extends lime.utils.ByteArray {}
@:file("assets/data/level_4.oel") #if display private #end class __ASSET__assets_data_level_4_oel extends lime.utils.ByteArray {}
@:file("assets/data/Mission1.oel") #if display private #end class __ASSET__assets_data_mission1_oel extends lime.utils.ByteArray {}
@:file("assets/data/Mission1_0.oel") #if display private #end class __ASSET__assets_data_mission1_0_oel extends lime.utils.ByteArray {}
@:file("assets/data/Mission1_1.oel") #if display private #end class __ASSET__assets_data_mission1_1_oel extends lime.utils.ByteArray {}
@:file("assets/data/reachtshelden.oep") #if display private #end class __ASSET__assets_data_reachtshelden_oep extends lime.utils.ByteArray {}
@:file("assets/data/room-001.oel") #if display private #end class __ASSET__assets_data_room_001_oel extends lime.utils.ByteArray {}
@:image("assets/images/AngryDad.png") #if display private #end class __ASSET__assets_images_angrydad_png extends lime.graphics.Image {}
@:image("assets/images/BaldMission1.png") #if display private #end class __ASSET__assets_images_baldmission1_png extends lime.graphics.Image {}
@:image("assets/images/button.png") #if display private #end class __ASSET__assets_images_button_png extends lime.graphics.Image {}
@:image("assets/images/CharacterTilesheet768x768.png") #if display private #end class __ASSET__assets_images_charactertilesheet768x768_png extends lime.graphics.Image {}
@:image("assets/images/coin.png") #if display private #end class __ASSET__assets_images_coin_png extends lime.graphics.Image {}
@:image("assets/images/CollectingSpirit Kopie.png") #if display private #end class __ASSET__assets_images_collectingspirit_kopie_png extends lime.graphics.Image {}
@:image("assets/images/enemy-0.png") #if display private #end class __ASSET__assets_images_enemy_0_png extends lime.graphics.Image {}
@:image("assets/images/enemy-1.png") #if display private #end class __ASSET__assets_images_enemy_1_png extends lime.graphics.Image {}
@:image("assets/images/enemy-2.png") #if display private #end class __ASSET__assets_images_enemy_2_png extends lime.graphics.Image {}
@:image("assets/images/Furniture.png") #if display private #end class __ASSET__assets_images_furniture_png extends lime.graphics.Image {}
@:image("assets/images/girlMission1.png") #if display private #end class __ASSET__assets_images_girlmission1_png extends lime.graphics.Image {}
@:image("assets/images/health.png") #if display private #end class __ASSET__assets_images_health_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/images/ion.png") #if display private #end class __ASSET__assets_images_ion_png extends lime.graphics.Image {}
@:image("assets/images/Mission1Girl.png") #if display private #end class __ASSET__assets_images_mission1girl_png extends lime.graphics.Image {}
@:image("assets/images/Mission2Football.png") #if display private #end class __ASSET__assets_images_mission2football_png extends lime.graphics.Image {}
@:image("assets/images/Mission3Emokid.png") #if display private #end class __ASSET__assets_images_mission3emokid_png extends lime.graphics.Image {}
@:image("assets/images/NPCCharacterTilesheet.png") #if display private #end class __ASSET__assets_images_npccharactertilesheet_png extends lime.graphics.Image {}
@:image("assets/images/pat.png") #if display private #end class __ASSET__assets_images_pat_png extends lime.graphics.Image {}
@:image("assets/images/player.png") #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:image("assets/images/pointer.png") #if display private #end class __ASSET__assets_images_pointer_png extends lime.graphics.Image {}
@:image("assets/images/SChool modified.png") #if display private #end class __ASSET__assets_images_school_modified_png extends lime.graphics.Image {}
@:image("assets/images/street.PNG") #if display private #end class __ASSET__assets_images_street_png extends lime.graphics.Image {}
@:image("assets/images/SWAG-Kid-Walk-Kopie.png") #if display private #end class __ASSET__assets_images_swag_kid_walk_kopie_png extends lime.graphics.Image {}
@:image("assets/images/tec.png") #if display private #end class __ASSET__assets_images_tec_png extends lime.graphics.Image {}
@:image("assets/images/tiles.png") #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:image("assets/images/Tilesheet_Complete.png") #if display private #end class __ASSET__assets_images_tilesheet_complete_png extends lime.graphics.Image {}
@:file("assets/images/Tilesheet_Complete.psd") #if display private #end class __ASSET__assets_images_tilesheet_complete_psd extends lime.utils.ByteArray {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/music/select.wav") #if display private #end class __ASSET__assets_music_select_wav extends lime.utils.ByteArray {}
@:file("assets/music/townMusic.wav") #if display private #end class __ASSET__assets_music_townmusic_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Heal.mp3") #if display private #end class __ASSET__assets_sounds_abilities_heal_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Heal1.mp3") #if display private #end class __ASSET__assets_sounds_abilities_heal1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/PatIndoor.mp3") #if display private #end class __ASSET__assets_sounds_abilities_patindoor_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/PatIndoor2.mp3") #if display private #end class __ASSET__assets_sounds_abilities_patindoor2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/PatKnigthmare.mp3") #if display private #end class __ASSET__assets_sounds_abilities_patknigthmare_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/PatKnigthmare1.mp3") #if display private #end class __ASSET__assets_sounds_abilities_patknigthmare1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/PatOutdoor.mp3") #if display private #end class __ASSET__assets_sounds_abilities_patoutdoor_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/PatOutdoor1.mp3") #if display private #end class __ASSET__assets_sounds_abilities_patoutdoor1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Shield.mp3") #if display private #end class __ASSET__assets_sounds_abilities_shield_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Shield1.mp3") #if display private #end class __ASSET__assets_sounds_abilities_shield1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/1.mp3") #if display private #end class __ASSET__assets_sounds_abilities_source_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/2.mp3") #if display private #end class __ASSET__assets_sounds_abilities_source_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/3.mp3") #if display private #end class __ASSET__assets_sounds_abilities_source_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/Heal.wav") #if display private #end class __ASSET__assets_sounds_abilities_source_heal_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/Heal1.wav") #if display private #end class __ASSET__assets_sounds_abilities_source_heal1_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/Hit_Hurt18.wav") #if display private #end class __ASSET__assets_sounds_abilities_source_hit_hurt18_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/Hit_Hurt32.wav") #if display private #end class __ASSET__assets_sounds_abilities_source_hit_hurt32_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/JUDGE-O-METERCOIN.wav") #if display private #end class __ASSET__assets_sounds_abilities_source_judge_o_metercoin_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/Push.wav") #if display private #end class __ASSET__assets_sounds_abilities_source_push_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/Push1.wav") #if display private #end class __ASSET__assets_sounds_abilities_source_push1_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Abilities/Source/Shield1.wav") #if display private #end class __ASSET__assets_sounds_abilities_source_shield1_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Game/JUDGE-O-METERCOIN.mp3") #if display private #end class __ASSET__assets_sounds_game_judge_o_metercoin_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Game/select-1.wav") #if display private #end class __ASSET__assets_sounds_game_select_1_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Gesprek1.wav") #if display private #end class __ASSET__assets_sounds_gesprek1_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/1IntroPijltjestoetsen.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_1intropijltjestoetsen_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/2GoedGedaan.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_2goedgedaan_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/3PatInstructie.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_3patinstructie_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/4TecInstructie1.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_4tecinstructie1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/5TecInstructie2.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_5tecinstructie2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/6ProfInstructie.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_6profinstructie_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroMissie/7IntroOutro.mp3") #if display private #end class __ASSET__assets_sounds_intromissie_7introoutro_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/IntroVoice.mp3") #if display private #end class __ASSET__assets_sounds_introvoice_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Gesprek1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_gesprek1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind1/Prof1-4.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof1_4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind1/Prof2-4.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof2_4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind1/Prof3-4.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind1_prof3_4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind2/Prof1-1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof1_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind2/Prof2-1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof2_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind2/Prof3-1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind2_prof3_1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Prof1-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof1_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Prof2-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof2_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Prof3-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof3_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Kind3/Prof4-2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_kind3_prof4_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Prof4-3.mp3") #if display private #end class __ASSET__assets_sounds_missie1_prof4_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Test/Prof1-3.mp3") #if display private #end class __ASSET__assets_sounds_missie1_test_prof1_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Test/Prof2-3.mp3") #if display private #end class __ASSET__assets_sounds_missie1_test_prof2_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Test/Prof3-3.mp3") #if display private #end class __ASSET__assets_sounds_missie1_test_prof3_3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Test/Teacher1.mp3") #if display private #end class __ASSET__assets_sounds_missie1_test_teacher1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie1/Test/Teacher2.mp3") #if display private #end class __ASSET__assets_sounds_missie1_test_teacher2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Dad1.mp3") #if display private #end class __ASSET__assets_sounds_missie2_dad1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Dad2.mp3") #if display private #end class __ASSET__assets_sounds_missie2_dad2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Dad3.mp3") #if display private #end class __ASSET__assets_sounds_missie2_dad3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Prof1.mp3") #if display private #end class __ASSET__assets_sounds_missie2_prof1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Prof2.mp3") #if display private #end class __ASSET__assets_sounds_missie2_prof2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Prof3.mp3") #if display private #end class __ASSET__assets_sounds_missie2_prof3_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Prof4.mp3") #if display private #end class __ASSET__assets_sounds_missie2_prof4_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Missie2/Prof5.mp3") #if display private #end class __ASSET__assets_sounds_missie2_prof5_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Chase.mp3") #if display private #end class __ASSET__assets_sounds_music_chase_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Haahn's Dutch.wav") #if display private #end class __ASSET__assets_sounds_music_haahn_s_dutch_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Lab Junk.wav") #if display private #end class __ASSET__assets_sounds_music_lab_junk_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Puzzle.mp3") #if display private #end class __ASSET__assets_sounds_music_puzzle_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Music/Townsong.mp3") #if display private #end class __ASSET__assets_sounds_music_townsong_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/sounds/Tjalle/Back.png") #if display private #end class __ASSET__assets_sounds_tjalle_back_png extends lime.graphics.Image {}
@:image("assets/sounds/Tjalle/Grass Flower 64x64.png") #if display private #end class __ASSET__assets_sounds_tjalle_grass_flower_64x64_png extends lime.graphics.Image {}
@:image("assets/sounds/Tjalle/NewRoadTiles.png") #if display private #end class __ASSET__assets_sounds_tjalle_newroadtiles_png extends lime.graphics.Image {}
@:image("assets/sounds/Tjalle/Police.png") #if display private #end class __ASSET__assets_sounds_tjalle_police_png extends lime.graphics.Image {}
@:image("assets/sounds/Tjalle/Schooltile.png") #if display private #end class __ASSET__assets_sounds_tjalle_schooltile_png extends lime.graphics.Image {}
@:image("assets/sounds/Tjalle/Trashcan.png") #if display private #end class __ASSET__assets_sounds_tjalle_trashcan_png extends lime.graphics.Image {}
@:image("assets/sounds/Tjalle/Water.png") #if display private #end class __ASSET__assets_sounds_tjalle_water_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,8/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,8/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}



#end

#if openfl

#end

#end
#end

