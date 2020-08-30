-- STRUCTURE 
-- [1] : Integer - ID of the music (new system)
-- [2] : String - Path of the music file or [name of the music file when using PlaySoundKitID]
-- [3] : Integer - Length of the music file in seconds
-- [4] : Integer - Blizzard File ID

-- Get localization
local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Blizzard Music Rolls
local music = {
	{
		id = 250,
		name = L["TITLE_BLIZZJB_WOD-6.1"],
		files = {
			{2526, "Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3", 161, 53223},
			{2527, "Sound\\Music\\GlueScreenMusic\\BC_main_theme.mp3", 227, 53220},
			{2528, "Sound\\Music\\GlueScreenMusic\\WotLK_main_title.mp3", 549, 53222},
			{2529, "Sound\\Music\\cataclysm\\MUS_Shattering_UU01.mp3", 726, 441737},
			{2530, "Sound\\Music\\Pandaria\\MUS_50_HeartofPandaria_01.mp3", 480, 625753},
			{2531, "Sound\\Music\\Draenor\\MUS_60_ASiegeofWorlds_MainTitle.mp3", 727, 1042428},
			{2532, "Sound\\Music\\Musical Moments\\angelic\\angelic01.mp3", 48, 53224},
			{2533, "Sound\\Music\\ZoneMusic\\GhostMusic\\GhostMusic03.mp3", 62, 53519},
			{2534, "Sound\\Music\\ZoneMusic\\Mountain\\NightMountain01.mp3", 64, 53580},
			{2535, "Sound\\Music\\Musical Moments\\magic\\magic01-moment.mp3", 64, 53236},
			{2536, "Sound\\Music\\ZoneMusic\\BlackTemple\\BT_ArrivalWalkHero01.mp3", 164, 53305},
			{2537, "Sound\\Music\\Draenor\\MUS_Invincible.mp3", 197, 1100052},
			{2538, "Sound\\Music\\ZoneMusic\\Karazhan\\KA_OperaHarpsiWalkUni01.mp3", 82, 53568},
			{2539, "Sound\\Music\\ZoneMusic\\ArgentColiseum\\CR_TourneyBattle01UniWalk.mp3", 145, 316406},
			{2540, "Sound\\Music\\GlueScreenMusic\\BCCredits_Lament_of_the_Highborne.mp3", 171, 53221},
			{2541, "Sound\\Music\\cataclysm\\MUS_41_faeriedragon_UE01.mp3", 132, 521000},
			{2542, "Sound\\Music\\ZoneMusic\\GrizzlyHills\\GH_Intro2Uni01.mp3", 149, 229835},
			{2543, "Sound\\Music\\ZoneMusic\\StormPeaks\\SP_GeneralWalkA_Day01.mp3", 87, 229953},
			{2544, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_51_DarkmoonFaire_MerryGoRound_01.mp3", 180, 772749},
			{2545, "Sound\\Music\\ZoneMusic\\Ghostlands\\GL_ShalandisWalkUni01.mp3", 131, 53516},
			{2546, "Sound\\Music\\Pandaria\\MUS_50_Monk_Windwalker_A_Hero_02.mp3", 82, 642246},
			{2547, "Sound\\Music\\Pandaria\\MUS_50_SongofLiulang_Inst_Hero_01.mp3", 168, 629416},
			{2548, "Sound\\Music\\CityMusic\\Stormwind\\stormwind_intro-moment.mp3", 66, 53211},
			{2549, "Sound\\Music\\CityMusic\\Orgrimmar\\orgrimmar_intro-moment.mp3", 40, 53201},
			{2550, "Sound\\Music\\CityMusic\\Stormwind\\stormwind_highSeas-moment.mp3", 133, 53210},
			{2551, "Sound\\Music\\cataclysm\\MUS_WarMarch_UU01.mp3", 136, 441847},
			{2552, "Sound\\Music\\CityMusic\\Ironforge\\IronForge Intro.mp3", 86, 53191},
			{2553, "Sound\\Music\\CityMusic\\Undercity\\undercityintro-moment.mp3", 28, 53219},
			{2554, "Sound\\Music\\cataclysm\\MUS_ColdMountain_GU01.mp3", 151, 441545},
			{2555, "Sound\\Music\\CityMusic\\Thunderbluff\\Thunderbluff Intro.mp3", 46, 53212},
			{2556, "Sound\\Music\\cataclysm\\MUS_NightElves_GU01.mp3", 160, 441705},
			{2557, "Sound\\Music\\cataclysm\\MUS_MulgorePlains_GU01.mp3", 90, 441699},
			{2558, "Sound\\Music\\event\\gnomeregan_event_intro.mp3", 88, 369058},
			{2559, "Sound\\Music\\Musical Moments\\ZulGurubVooDoo.mp3", 84, 53254},
			{2560, "Sound\\Music\\CityMusic\\Ironforge\\tinkertownintro_moment.mp3", 52, 53196},
			{2561, "Sound\\Music\\Pandaria\\MUS_52_Zandalari_1_A_01.mp3", 72, 840521},
			{2562, "Sound\\Music\\ZoneMusic\\Azuremyst\\AI_ExodarIntro01.mp3", 82, 53282},
			{2563, "Sound\\Music\\ZoneMusic\\Eversong\\ES_SilvermoonIntro01.mp3", 132, 53473},
			{2564, "Sound\\Music\\cataclysm\\MUS_AllianceHero_UU01.mp3", 195, 441525},
			{2565, "Sound\\Music\\cataclysm\\MUS_LIRescue_EU04.mp3", 87, 443306},
		},
	},
}

GJB.musictable[GJB.EXP_BLIZZJB] = music
