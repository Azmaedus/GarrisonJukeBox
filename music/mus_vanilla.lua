-- STRUCTURE 
-- [1] : Integer - ID of the music (new system)
-- [2] : String - Path of the music file
-- [3] : Integer - Length of the music file in seconds
-- [4] : Integer - Blizzard File ID

-- Get localization
local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Vanilla WoW
local music = {
	{
		id = 1,
		name = L["TITLE_MAIN_THEME"],
		files = {
			{1, "Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3", 161, 53223},
		},
	},
	{
		id = 2,
		name = L["TITLE_GHOSTMUSIC"],
		files = {
			{2, "Sound\\Music\\ZoneMusic\\GhostMusic\\GhostMusic03.mp3", 62, 53519},
		},
	},
	{
		id = 3,
		name = L["TITLE_ELWYNNFOREST"],
		files = {
			{3, "Sound\\Music\\ZoneMusic\\Forest\\DayForest01.mp3", 55, 53492},
			{4, "Sound\\Music\\ZoneMusic\\Forest\\DayForest02.mp3", 72, 53493},
			{5, "Sound\\Music\\ZoneMusic\\Forest\\DayForest03.mp3", 64, 53494},
			{6, "Sound\\Music\\ZoneMusic\\Forest\\NightForest01.mp3", 53, 53495},
			{7, "Sound\\Music\\ZoneMusic\\Forest\\NightForest02.mp3", 43, 53496},
			{8, "Sound\\Music\\ZoneMusic\\Forest\\NightForest03.mp3", 59, 53497},
			{9, "Sound\\Music\\ZoneMusic\\Forest\\NightForest04.mp3", 54, 53498},
		},
	},
	{
		id = 4,
		name = L["TITLE_TIRISFAL"],
		files = {
			{10, "Sound\\Music\\ZoneMusic\\EvilForest\\DayEvilForest01.mp3", 70, 53486},
			{11, "Sound\\Music\\ZoneMusic\\EvilForest\\DayEvilForest02.mp3", 72, 53487},
			{12, "Sound\\Music\\ZoneMusic\\EvilForest\\DayEvilForest03.mp3", 70, 53488},
			{13, "Sound\\Music\\ZoneMusic\\EvilForest\\NightEvilForest01.mp3", 57, 53489},
			{14, "Sound\\Music\\ZoneMusic\\EvilForest\\NightEvilForest02.mp3", 75, 53490},
			{15, "Sound\\Music\\ZoneMusic\\EvilForest\\NightEvilForest03.mp3", 70, 53491},
		},
	},
	{
		id = 5,
		name = L["TITLE_MOLTENCORE"],
		files = {
			{16, "Sound\\Music\\Musical Moments\\battle\\battle01.mp3", 48, 53225},
			{17, "Sound\\Music\\Musical Moments\\battle\\battle02.mp3", 62, 53226},
			{18, "Sound\\Music\\Musical Moments\\battle\\battle03.mp3", 27, 53227},
			{19, "Sound\\Music\\Musical Moments\\battle\\battle04.mp3", 36, 53228},
			{20, "Sound\\Music\\Musical Moments\\battle\\battle05.mp3", 44, 53229},
			{21, "Sound\\Music\\Musical Moments\\battle\\battle06.mp3", 62, 53230},
		},
	},
	{
		id = 6,
		name = L["TITLE_ASHENVALE"],
		files = {
			{22, "Sound\\Music\\ZoneMusic\\EnchantedForest\\EnchantedForest01.mp3", 50, 53453},
			{23, "Sound\\Music\\ZoneMusic\\EnchantedForest\\EnchantedForest02.mp3", 67, 53454},
			{24, "Sound\\Music\\ZoneMusic\\EnchantedForest\\EnchantedForest03.mp3", 235, 53455},
			{25, "Sound\\Music\\ZoneMusic\\EnchantedForest\\EnchantedForest04.mp3", 60, 53456},
			{26, "Sound\\Music\\ZoneMusic\\EnchantedForest\\EnchantedForest05.mp3", 70, 53457},
			{27, "Sound\\Music\\Musical Moments\\angelic\\angelic01.mp3", 48, 53224},
		},
	},
	{
		id = 7,
		name = L["TITLE_DARNASSUS"],
		files = {
			{28, "Sound\\Music\\CityMusic\\Darnassus\\Darnassus Intro.mp3", 40, 53183},
			{29, "Sound\\Music\\CityMusic\\Darnassus\\Darnassus Walking 1.mp3", 85, 53184},
			{30, "Sound\\Music\\CityMusic\\Darnassus\\Darnassus Walking 2.mp3", 69, 53185},
			{31, "Sound\\Music\\CityMusic\\Darnassus\\Darnassus Walking 3.mp3", 67, 53186},
			{32, "Sound\\Music\\CityMusic\\Darnassus\\Druid Grove.mp3", 45, 53187},
			{33, "Sound\\Music\\CityMusic\\Darnassus\\Warrior Terrace.mp3", 53, 53188},
		},
	},
	{
		id = 8,
		name = L["TITLE_GNOMERAGON"],
		files = {
			{34, "Sound\\Music\\CityMusic\\Gnomeragon\\gnomeragon01-zone.mp3", 64, 53189},
			{35, "Sound\\Music\\CityMusic\\Gnomeragon\\gnomeragon02-zone.mp3", 64, 53190},
		},
	},
	{
		id = 9,
		name = L["TITLE_IRONFORGE"],
		files = {
			{36, "Sound\\Music\\CityMusic\\Ironforge\\IronForge Intro.mp3", 86, 53191},
			{37, "Sound\\Music\\CityMusic\\Ironforge\\IronForge Walking 01.mp3", 123, 53192},
			{38, "Sound\\Music\\CityMusic\\Ironforge\\IronForge Walking 02.mp3", 50, 53193},
			{39, "Sound\\Music\\CityMusic\\Ironforge\\Ironforge Walking 03 (Glenn).mp3", 81, 53194},
			{40, "Sound\\Music\\CityMusic\\Ironforge\\Ironforge Walking 04.mp3", 70, 53195},
			{41, "Sound\\Music\\CityMusic\\Ironforge\\tinkertownintro_moment.mp3", 52, 53196},
		},
	},
	{
		id = 10,
		name = L["TITLE_ORGRIMMAR"],
		files = {
			{42, "Sound\\Music\\CityMusic\\Orgrimmar\\orgrimmar01-moment.mp3", 69, 53197},
			{43, "Sound\\Music\\CityMusic\\Orgrimmar\\orgrimmar01-zone.mp3", 68, 53198},
			{44, "Sound\\Music\\CityMusic\\Orgrimmar\\orgrimmar02-moment.mp3", 62, 53199},
			{45, "Sound\\Music\\CityMusic\\Orgrimmar\\orgrimmar02-zone.mp3", 62, 53200},
			{46, "Sound\\Music\\CityMusic\\Orgrimmar\\orgrimmar_intro-moment.mp3", 40, 53201},
		},
	},
	{
		id = 11,
		name = L["TITLE_STORMWIND"],
		files = {
			{47, "Sound\\Music\\CityMusic\\Stormwind\\stormwind01-moment.mp3", 54, 53202},
			{48, "Sound\\Music\\CityMusic\\Stormwind\\stormwind02-moment.mp3", 35, 53203},
			{49, "Sound\\Music\\CityMusic\\Stormwind\\stormwind03-moment.mp3", 70, 53204},
			{50, "Sound\\Music\\CityMusic\\Stormwind\\stormwind04-zone.mp3", 62, 53205},
			{51, "Sound\\Music\\CityMusic\\Stormwind\\stormwind05-zone.mp3", 61, 53206},
			{52, "Sound\\Music\\CityMusic\\Stormwind\\stormwind06-zone.mp3", 53, 53207},
			{53, "Sound\\Music\\CityMusic\\Stormwind\\stormwind07-zone.mp3", 87, 53208},
			{54, "Sound\\Music\\CityMusic\\Stormwind\\stormwind08-zone.mp3", 77, 53209},
			{55, "Sound\\Music\\CityMusic\\Stormwind\\stormwind_highSeas-moment.mp3", 133, 53210},
			{56, "Sound\\Music\\CityMusic\\Stormwind\\stormwind_intro-moment.mp3", 66, 53211},
		},
	},
	{
		id = 12,
		name = L["TITLE_THUNDERBLUFF"],
		files = {
			{57, "Sound\\Music\\CityMusic\\Thunderbluff\\Thunderbluff Intro.mp3", 46, 53212},
			{58, "Sound\\Music\\CityMusic\\Thunderbluff\\Thunderbluff Walking 01.mp3", 117, 53213},
			{59, "Sound\\Music\\CityMusic\\Thunderbluff\\Thunderbluff Walking 02.mp3", 116, 53214},
			{60, "Sound\\Music\\CityMusic\\Thunderbluff\\Thunderbluff Walking 03.mp3", 121, 53215},
		},
	},
	{
		id = 13,
		name = L["TITLE_UNDERCITY"],
		files = {
			{61, "Sound\\Music\\CityMusic\\Undercity\\undercity01-zone.mp3", 67, 53216},
			{62, "Sound\\Music\\CityMusic\\Undercity\\undercity02-zone.mp3", 85, 53217},
			{63, "Sound\\Music\\CityMusic\\Undercity\\undercity03-zone.mp3", 75, 53218},
			{64, "Sound\\Music\\CityMusic\\Undercity\\undercityintro-moment.mp3", 28, 53219},
		},
	},
	{
		id = 14,
		name = L["TITLE_AHNQIRAJ"],
		files = {
			{65, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajInterior1.mp3", 52, 53265},
			{66, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajInterior2.mp3", 81, 53266},
			{67, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajInterior3.mp3", 67, 53267},
			{68, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajInteriorCenterRoom1.mp3", 69, 53268},
			{69, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajInteriorIntroMain.mp3", 69, 53269},
			{70, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajKingRoom.mp3", 73, 53270},
			{71, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajTriangleRoom1.mp3", 23, 53271},
			{72, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajTriangleRoom2.mp3", 17, 53272},
			{73, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajTriangleRoom3.mp3", 15, 53273},
			{74, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajTriangleRoom4.mp3", 19, 53274},
			{75, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajTriangleRoom5.mp3", 31, 53275},
			{76, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajTriangleRoom6.mp3", 20, 53276},
			{77, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajTriangleRoom7.mp3", 17, 53277},
			{78, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajExteriorWalking1.mp3", 67, 53261},
			{79, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajExteriorWalking2.mp3", 84, 53262},
			{80, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajExteriorWalking3.mp3", 58, 53263},
			{81, "Sound\\Music\\ZoneMusic\\AhnQiraj\\AhnQirajExteriorWalking4.mp3", 59, 53264},
		},
	},
	{
		id = 15,
		name = L["TITLE_BARRENS"],
		files = {
			{82, "Sound\\Music\\ZoneMusic\\BarrenDry\\DayBarrenDry01.mp3", 64, 53299},
			{83, "Sound\\Music\\ZoneMusic\\BarrenDry\\DayBarrenDry02.mp3", 64, 53300},
			{84, "Sound\\Music\\ZoneMusic\\BarrenDry\\DayBarrenDry03.mp3", 55, 53301},
			{85, "Sound\\Music\\ZoneMusic\\BarrenDry\\NightBarrenDry01.mp3", 67, 53302},
			{86, "Sound\\Music\\ZoneMusic\\BarrenDry\\NightBarrenDry02.mp3", 41, 53303},
			{87, "Sound\\Music\\ZoneMusic\\BarrenDry\\NightBarrenDry03.mp3", 47, 53304},
		},
	},
	{
		id = 16,
		name = L["TITLE_FELWOOD"],
		files = {
			{88, "Sound\\Music\\ZoneMusic\\CursedLand\\CursedLand01.mp3", 54, 53426},
			{89, "Sound\\Music\\ZoneMusic\\CursedLand\\CursedLand02.mp3", 58, 53427},
			{90, "Sound\\Music\\ZoneMusic\\CursedLand\\CursedLand03.mp3", 64, 53428},
			{91, "Sound\\Music\\ZoneMusic\\CursedLand\\CursedLand04.mp3", 79, 53429},
			{92, "Sound\\Music\\ZoneMusic\\CursedLand\\CursedLand05.mp3", 82, 53430},
			{93, "Sound\\Music\\ZoneMusic\\CursedLand\\CursedLand06.mp3", 74, 53431},
		},
	},
	{
		id = 17,
		name = L["TITLE_TANARIS"],
		files = {
			{94, "Sound\\Music\\ZoneMusic\\Desert\\DayDesert01.mp3", 65, 53432},
			{95, "Sound\\Music\\ZoneMusic\\Desert\\DayDesert02.mp3", 81, 53433},
			{96, "Sound\\Music\\ZoneMusic\\Desert\\DayDesert03.mp3", 54, 53434},
			{97, "Sound\\Music\\ZoneMusic\\Desert\\NightDesert01.mp3", 77, 53435},
			{98, "Sound\\Music\\ZoneMusic\\Desert\\NightDesert02.mp3", 62, 53436},
			{99, "Sound\\Music\\ZoneMusic\\Desert\\NightDesert03.mp3", 57, 53437},
		},
	},
	{
		id = 18,
		name = L["TITLE_STRAGLETHORN"],
		files = {
			{100, "Sound\\Music\\ZoneMusic\\Jungle\\DayJungle01.mp3", 46, 53541},
			{101, "Sound\\Music\\ZoneMusic\\Jungle\\DayJungle02.mp3", 98, 53542},
			{102, "Sound\\Music\\ZoneMusic\\Jungle\\DayJungle03.mp3", 48, 53543},
			{103, "Sound\\Music\\ZoneMusic\\Jungle\\NightJungle01.mp3", 54, 53544},
			{104, "Sound\\Music\\ZoneMusic\\Jungle\\NightJungle02.mp3", 53, 53545},
			{105, "Sound\\Music\\ZoneMusic\\Jungle\\NightJungle03.mp3", 89, 53546},
		},
	},
	{
		id = 19,
		name = L["TITLE_WINTERSPRING"],
		files = {
			{106, "Sound\\Music\\ZoneMusic\\Mountain\\DayMountain01.mp3", 120, 53577},
			{107, "Sound\\Music\\ZoneMusic\\Mountain\\DayMountain02.mp3", 67, 53578},
			{108, "Sound\\Music\\ZoneMusic\\Mountain\\DayMountain03.mp3", 80, 53579},
			{109, "Sound\\Music\\ZoneMusic\\Mountain\\NightMountain01.mp3", 64, 53580},
			{110, "Sound\\Music\\ZoneMusic\\Mountain\\NightMountain02.mp3", 63, 53581},
			{111, "Sound\\Music\\ZoneMusic\\Mountain\\NightMountain03.mp3", 69, 53582},
			{112, "Sound\\Music\\ZoneMusic\\Mountain\\NightMountain04.mp3", 64, 53583},
		},
	},
	{
		id = 20,
		name = L["TITLE_NAXXRAMAS"],
		files = {
			{113, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasAbominationBoss1.mp3", 61, 53591},
			{114, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasAbominationBoss2.mp3", 67, 53592},
			{115, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasAbominationWing1.mp3", 61, 53593},
			{116, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasAbominationWing2.mp3", 66, 53594},
			{117, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasAbominationWing3.mp3", 61, 53595},
			{118, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasFrostwyrm1.mp3", 58, 53596},
			{119, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasFrostwyrm2.mp3", 82, 53597},
			{120, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasFrostwyrm3.mp3", 62, 53598},
			{121, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasFrostwyrm4.mp3", 60, 53599},
			{122, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasHubBase1.mp3", 72, 53600},
			{123, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasHubBase2.mp3", 81, 53601},
			{124, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasKelThuzad1.mp3", 95, 53602},
			{125, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasKelThuzad2.mp3", 97, 53603},
			{126, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasKelThuzad3.mp3", 75, 53604},
			{127, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasPlagueBoss1.mp3", 87, 53605},
			{128, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasPlagueWing1.mp3", 88, 53606},
			{129, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasPlagueWing2.mp3", 72, 53607},
			{130, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasPlagueWing3.mp3", 77, 53608},
			{131, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasSpiderBoss1.mp3", 60, 53609},
			{132, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasSpiderBoss2.mp3", 64, 53610},
			{133, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasSpiderWing1.mp3", 88, 53611},
			{134, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasSpiderWing2.mp3", 67, 53612},
			{135, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasSpiderWing3.mp3", 47, 53613},
			{136, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasWalking1.mp3", 102, 53614},
			{137, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasWalking2.mp3", 72, 53615},
			{138, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasWalking3.mp3", 87, 53616},
			{139, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasWalking4.mp3", 82, 53617},
			{140, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasWalking5.mp3", 100, 53618},
			{141, "Sound\\Music\\ZoneMusic\\Naxxramas\\NaxxramasWalking6.mp3", 99, 53619},
		},
	},
	{
		id = 21,
		name = L["TITLE_PLAINS"],
		files = {
			{142, "Sound\\Music\\ZoneMusic\\Plains\\DayPlains01.mp3", 53, 53680},
			{143, "Sound\\Music\\ZoneMusic\\Plains\\DayPlains02.mp3", 76, 53681},
			{144, "Sound\\Music\\ZoneMusic\\Plains\\NightPlains01.mp3", 58, 53682},
			{145, "Sound\\Music\\ZoneMusic\\Plains\\NightPlains02.mp3", 68, 53683},
		},
	},
	{
		id = 22,
		name = L["TITLE_SWAMPOFSORROWS"],
		files = {
			{146, "Sound\\Music\\ZoneMusic\\SoggyPlace\\soggyplace-zone1.mp3", 97, 53695},
			{147, "Sound\\Music\\ZoneMusic\\SoggyPlace\\soggyplace-zone2.mp3", 97, 53696},
			{148, "Sound\\Music\\ZoneMusic\\SoggyPlace\\soggyplace-zone3.mp3", 90, 53697},
			{149, "Sound\\Music\\ZoneMusic\\SoggyPlace\\soggyplace-zone4.mp3", 89, 53698},
			{150, "Sound\\Music\\ZoneMusic\\SoggyPlace\\soggyplace-zone5.mp3", 70, 53699},
		},
	},
	{
		id = 23,
		name = L["TITLE_BURNINGSTEPPES"],
		files = {
			{151, "Sound\\Music\\ZoneMusic\\Volcanic\\DayVolcanic01.mp3", 73, 53812},
			{152, "Sound\\Music\\ZoneMusic\\Volcanic\\DayVolcanic02.mp3", 87, 53813},
			{153, "Sound\\Music\\ZoneMusic\\Volcanic\\NightVolcanic01.mp3", 71, 53814},
			{154, "Sound\\Music\\ZoneMusic\\Volcanic\\NightVolcanic02.mp3", 64, 53815},
		},
	},
	{
		id = 24,
		name = L["TITLE_ZULAMAN"],
		files = {
			{155, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_AMB10.mp3", 113, 53825},
			{156, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_AMB11.mp3", 74, 53826},
			{157, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_AMB12.mp3", 108, 53827},
			{158, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_AMB13.mp3", 70, 53828},
			{159, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_AMB14.mp3", 90, 53829},
			{160, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_AMB15.mp3", 113, 53830},
			{161, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_BTL11.mp3", 136, 53831},
			{162, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_BTL12.mp3", 117, 53832},
			{163, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_BTL13.mp3", 40, 53833},
			{164, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_BTL14.mp3", 92, 53834},
			{165, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_BTL15.mp3", 79, 53835},
			{166, "Sound\\Music\\ZoneMusic\\Zulaman\\ZA_zulaman_VCT10.mp3", 80, 53836},
		},
	},
}

GJB.musictable[GJB.EXP_WOW] = music
