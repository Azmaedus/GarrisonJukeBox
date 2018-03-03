-- STRUCTURE 
-- [1] : Integer - ID of the music (new system)
-- [2] : String - Path of the music file or [name of the music file when using PlaySoundKitID]
-- [3] : Integer - Length of the music file in seconds

-- Get localization
local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Blizzard Music Rolls
local music = {
	{
		id = 250,
		name = L["TITLE_BLIZZJB_WOD-6.1"],
		files = {
			{2526, "Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3", 161},
			{2527, "Sound\\Music\\GlueScreenMusic\\BC_main_theme.mp3", 227},
			{2528, "Sound\\Music\\GlueScreenMusic\\WotLK_main_title.mp3", 549},
			{2529, "Sound\\Music\\cataclysm\\MUS_Shattering_UU01.mp3", 726},
			{2530, "Sound\\Music\\Pandaria\\MUS_50_HeartofPandaria_01.mp3", 480},
			{2531, "Sound\\Music\\Draenor\\MUS_60_ASiegeofWorlds_MainTitle.mp3", 727},
			{2532, "Sound\\Music\\Musical Moments\\angelic\\angelic01.mp3", 48},
			{2533, "Sound\\Music\\ZoneMusic\\GhostMusic\\GhostMusic03.mp3", 62},
			{2534, "Sound\\Music\\ZoneMusic\\Mountain\\NightMountain01.mp3", 64},
			{2535, "Sound\\Music\\Musical Moments\\magic\\magic01-moment.mp3", 64},
			{2536, "Sound\\Music\\ZoneMusic\\BlackTemple\\BT_ArrivalWalkHero01.mp3", 164},
			{2537, "Sound\\Music\\Draenor\\MUS_Invincible.mp3", 197},
			{2538, "Sound\\Music\\ZoneMusic\\Karazhan\\KA_OperaHarpsiWalkUni01.mp3", 82},
			{2539, "Sound\\Music\\ZoneMusic\\ArgentColiseum\\CR_TourneyBattle01UniWalk.mp3", 145},
			{2540, "Sound\\Music\\GlueScreenMusic\\BCCredits_Lament_of_the_Highborne.mp3", 171},
			{2541, "Sound\\Music\\cataclysm\\MUS_41_faeriedragon_UE01.mp3", 132},
			{2542, "Sound\\Music\\ZoneMusic\\GrizzlyHills\\GH_Intro2Uni01.mp3", 149},
			{2543, "Sound\\Music\\ZoneMusic\\StormPeaks\\SP_GeneralWalkA_Day01.mp3", 87},
			{2544, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_51_DarkmoonFaire_MerryGoRound_01.mp3", 180},
			{2545, "Sound\\Music\\ZoneMusic\\Ghostlands\\GL_ShalandisWalkUni01.mp3", 131},
			{2546, "Sound\\Music\\Pandaria\\MUS_50_Monk_Windwalker_A_Hero_02.mp3", 82},
			{2547, "Sound\\Music\\Pandaria\\MUS_50_SongofLiulang_Inst_Hero_01.mp3", 168},
			{2548, "Sound\\Music\\CityMusic\\Stormwind\\stormwind_intro-moment.mp3", 66},
			{2549, "Sound\\Music\\CityMusic\\Orgrimmar\\orgrimmar_intro-moment.mp3", 40},
			{2550, "Sound\\Music\\CityMusic\\Stormwind\\stormwind_highSeas-moment.mp3", 133},
			{2551, "Sound\\Music\\cataclysm\\MUS_WarMarch_UU01.mp3", 136},
			{2552, "Sound\\Music\\CityMusic\\Ironforge\\IronForge Intro.mp3", 86},
			{2553, "Sound\\Music\\CityMusic\\Undercity\\undercityintro-moment.mp3", 28},
			{2554, "Sound\\Music\\cataclysm\\MUS_ColdMountain_GU01.mp3", 151},
			{2555, "Sound\\Music\\CityMusic\\Thunderbluff\\Thunderbluff Intro.mp3", 46},
			{2556, "Sound\\Music\\cataclysm\\MUS_NightElves_GU01.mp3", 160},
			{2557, "Sound\\Music\\cataclysm\\MUS_MulgorePlains_GU01.mp3", 90},
			{2558, "Sound\\Music\\event\\gnomeregan_event_intro.mp3", 88},
			{2559, "Sound\\Music\\Musical Moments\\ZulGurubVooDoo.mp3", 84},
			{2560, "Sound\\Music\\CityMusic\\Ironforge\\tinkertownintro_moment.mp3", 52},
			{2561, "Sound\\Music\\Pandaria\\MUS_52_Zandalari_1_A_01.mp3", 72},
			{2562, "Sound\\Music\\ZoneMusic\\Azuremyst\\AI_ExodarIntro01.mp3", 82},
			{2563, "Sound\\Music\\ZoneMusic\\Eversong\\ES_SilvermoonIntro01.mp3", 132},
			{2564, "Sound\\Music\\cataclysm\\MUS_AllianceHero_UU01.mp3", 195},
			{2565, "Sound\\Music\\cataclysm\\MUS_LIRescue_EU04.mp3", 87},
		},
	},
}

GJB.musictable[GJB.EXP_BLIZZJB] = music
