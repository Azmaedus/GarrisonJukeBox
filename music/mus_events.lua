-- STRUCTURE 
-- [1] : Integer - ID of the music (new system)
-- [2] : String - Path of the music file
-- [3] : Integer - Length of the music file in seconds
-- [4] : Integer - Blizzard File ID

-- Get localization
local GJB = LibStub("AceAddon-3.0"):GetAddon("GarrisonJukeBox")
local L = GJB.L -- local L = LibStub("AceLocale-3.0"):GetLocale("GarrisonJukeBox")

-- Events
local music = {
	{
		id = 233,
		name = L["TITLE_POWEROTHORDE"],
		files = {
			{2405, "Sound\\Music\\ZoneMusic\\DMF_L70ETC01.mp3", 282, 53438},
		},
	},
	{
		id = 234,
		name = L["TITLE_FIREFESTIVAL"],
		files = {
			{2406, "Sound\\Music\\WorldEvents\\AllianceFirepole.mp3", 68, 53255},
		},
	},
	{
		id = 235,
		name = L["TITLE_FIREFESTIVAL_HORDE"],
		files = {
			{2407, "Sound\\Music\\WorldEvents\\HordeFirepole.mp3", 72, 53260},
		},
	},
	{
		id = 236,
		name = L["TITLE_ARGENTTOURNY"],
		files = {
			{2408, "Sound\\Music\\ZoneMusic\\ArgentTournament\\AT_JoustEvent.mp3", 123, 303111},
		},
	},
	{
		id = 237,
		name = L["TITLE_TAVERN_ALLIANCE"],
		files = {
			{2409, "Sound\\Music\\ZoneMusic\\TavernAlliance\\TavernAlliance01.mp3", 47, 53737},
			{2410, "Sound\\Music\\ZoneMusic\\TavernAlliance\\TavernAlliance02.mp3", 51, 53738},
			{2411, "Sound\\Music\\ZoneMusic\\TavernHuman\\RA_HumanTavern1A.mp3", 92, 53748},
			{2412, "Sound\\Music\\ZoneMusic\\TavernHuman\\RA_HumanTavern1B.mp3", 79, 53749},
			{2413, "Sound\\Music\\ZoneMusic\\TavernHuman\\RA_HumanTavern2A.mp3", 86, 53750},
			{2414, "Sound\\Music\\ZoneMusic\\TavernHuman\\RA_HumanTavern2B.mp3", 81, 53751},
			{2415, "Sound\\Music\\ZoneMusic\\TavernHuman\\RA_Tavern1_RevisitedA.mp3", 70, 53752},
			{2416, "Sound\\Music\\ZoneMusic\\TavernHuman\\RA_Tavern1_RevisitedB.mp3", 72, 53753},
			{2417, "Sound\\Music\\ZoneMusic\\TavernDwarf\\RA_DwarfTavern1A.mp3", 79, 53739},
			{2418, "Sound\\Music\\ZoneMusic\\TavernDwarf\\RA_DwarfTavern1B.mp3", 82, 53740},
			{2419, "Sound\\Music\\ZoneMusic\\TavernDwarf\\RA_DwarfTavern2A.mp3", 86, 53741},
			{2420, "Sound\\Music\\ZoneMusic\\TavernDwarf\\RA_DwarfTavern2B.mp3", 92, 53742},
			{2421, "Sound\\Music\\ZoneMusic\\TavernDwarf\\RA_DwarfTavern3.mp3", 102, 53743},
			{2422, "Sound\\Music\\ZoneMusic\\TavernNightElf\\RA_TempleOfTheMoonA.mp3", 112, 53754},
			{2423, "Sound\\Music\\ZoneMusic\\TavernNightElf\\RA_TempleOfTheMoonB.mp3", 119, 53755},
		},
	},
	{
		id = 238,
		name = L["TITLE_TAVERN_HORDE"],
		files = {
			{2424, "Sound\\Music\\ZoneMusic\\TavernHorde\\TavernHorde01.mp3", 48, 53744},
			{2425, "Sound\\Music\\ZoneMusic\\TavernHorde\\TavernHorde02.mp3", 39, 53745},
			{2426, "Sound\\Music\\ZoneMusic\\TavernHorde\\TavernHorde03.mp3", 47, 53746},
			{2427, "Sound\\Music\\ZoneMusic\\TavernOrc\\RA_OrcRestArea1A.mp3", 100, 53756},
			{2428, "Sound\\Music\\ZoneMusic\\TavernOrc\\RA_OrcRestArea1B.mp3", 91, 53757},
			{2429, "Sound\\Music\\ZoneMusic\\TavernOrc\\RA_OrcRestArea2A.mp3", 87, 53758},
			{2430, "Sound\\Music\\ZoneMusic\\TavernOrc\\RA_OrcRestArea2B.mp3", 86, 53759},
			{2431, "Sound\\Music\\ZoneMusic\\TavernOrc\\RA_OrcRestArea3A.mp3", 86, 53760},
			{2432, "Sound\\Music\\ZoneMusic\\TavernOrc\\RA_OrcRestArea3B.mp3", 81, 53761},
			{2433, "Sound\\Music\\ZoneMusic\\TavernHorde\\undead_dance.mp3", 25, 53747},
			{2434, "Sound\\Music\\ZoneMusic\\TavernUndead\\RA_UndeadTavern1A.mp3", 93, 53774},
			{2435, "Sound\\Music\\ZoneMusic\\TavernUndead\\RA_UndeadTavern1B.mp3", 87, 53775},
			{2436, "Sound\\Music\\ZoneMusic\\TavernUndead\\RA_UndeadTavern2.mp3", 124, 53776},
			{2437, "Sound\\Music\\ZoneMusic\\TavernUndead\\RA_UndeadTavern3A.mp3", 83, 53777},
			{2438, "Sound\\Music\\ZoneMusic\\TavernUndead\\RA_UndeadTavern3B.mp3", 93, 53778},
			{2439, "Sound\\Music\\ZoneMusic\\TavernTauren\\RA_TaurenRestArea1A.mp3", 89, 53768},
			{2440, "Sound\\Music\\ZoneMusic\\TavernTauren\\RA_TaurenRestArea1B.mp3", 96, 53769},
			{2441, "Sound\\Music\\ZoneMusic\\TavernTauren\\RA_TaurenRestArea2A.mp3", 85, 53770},
			{2442, "Sound\\Music\\ZoneMusic\\TavernTauren\\RA_TaurenRestArea2B.mp3", 80, 53771},
			{2443, "Sound\\Music\\ZoneMusic\\TavernTauren\\RA_TaurenRestArea3A.mp3", 93, 53772},
			{2444, "Sound\\Music\\ZoneMusic\\TavernTauren\\RA_TaurenRestArea3B.mp3", 93, 53773},
		},
	},
	{
		id = 239,
		name = L["TITLE_TAVERN_PIRATE"],
		files = {
			{2445, "Sound\\Music\\ZoneMusic\\TavernPirate\\RA_PirateTavern1A.mp3", 83, 53762},
			{2446, "Sound\\Music\\ZoneMusic\\TavernPirate\\RA_PirateTavern1B.mp3", 81, 53763},
			{2447, "Sound\\Music\\ZoneMusic\\TavernPirate\\RA_PirateTavern2A.mp3", 82, 53764},
			{2448, "Sound\\Music\\ZoneMusic\\TavernPirate\\RA_PirateTavern2B.mp3", 81, 53765},
			{2449, "Sound\\Music\\ZoneMusic\\TavernPirate\\RA_PirateTavern3A.mp3", 88, 53766},
			{2450, "Sound\\Music\\ZoneMusic\\TavernPirate\\RA_PirateTavern3B.mp3", 85, 53767},
		},
	},
	{
		id = 240,
		name = L["TITLE_BREWFEST_ALLIANCE"],
		files = {
			{2451, "Sound\\Music\\ZoneMusic\\Brewfest\\BF_Dwarves1.mp3", 94, 228572},
			{2452, "Sound\\Music\\ZoneMusic\\Brewfest\\BF_Dwarves2.mp3", 115, 228573},
			{2453, "Sound\\Music\\ZoneMusic\\Brewfest\\BF_Dwarves3.mp3", 23, 228574},
		},
	},
	{
		id = 241,
		name = L["TITLE_BREWFEST_HORDE"],
		files = {
			{2454, "Sound\\Music\\ZoneMusic\\Brewfest\\BF_Goblins1.mp3", 67, 228575},
			{2455, "Sound\\Music\\ZoneMusic\\Brewfest\\BF_Goblins2.mp3", 93, 228576},
			{2456, "Sound\\Music\\ZoneMusic\\Brewfest\\BF_Goblins3.mp3", 28, 228577},
		},
	},
	{
		id = 242,
		name = L["TITLE_DARKMOON_FESTIVAL"],
		files = {
			{2457, "Sound\\Music\\WorldEvents\\DarkMoonFaire_1.mp3", 28, 53256},
			{2458, "Sound\\Music\\WorldEvents\\DarkMoonFaire_2.mp3", 74, 53257},
			{2459, "Sound\\Music\\WorldEvents\\DarkMoonFaire_3.mp3", 58, 53258},
			{2460, "Sound\\Music\\WorldEvents\\DarkMoonFaire_4.mp3", 37, 53259},
			{2461, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_43_DarkmoonFaireA_Hero_UU01.mp3", 61, 575638},
			{2462, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_43_DarkmoonFaireA_UU01.mp3", 59, 575639},
			{2463, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_43_DarkmoonFaireB_Hero_UU01.mp3", 71, 575640},
			{2464, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_43_DarkmoonFaireB_UU01.mp3", 97, 575641},
			{2465, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_43_DarkmoonFaireB_UU02.mp3", 89, 575642},
			{2466, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_43_DarkmoonFaireC_UU02.mp3", 172, 575643},
			{2467, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_43_DarkmoonFaireD_UU01.mp3", 86, 575816},
			{2468, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_43_DarkmoonFaireD_UU02.mp3", 106, 575817},
			{2469, "Sound\\Music\\ZoneMusic\\DarkmoonFaire\\MUS_51_DarkmoonFaire_MerryGoRound_01.mp3", 180, 772749},
		},
	},
	{
		id = 243,
		name = L["TITLE_GNOME_EVENT"],
		files = {
			{2470, "Sound\\Music\\event\\gnomeregan_event_B.mp3", 61, 369053},
			{2471, "Sound\\Music\\event\\gnomeregan_event_C.mp3", 35, 369054},
			{2472, "Sound\\Music\\event\\gnomeregan_event_complete.mp3", 63, 369055},
			{2473, "Sound\\Music\\event\\gnomeregan_event_D.mp3", 38, 369056},
			{2474, "Sound\\Music\\event\\gnomeregan_event_E.mp3", 34, 369057},
			{2475, "Sound\\Music\\event\\gnomeregan_event_intro.mp3", 88, 369058},
		},
	},
	{
		id = 244,
		name = L["TITLE_ZALAZANE_EVENT"],
		files = {
			{2476, "Sound\\Music\\event\\ZFBigBattle13.mp3", 54, 371365},
			{2477, "Sound\\Music\\event\\ZFBigBattle14.mp3", 61, 371366},
			{2478, "Sound\\Music\\event\\ZFBigBattle16.mp3", 65, 371367},
			{2479, "Sound\\Music\\event\\ZFMagic17.mp3", 87, 371368},
			{2480, "Sound\\Music\\event\\ZFMagic18.mp3", 69, 371369},
			{2481, "Sound\\Music\\event\\ZFMedBattle3.mp3", 39, 371370},
			{2482, "Sound\\Music\\event\\ZFMedBattle4.mp3", 37, 371371},
			{2483, "Sound\\Music\\event\\ZFMedBattle5.mp3", 30, 371372},
			{2484, "Sound\\Music\\event\\ZFMedBattle6.mp3", 39, 371373},
			{2485, "Sound\\Music\\event\\ZFQuiet1.mp3", 79, 371374},
			{2486, "Sound\\Music\\event\\ZFQuiet2.mp3", 87, 371375},
			{2487, "Sound\\Music\\event\\ZFQuiet7.mp3", 53, 371376},
			{2488, "Sound\\Music\\event\\ZFQuietShort8.mp3", 17, 371377},
			{2489, "Sound\\Music\\event\\ZFRally9.mp3", 67, 371378},
			{2490, "Sound\\Music\\event\\ZFStinger10.mp3", 22, 371379},
			{2491, "Sound\\Music\\event\\ZFStinger11.mp3", 13, 371380},
			{2492, "Sound\\Music\\event\\ZFStinger12.mp3", 10, 371381},
			{2493, "Sound\\Music\\event\\ZFStinger15.mp3", 9, 371382},
		},
	},
	{
		id = 245,
		name = L["TITLE_PETBATTLE_ALLI"],
		files = {
			{2494, "Sound\\Music\\PetBattles\\MUS_PB_ToyTrumpet.mp3", 93, 644931},
			{2495, "Sound\\Music\\PetBattles\\MUS_PB_W2_Human1.mp3", 128, 644404},
			{2496, "Sound\\Music\\PetBattles\\MUS_PB_W2_Human2.mp3", 110, 644405},
			{2497, "Sound\\Music\\PetBattles\\MUS_PB_W2_Human3.mp3", 112, 644406},
			{2498, "Sound\\Music\\PetBattles\\MUS_PB_W2_Human4.mp3", 158, 644932},
			{2499, "Sound\\Music\\PetBattles\\MUS_PB_W2_HumanVictory.mp3", 16, 644933},
			{2500, "Sound\\Music\\PetBattles\\MUS_PB_W2_HumanWarRoom.mp3", 47, 644407},
		},
	},
	{
		id = 246,
		name = L["TITLE_PETBATTLE_HORDE"],
		files = {
			{2501, "Sound\\Music\\PetBattles\\MUS_PB_W2_Orc1.mp3", 106, 644408},
			{2502, "Sound\\Music\\PetBattles\\MUS_PB_W2_Orc2.mp3", 122, 644409},
			{2503, "Sound\\Music\\PetBattles\\MUS_PB_W2_Orc3.mp3", 124, 644410},
			{2504, "Sound\\Music\\PetBattles\\MUS_PB_W2_Orc4.mp3", 121, 644934},
			{2505, "Sound\\Music\\PetBattles\\MUS_PB_W2_OrcVictory.mp3", 19, 644935},
			{2506, "Sound\\Music\\PetBattles\\MUS_PB_W2_OrcWarRoom.mp3", 35, 644411},
		},
	},
	{
		id = 247,
		name = L["TITLE_RING_OF_MUSHROOMS"],
		files = {
			{2507, "Sound\\Music\\cataclysm\\MUS_41_faeriedragon_UE01.mp3", 132, 521000},
		},
	},
	{
		id = 248,
		name = L["TITLE_MISC_PVP"],
		files = {
			{2508, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP6_01.mp3", 157, 521021},
			{2509, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP6_02.mp3", 162, 521022},
			{2510, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP7_01.mp3", 99, 521030},
			{2511, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP7_02.mp3", 99, 521031},
			{2512, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP7Moment1_01.mp3", 40, 521023},
			{2513, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP7Moment1_02.mp3", 42, 521024},
			{2514, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP7Moment2_01.mp3", 36, 521025},
			{2515, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP7Moment2_02.mp3", 36, 521026},
			{2516, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP7Moment3_01.mp3", 40, 521027},
			{2517, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP7StingerEnd_01.mp3", 31, 521028},
			{2518, "Sound\\Music\\ZoneMusic\\PVP\\MUS_PVP7StingerIntro_01.mp3", 21, 521029},
			{2519, "Sound\\Music\\ZoneMusic\\PVP\\pvp1.mp3", 47, 53684},
			{2520, "Sound\\Music\\ZoneMusic\\PVP\\pvp2.mp3", 52, 53685},
			{2521, "Sound\\Music\\ZoneMusic\\PVP\\pvp3.mp3", 40, 53686},
			{2522, "Sound\\Music\\ZoneMusic\\PVP\\pvp4.mp3", 63, 53687},
			{2523, "Sound\\Music\\ZoneMusic\\PVP\\pvp5.mp3", 62, 53688},
		},
	},
	{
		id = 249,
		name = L["TITLE_GARRISON"],
		files = {
			{2524, "Sound\\Music\\Draenor\\MUS_60_GarrisonBuildingComplete.mp3", 13, 1080412},
			{2525, "Sound\\Music\\Draenor\\MUS_60_GarrisonBuildingComplete2.mp3", 8, 1087470},
		},
	},
	{
		id = 332,
		name = L["TITLE_DIABLOTRISTRAMGUITAR"],
		files = {
			{3136, "Sound\\Music\\event\\mus_event_diabloanniversary_tristramguitar_a.mp3", 36, 1538384},
			{3137, "Sound\\Music\\event\\mus_event_diabloanniversary_tristramguitar_b.mp3", 33, 1538385},
			{3138, "Sound\\Music\\event\\mus_event_diabloanniversary_tristramguitar_c.mp3", 47, 1538386},
			{3139, "Sound\\Music\\event\\mus_event_diabloanniversary_tristramguitar_d.mp3", 37, 1538387},
		},
	},
	{
		id = 333,
		name = L["TITLE_GRAVESLAMENT"],
		files = {
			{3140, "Sound\\Music\\event\\mus_725_event_dmf_graveslament_music01.mp3", 312, 1676892},
		},
	},
	{
		id = 334,
		name = L["TITLE_BRAWLERSGUILD_GOBLIN"],
		files = {
			{3140, "Sound\\Music\\event\\mus_715_brawlersguild_goblin_drop_oneshot.mp3", 6, 1580108},
			{3141, "Sound\\Music\\event\\mus_715_brawlersguild_goblin_dropthebass.mp3", 16, 1580109},
			{3142, "Sound\\Music\\event\\mus_715_brawlersguild_goblin_thebeat.mp3", 47, 1580110},
			{3143, "Sound\\Music\\event\\mus_715_brawlersguild_goblin_dropthebassa.mp3", 16, 1580523},
			{3144, "Sound\\Music\\event\\mus_715_brawlersguild_goblin_dropthebassb.mp3", 18, 1580524},
			{3145, "Sound\\Music\\event\\mus_715_brawlersguild_goblin_drop_oneshotb.mp3", 3, 1582733},
		},
	},
}

GJB.musictable[GJB.EXP_EVENTS] = music
